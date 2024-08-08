<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SurveyVoting extends Model
{
   protected  $table = 'survey_votings';

    protected $fillable = [
                            'id',
                            'survey_question_id',
                            'survey_answer_id',
                            'customer_id'
                           ];
}
