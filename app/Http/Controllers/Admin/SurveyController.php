<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use File;
use Validator;
use App\Models\SurveyQuestion;
use App\Models\SurveyAnswer;
use App\Models\SurveyVoting;
use App\Http\Traits\MessageStatusTrait;

use Auth;


class SurveyController extends Controller
{
    use MessageStatusTrait;

    # Bind Type
    protected $type = 'Survey ';

    # Bind location
    protected $view = 'admin.survey.';

    # Bind survey
    protected $surveyAnswer;
    protected $surveyQuestion;
    

    /**
     * default constructor
     * @param
     * @return
     */
    function __construct(
                         SurveyQuestion $surveyQuestion,
                         SurveyAnswer $surveyAnswer
                        )
                        {
                            $this->surveyQuestion        = $surveyQuestion;
                            $this->surveyAnswer          = $surveyAnswer;
                        }

    public function index()
    {
        $query = $this->surveyQuestion;
        $details['lists'] = $query->orderBy('id','desc')->get();

        # return to index page
        return view($this->view.'survey-question.index',$details);
    }


    public function create(Request $request)
    {
        return view($this->view.'survey-question.create');
    }


    /**
     * store post
     * @param Illuminate\Http\Request;
     * @return Illuminate\Http\Response;
     */
    public function store(Request $request)
    {
         
         $data = [
                  'question'       => 'required',
                  'week_date'      => 'required',
                 ];

        # validation check
        $validator = Validator::make($request->all() , $data);
        if($validator->fails())
         {
            return response()->json([
                                      (string)$this->responseCode=>(string)$this->errorStatus, 
                                      (string)$this->responseMessage => 'Required field is missing.'
                                    ]);
         }

         try {

           $query = $this->surveyQuestion;
           # check the requested category already exist or not
           $checkQuestion = $query->where('week_date',$request->week_date)
                                  ->first();
           
           if($checkQuestion)
            {   
              return response()->json([
                                        (string)$this->responseCode=>(string)$this->errorStatus, 
                                        (string)$this->responseMessage => 'Sorry,Survey Week already exist.'
                                      ]);  
            }

            # request param
            $arrayData = [
                           'question'     => $request->question ?? null, 
                           'week_date'    => $request->week_date ?? null, 
                         ];     
            #store
            $create = $query->create($arrayData);

            return response()->json([
                                      (string)$this->responseCode=>(string)$this->successStatus, 
                                      (string)$this->responseMessage => 'Survey Question Added Successfully.'
                                    ]); 
             
         } catch (Exception $e) {
              return response()->json([
                                      (string)$this->responseCode =>(string)$this->errorStatus, 
                                      (string)$this->responseMessage => 'Something went wrong.'
                                    ]); 
         }

    }


     /**
     * edit page
     * @param Illuminate\Http\Request;
     * @return Illuminate\Http\Response;
     */
    public function edit($id)
    {
        
        $details['survey_question'] = $this->surveyQuestion::where('id', $id)->first();

        return view($this->view.'survey-question.edit',$details);

    }

    /**
     * Update Post
     * @param Illuminate\Http\Request;
     * @return Illuminate\Http\Response;
     */

   public function update(Request $request)
    {
        // dd($request->all());
        $data = [
          'question'       => 'required',
          'week_date'      => 'required',
        ];

        # validation check
        $validator = Validator::make($request->all() , $data);
        if($validator->fails())
         {
            return response()->json([
                                      (string)$this->responseCode=>(string)$this->errorStatus, 
                                      (string)$this->responseMessage => 'Required field is missing.'
                                    ]);
         }

        try {
          
           $query = $this->surveyQuestion->where('id', $request->id)->first();
           
           # check the requested category already exist or not
           $checksurveyQuestion = $query->where('week_date',$request->week_date)
                                      ->where('id', '!=', $request->id)
                                      ->first();

           
           if($checksurveyQuestion)
            {   
              return response()->json([
                                        (string)$this->responseCode=>(string)$this->errorStatus, 
                                       (string)$this->responseMessage => 'Sorry,Poll Question already exist.'
                                      ]);  
            }  

             
            
            # request param
            $arrayData = [
                           'question'             => $request->question ?? null, 
                           'week_date'            => $request->week_date ?? null, 
                           'created_by'           => Auth::guard('admin')->user()->id,
                         ];     

            #update
            $updateQuestion = $query->update($arrayData);  
            
            return response()->json([
                                      (string)$this->responseCode=>(string)$this->successStatus, 
                                      (string)$this->responseMessage => 'Poll Question Updated Successfully.'
                                    ]);                      

        } catch (Exception $e) {
           // dd($e);
            return response()->json([
                                      (string)$this->responseCode=>(string)$this->errorStatus, 
                                      (string)$this->responseMessage => 'Something went wrong.'
                                    ]);  
        }
       
    }



        /**
     * active deactive
     * @param $id
     * @return \Illuminate\Http\Response
     */
    public function status($id)
    {
        # initiate constructor
        $query = $this->surveyQuestion;

        # get the status
        $status = $query->where('id', $id)->first()->status;

        # check status, if active
        if ($status == '1')
        {
            #message
            $message = $this->inActiveMessage($this->type);

            # deactive( update status to zero)
            $statusCode = '0';
        }
        else
        {
            #message
            $message = $this->activeMessage($this->type);

            # active( update status to one)
            $statusCode = '1';
        }

        # update status code
        $query->where('id', $id)->update(['status' => $statusCode]);

        # return success
        return [$this->successKey => $this->successStatus, $this->messageKey => $message];
    }



