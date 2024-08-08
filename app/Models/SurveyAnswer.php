<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SurveyAnswer extends Model
{
    protected $table = 'survey_answers';

    protected $fillable = [
                            'id',
                            'survey_question_id',
                            'answer',
                            'status',
                           ];

  
    public function votingData()
    {
        return $this->hasMany('App\Models\SurveyVoting', 'survey_answer_id','id');
    } 
}
