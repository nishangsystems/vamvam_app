<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Traits\MessageStatusTrait;
use App\Mail\SuperAdminForgotOtpVerification;
use App\Models\User;
use Auth;
use Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
#Models
use Validator;

class LoginController extends Controller
{
    use MessageStatusTrait;

    protected $view = 'admin.auth.';

    protected $user;

    /**
     * default constructor
     * @param
     * @return
     */
    public function __construct(
                                  User $user
                               )
                               {
                                  $this->user = $user;
                               }

    
    public function index(Request $request)
    {
        return view($this->view . 'login');
    }


    public function login(Request $request)
    {
        #  Validate field Data
        $validator = Validator::make($request->all(), [
                                                        'email' => 'required',
                                                        'password' => 'required',
                                                      ]);
        if ($validator->fails()) 
        {
            return response()->json([
                                        'message' => $validator->errors()->first(),
                                        'code' => $this->failedStatus,
                                    ]);
        }

        #
        $credentials = $request->only('email', 'password');
        try {
            if (!Auth::guard('admin')->attempt($credentials)) {
                return response()->json([
                                            'message' => 'Given credential are not matched',
                                            'code' => $this->failedStatus,
                                        ]);
            } else {
                $user = Auth::guard('admin')->user();
                    return response()->json([
                        'message' => 'You have successfully logged in',
                        'code' => $this->successStatus,
                    ]);
            }
        } catch (\Exception $e) {
            # return response
            return response()->json([
                $this->responseCode => (string) $this->errorStatus,
                $this->responseMessage => 'Something Went Wrong',
            ]);
        }
    }

    
    public function profile(Request $request)
    {
        $user = Auth::guard('admin')->user();
        return view($this->view . 'profile', ['user' => $user]);

    }
    public function updateProfile(Request $request)
    {
        $rules = [
                    'name'   => 'required',
                    'mobile' =>'required|digits:10',
                    'email'  => 'required',
                 ];
        $messages = ['required' => 'The :attribute field is required.'];
        $validator = Validator::make($request->all(), $rules, $messages);
        if ($validator->fails()) {
            return response()->json([
                (string) $this->responseCode => (string) $this->errorStatus,
                (string) $this->responseMessage => $validator->errors()->first(),
            ]);
        }

           $user = Auth::guard('admin')->user();
           # check the requested email already exist or not
           $checkEmail = $this->user
                              ->where('email', $request->email)
                              ->where('id', '!=',$user->id)
                              ->first();
           
           if($checkEmail)
            {   
              return response()->json([
                                        (string)$this->responseCode=>(string)$this->errorStatus, 
                                        (string)$this->responseMessage => 'Sorry, this email already exist.'
                                      ]);  
            }  

        $user->name  = $request->name;
        $user->phone = $request->mobile;
        $user->email = $request->email;
        if ($request->image != null) 
        {
            $destinationpath = base_path() . '/public/images/admin';
            $filename = $request->image->getClientOriginalName();
            $fileExtension = $request->image->getClientOriginalExtension();
            $today_date = date('d-m-Y');
            $random_number = rand(1111, 9999);
            $filenameData = $today_date . '_' . $random_number . '_' . $filename;
            $movefilename = $request->image->move($destinationpath, $filenameData);
            $databsePathForImage = 'images/admin/' . $filenameData;
            $user->image = $databsePathForImage;
        }
        $user->save();
        return response()->json([
            $this->responseCode => (string) $this->successStatus,
            $this->responseMessage => 'Profile updated successfully.',
        ]);

    }

    public function updatePassword(Request $request)
    {
        $rules = [
            'old_password' => 'required',
            'new_password' => 'required',
            'conf_password' => 'required',
        ];
        $messages = ['required' => 'The :attribute field is required.'];
        $validator = Validator::make($request->all(), $rules, $messages);
        if ($validator->fails()) {
            return response()->json([
                (string) $this->responseCode => (string) $this->errorStatus,
                (string) $this->responseMessage => 'Required field is missing.',
            ]);
        }
        $user = Auth::guard('admin')->user();

        if (Hash::check($request->old_password, $user->password)) {
            if (!Hash::check($request->new_password, $user->password)) {

                if ($request->new_password == $request->conf_password) {
                    $user->password = Hash::make($request->new_password);
                    //$user->password_text = $request->new_password;
                    $user->save();
                    return response()->json([
                        $this->responseCode => (string) $this->successStatus,
                        $this->responseMessage => 'Password updated successfully.',
                    ]);
                }
                return response()->json([
                    (string) $this->responseCode => (string) $this->errorStatus,
                    (string) $this->responseMessage => 'Confirm Password do not match.',
                ]);
            }
            return response()->json([
                (string) $this->responseCode => (string) $this->errorStatus,
                (string) $this->responseMessage => 'Old Password And New Password Can Not be Same!',
            ]);
        }
        return response()->json([
            (string) $this->responseCode => (string) $this->errorStatus,
            (string) $this->responseMessage => 'Old Password do not match.',
        ]);

    }

