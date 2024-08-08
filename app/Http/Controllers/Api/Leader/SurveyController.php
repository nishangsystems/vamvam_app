<?php

namespace App\Http\Controllers\Api\Leader;

# Models
use App\Models\Leader;
use App\Models\SurveyQuestion;
use App\Models\SurveyAnswer;
use App\Models\SurveyVoting;

# Traits
use App\Http\Traits\StatusTrait;

# Vendor Classes
use DB;
use File;
use Validator;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; 
use App\Http\Controllers\Controller; 
use Illuminate\Support\Facades\Hash;

class SurveyController extends Controller
{
    use StatusTrait;

    # Variable to Bind Model
    protected $leader;   
    protected $surveyAnswer;
    protected $surveyVoting;
    protected $surveyQuestion;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
     function __construct(
                            Leader                       $leader,
                            SurveyAnswer                 $surveyAnswer,
                            SurveyVoting                 $surveyVoting,
                            SurveyQuestion               $surveyQuestion
                        )
                        {
                            $this->leader                   = $leader;
                            $this->surveyAnswer             = $surveyAnswer;
                            $this->surveyVoting             = $surveyVoting;
                            $this->surveyQuestion           = $surveyQuestion;
                        }

  

    /**
     * @method to Store Survey
     * 
     * @return 
     */
    public function store(Request $request)
    {

        $rules = [ 
                   'question'        =>'required',
                   'week_date'       =>'required',
                   'answer'          =>'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
       
        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors(),'code' => (string)$this->failedStatus]);            
        }


          try{     
                   if(count($request->answer) == 0)
                   {
                      return response()->json([
                                                'message' =>'Answer is empty',
                                                'code'    => (string)$this->failedStatus
                                              ]);  
                   }
                   $query = $this->surveyQuestion;
                   # check the requested category already exist or not
                   $checkQuestion = $query->where('week_date',$request->week_date)
                                          ->first();
                   
                   if($checkQuestion)
                    {   
                      return response()->json([
                                                'code'=>(string)$this->failedStatus, 
                                                'message' => 'Sorry,Survey week already exist.'
                                              ]);  
                    }


                    # request param
                    $arrayData = [
                                   'question'     => $request->question ?? null, 
                                   'week_date'    => $request->week_date ?? null, 
                                 ];     
                    #store
                    $create = $query->create($arrayData);

                    foreach ($request->answer as $key=> $answer) 
                        {
                           $query = $this->surveyAnswer;           
                           # check the requested category already exist or not
                           $checkAnswer = $query->where('answer', $answer)
                                                ->where('survey_question_id',$create->id)
                                                ->first();                   
                           if($checkAnswer == '')
                            {   
                                # request param
                                $arrayData = [
                                               'answer'                => $answer, 
                                               'survey_question_id'    => $create->id,
                                             ];  
                                #store
                                $createAnswer = $query->create($arrayData);
                            } 
                        }  
             
                       
                return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'Survey Created Successfully',
                                    ]); 
          }catch(\Exception $e)
          {
            return response()->json([
                                    'code'    => (string)$this->failedStatus, 
                                    'message' => (string)$e,
                                ]);
          }
    }



    /** 
     * Survey List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function list(Request $request) 
    { 
        try 
           {
                $questionArray = [];
                DB::beginTransaction();
                $lists = $this->surveyQuestion
                              ->where('status',1)
                              ->orderBy('id','desc')
                              ->get();
                if($lists->isNotEmpty()) 
                {
                    foreach ($lists as $key => $value) 
                    {
                        $data['id']         = (string)$value->id ?? '';
                        $data['question']   = (string)$value->question ?? '';
                        $optionArray = [];
                        foreach ($value->answerData as $key => $answerData) 
                        {
                           $data1['id']         = (string)$answerData->id ?? '';
                           $data1['option']     = (string)$answerData->answer ?? '';
                           $data1['ans_count']  = (string)count($answerData->votingData) ?? 0;
                           # push in array
                           array_push($optionArray, $data1);
                        }
                        $data['optionData'] = $optionArray;
                        # push in array
                        array_push($questionArray, $data);
                    }

                        # return response
                        return response()->json([
                                                    'code'      => (string)$this->successStatus, 
                                                    'message'   => 'Survey List',
                                                    'data'      =>  $questionArray
                                                ]);
                }else{
                    # return response
                    return response()->json([
                                                'code'      => (string)$this->failedStatus, 
                                                'message'   => 'Survey Not Found!!',
                                                'data'      =>  []
                                            ]); 
                }
            } catch (Exception $e) {
            # return response
            return response()->json([
                                        'code'      => (string)$this->failedStatus, 
                                        'message'   => 'Something Went Worng',
                                        'data'      =>  []
                                   ]);
            }
    }



    

   
}
