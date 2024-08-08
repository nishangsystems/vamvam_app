<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SurveyQuestion extends Model
{
    protected $table = 'survey_questions';

    protected $fillable = [
                            'id',
                            'question',
                            'week_date',
                            'start_date', 
                            'end_date',
                            'status',
                            'created_by',
                            
                           ];

    public function answerData()
    {
        return $this->hasMany('App\Models\SurveyAnswer', 'survey_question_id','id');
    } 

    public function userAttempt()
    {
        return $this->belongsTo('App\Models\SurveyVoting', 'id','survey_question_id');
    } 

}