    public function logout()
    {
        Auth::guard('admin')->logout();
        return redirect()->route('admin_login');
    }

    public function forgotPassword(Request $request)
    {
        return view($this->view . 'send_otp');
    }
    public function sendOTP(Request $request)
    {
        $data = ['email' => 'required'];

        # validation check
        $validator = Validator::make($request->all(), $data);
        if ($validator->fails()) {
            return Redirect::back()->withErrors('Required field is missing')->withInput($request->all());
        }

        try
        {
            $count = $this->user
                          ->where('email', $request->email)
                          ->count(); 

            if ($count > 0) 
            {
                $user = $this->user
                             ->where('email', $request->email)
                             ->first();
                if ($user) 
                {
                    $subject = 'Request for Forget Password please verify your OTP!';
                    $email = base64_encode($request->email);
                    $message = base64_decode($request->email);
                    $url = url('/admin_verify_otp') . '/' . base64_encode($request->otp ?? '');
                    $otp = rand('1000', '9999');

                    $user->save();

                    Mail::to($request->email)->send(new SuperAdminForgotOtpVerification($user, $subject, $otp));
                  
                    if ($user) {

                        $data = $this->user->where('email', $request->email)->update(['forgot_otp' => $otp]);

                        toastr()->success('Send OTP successfully!');

                        return redirect()->route('admin_verify_otp', encrypt($request->email));

                        User::create(['forgot_otp' => $otp, 'user_id' => $user->id]);

                    }
                }
            } else {
                toastr()->error('Sorry email not registered our records');
                return redirect()->back();
            }

        } catch (\Exception $e) {
            dd($e);
            toastr()->error('Something went wrong !');
            return redirect()->back();
        }
    }
    public function verifyOTP($email)
    {

        $data['email'] = decrypt($email);
        return view($this->view . 'verify_otp', $data);
    }
    public function matchOTP(Request $request)
    {

        if ($request->submit_type == 'Submit') {
            $otp = $this->user->where('forgot_otp', $request->otp)->where('email', $request->email)->first();
            if ($otp) {
                $data['email'] = $request->email;
                return view($this->view . 'reset_password', $data);

            } else {
                toastr()->error('Please, Enter valid Otp');
                return redirect()->back();
            }
        } else {
            $count = $this->user->where('email', $request->email)->count();

            if ($count > 0) {
                $user = $this->user->where(['email' => $request->email])->first();
                if ($user) {
                    $subject = 'Request for Forget Password please verify your OTP!';
                    $email = base64_encode($request->email);
                    $message = base64_decode($request->email);
                    $url = url('/admin_verify_otp') . '/' . base64_encode($request->otp ?? '');
                    $otp = rand('1000', '9999');
                    $user->save();

                    Mail::to($request->email)->send(new SuperAdminForgotOtpVerification($user, $subject, $otp));
                    if ($user) {

                        $data = $this->user->where('email', $request->email)->update(['forgot_otp' => $otp]);

                        toastr()->success('Data has been saved successfully!');
                        return redirect()->route('admin_verify_otp', encrypt($request->email));
                        User::create(['forgot_otp' => $otp, 'user_id' => $user->id]);

                    }
                }
            }
        }

    }

    public function resertPassword()
    {
        return view($this->view . 'reset_password');
    }
    public function resetSubmitPassword(Request $request, $email)
    {

        try {
            # Validate request data
            $data = [
                'password' => 'required|same:confirm_password',
            ];

            # validation check
            $validator = Validator::make($request->all(), $data);
            if ($validator->fails()) {
                return response()->json([
                    $this->responseCode => (string) $this->errorStatus,
                    $this->responseMessage => $validator->errors()->first()
                ]);
            }
            $user = $this->user->where('email', $email)->first();

            if (Hash::check($request->password, $user->password)) {
                return response()->json([
                    $this->responseCode => (string) $this->errorStatus,
                    $this->responseMessage => 'Old Password And New Password Can Not be Same!',
                ]);
            } else {

                $arrayData = [
                    'password' => Hash::make($request->password),
                    'password_text' => $request->password,
                ];

                $createUser = $user->update($arrayData);
                return response()->json([
                    'message' => 'Password updated successfully',
                    'code' => $this->successStatus,
                ]);
            }
           
        } catch (\Exception $e) {
            toastr()->success($e);

            toastr()->error('Somthing want wrong!');
            return redirect()->back();
        }
    }

  
}