    public function answerList(Request $request,$id)
    {
        $answers = $this->surveyAnswer->where('survey_question_id',$id)->orderBy('id','desc')->get();

        # return to index page
        return view($this->view .'survey-answer.index')->with([
                                                         'answers'                 =>$answers,
                                                         'survey_question_id'        =>$id
                                                          ]);
    }


    /**
     * create category
     * @param Illuminate\Http\Request;
     * @return Illuminate\Http\Response;
     */
    public function answerStore(Request $request)
    {
      $data = [
          'answer'                => 'required',
          'survey_question_id'      => 'required',
        ];

        # validation check
        $validator = Validator::make($request->all() , $data);
        if($validator->fails())
         {
            return response()->json([
                                      (string)$this->responseCode=>(string)$this->errorStatus, 
                                      (string)$this->responseMessage => 'Required field is missing.'
                                    ]);
         }

        try {
          
           $query = $this->surveyAnswer;
           
           # check the requested category already exist or not
           $checkAnswer = $query->where('answer', $request->answer)
                                ->where('survey_question_id',$request->survey_question_id)
                                ->first();
           
           if($checkAnswer)
            {   
              return response()->json([
                                        (string)$this->responseCode=>(string)$this->errorStatus, 
                                        (string)$this->responseMessage => 'Sorry, Answer already exist.'
                                      ]);  
            }  

        
            # request param
            $arrayData = [
                           'answer'                => $request->answer ?? null, 
                           'survey_question_id'      => $request->survey_question_id,
                         ];     

            #store
            $createAnswer = $query->create($arrayData);

            return response()->json([
                                      (string)$this->responseCode=>(string)$this->successStatus, 
                                      (string)$this->responseMessage => 'Forum City Added Successfully.'
                                    ]);                      

        } catch (Exception $e) {
           // dd($e);
            return response()->json([
                                      (string)$this->responseCode =>(string)$this->errorStatus, 
                                      (string)$this->responseMessage => 'Something went wrong.'
                                    ]);  
        }
       
    }


    /**
     * edit  page
     * @param Illuminate\Http\Request;
     * @return Illuminate\Http\Response;
     */
    public function ansUpdate($id)
    {
      // dd($id);
        # Fetch category by id
        $answer = $this->surveyAnswer
                         ->where('id', $id)
                         ->first();
        # code...
        return view($this->view . 'survey-answer.edit')->with(['answer' => $answer]);
    }


    /**
     * edit Anser
     * @param Illuminate\Http\Request;
     * @return Illuminate\Http\Response;
     */

   public function ansEdit(Request $request)
    {
        $data = [
          'answer'                => 'required',
          'survey_question_id'    => 'required',
        ];

        # validation check
        $validator = Validator::make($request->all() , $data);
        if($validator->fails())
         {
            return response()->json([
                                      (string)$this->responseCode=>(string)$this->errorStatus, 
                                      (string)$this->responseMessage => 'Required field is missing.'
                                    ]);
         }

        try {
          
           $query = $this->surveyAnswer->where('id', $request->id)->first();
           
           # check the requested category already exist or not
           $checkAnswer = $query->where('answer', $request->answer)
                                  ->where('id', '!=', $request->id)
                                  ->first();

           
           if($checkAnswer)
            {   
              return response()->json([
                                        (string)$this->responseCode=>(string)$this->errorStatus, 
                                       (string)$this->responseMessage => 'Sorry, Answer already exist.'
                                      ]);  
            }  

             

            # request param
            $arrayData = [
                           'answer'                => $request->answer ?? null, 
                           'survey_question_id'      => $request->survey_question_id,
                         ];     

            #update
            $updateAnswer = $query->update($arrayData);  
            
            return response()->json([
                                      (string)$this->responseCode=>(string)$this->successStatus, 
                                      (string)$this->responseMessage => 'Answer Updated Successfully.'
                                    ]);                      

        } catch (Exception $e) {
           // dd($e);
            return response()->json([
                                      (string)$this->responseCode=>(string)$this->errorStatus, 
                                      (string)$this->responseMessage => 'Something went wrong.'
                                    ]);  
        }
       
    }


    /**
     * active deactive
     * @param $id
     * @return \Illuminate\Http\Response
     */
    public function ansStatus($id)
    {
        # initiate constructor
        $query = $this->surveyAnswer;

        # get the status
        $status = $query->where('id', $id)->first()->status;

        # check status, if active
        if ($status == '1')
        {
            #message
            $message = $this->inActiveMessage($this->type.' Answer ');

            # deactive( update status to zero)
            $statusCode = '0';
        }
        else
        {
            #message
            $message = $this->activeMessage($this->type.' Answer ');

            # active( update status to one)
            $statusCode = '1';
        }

        # update status code
        $query->where('id', $id)->update(['status' => $statusCode]);

        # return success
        return [$this->successKey => $this->successStatus, $this->messageKey => $message];
    }


   

}
