<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

#User
use App\Http\Controllers\Api\User\LoginController;
use App\Http\Controllers\Api\User\MasterController;
use App\Http\Controllers\Api\User\ComplaintController;
use App\Http\Controllers\Api\User\EventController;
use App\Http\Controllers\Api\User\UserAppointmentController;


#Representative
use App\Http\Controllers\Api\Representative\LoginController as RLoginController;
use App\Http\Controllers\Api\Representative\MasterController as RMasterController;
use App\Http\Controllers\Api\Representative\ComplaintController as RComplaintController;
use App\Http\Controllers\Api\Representative\EventController as REventController;
use App\Http\Controllers\Api\Representative\RepresentativeAppointmentController as RRepresentativeAppointmentController;
use App\Http\Controllers\Api\Representative\RepresentativeToDoController as RRepresentativeToDoController;
use App\Http\Controllers\Api\Representative\RepresentativeRequestApprovalController as RRepresentativeRequestApprovalController;

#Leader
use App\Http\Controllers\Api\Leader\LoginController as LLoginController;
use App\Http\Controllers\Api\Leader\ComplaintController as LComplaintController;
use App\Http\Controllers\Api\Leader\SurveyController as LSurveyController;
use App\Http\Controllers\Api\Leader\AppointmentController as LAppointmentController;
use App\Http\Controllers\Api\Leader\EventController as LEventController;
use App\Http\Controllers\Api\Leader\UserAppointmentController as LUserAppointmentController;
use App\Http\Controllers\Api\Leader\RepresentativeAppointmentController as LRepresentativeAppointmentController;
use App\Http\Controllers\Api\Leader\RepresentativeRequestApprovalController as LRepresentativeRequestApprovalController;


#Parent
use App\Http\Controllers\Api\Parent\LoginController as PLoginController;
use App\Http\Controllers\Api\Parent\EventController as PEventController;




/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


# User Api
Route::prefix('user')->namespace('Api\User')->group(function() {    
    
    #Master 
    Route::get('relation', [MasterController::class,'relation']);
    Route::get('state', [MasterController::class,'state']);
    Route::post('district', [MasterController::class,'district']);
    Route::post('tehsil', [MasterController::class,'tehsil']);
    Route::post('townVillage', [MasterController::class,'townVillage']);
    Route::post('panchayatWard', [MasterController::class,'panchayatWard']);
    Route::post('block', [MasterController::class,'block']);
    Route::post('thana', [MasterController::class,'thana']);
    Route::post('postOffice', [MasterController::class,'postOffice']);
    Route::post('parliamentary', [MasterController::class,'parliamentary']);
    Route::post('assembly', [MasterController::class,'assembly']);
    Route::get('department', [MasterController::class,'department']);
    Route::get('issueType', [MasterController::class,'issueType']);
    
    Route::post('login', [LoginController::class,'login']);
    Route::post('verify-otp', [LoginController::class,'verifyOtp']);
    Route::post('register', [LoginController::class,'register']);
    Route::post('forgot-password', [LoginController::class,'forgotPassword']);
    Route::post('forgot-password-otp-verify', [LoginController::class,'forgotVerifyOtp']);
    Route::post('forgot-password-reset', [LoginController::class,'forgotPasswordReset']);
        
    Route::group(['middleware' => 'userApi'], function(){

      Route::get('banner', [MasterController::class,'banner']);   
      Route::post('my-profile', [LoginController::class,'getProfile']);   
      Route::post('update-profile', [LoginController::class,'updateProfile']);   
      Route::post('delete-profile', [LoginController::class,'deleteProfile']); 
      Route::post('notification', [LoginController::class,'notification']); 
      Route::post('notificationUpdate', [LoginController::class,'notificationUpdate']); 

      #survey  
      Route::post('survey', [LoginController::class,'survey']);   
      Route::post('survey/submit', [LoginController::class,'storeSurvey']);   

      #Complaint  
      Route::post('complaint', [ComplaintController::class,'list']);   
      Route::post('complaint/store', [ComplaintController::class,'store']);   
      Route::post('complaint/followup', [ComplaintController::class,'followupList']);   
      Route::post('complaint/reopen', [ComplaintController::class,'reopenComplain']);   
      Route::post('complaint/withdraw', [ComplaintController::class,'withdrawComplain']);   
      Route::post('complaint/followup/submit', [ComplaintController::class,'followUpSubmit']);  

      #event  
      Route::post('event', [EventController::class,'list']);   

      #Appointment  
      Route::post('appointment/store', [UserAppointmentController::class,'store']);   
      Route::post('appointment', [UserAppointmentController::class,'list']);   
      Route::post('appointment/delete', [UserAppointmentController::class,'delete']);   
        
      

    });     

});



# Representative Api
Route::prefix('representative')->namespace('Api\Representative')->group(function() {    
   
    Route::post('login', [RLoginController::class,'login']);
    Route::post('verify-otp', [RLoginController::class,'verifyOtp']);
    Route::post('forgot-password', [RLoginController::class,'forgotPassword']);
    Route::post('forgot-password-otp-verify', [RLoginController::class,'forgotVerifyOtp']);
    Route::post('forgot-password-reset', [RLoginController::class,'forgotPasswordReset']);
        
    Route::group(['middleware' => 'representativeApi'], function(){

      Route::get('banner', [RMasterController::class,'banner']);   
      Route::post('my-profile', [RLoginController::class,'getProfile']);   
      Route::post('delete-profile', [RLoginController::class,'deleteProfile']); 
      Route::post('notification', [RLoginController::class,'notification']);
      Route::post('notificationUpdate', [RLoginController::class,'notificationUpdate']); 

      #Complaint  
      Route::post('complaint', [RComplaintController::class,'list']); 
      Route::post('complaint/followup', [RComplaintController::class,'followupList']); 
      Route::post('followup', [RComplaintController::class,'followUp']); 

      #Appointment  
      Route::post('appointment/store', [RRepresentativeAppointmentController::class,'store']);   
      Route::post('appointment', [RRepresentativeAppointmentController::class,'list']);   
      Route::post('appointment/delete', [RRepresentativeAppointmentController::class,'delete']);

      #event  
      Route::post('event', [REventController::class,'list']);   

      #Todo  
      Route::post('todo', [RRepresentativeToDoController::class,'list']);   
      Route::post('todo/store', [RRepresentativeToDoController::class,'store']);   
      Route::post('todo/status', [RRepresentativeToDoController::class,'status']);

      #request-approval  
      Route::post('request-approval', [RRepresentativeRequestApprovalController::class,'list']);   
      Route::post('request-approval/store', [RRepresentativeRequestApprovalController::class,'store']);   

            
      

    });     

});




# Leader Api
Route::prefix('leader')->namespace('Api\Leader')->group(function() {    
   
    Route::post('login', [LLoginController::class,'login']);
    Route::post('verify-otp', [LLoginController::class,'verifyOtp']);
    Route::post('forgot-password', [LLoginController::class,'forgotPassword']);
    Route::post('forgot-password-otp-verify', [LLoginController::class,'forgotVerifyOtp']);
    Route::post('forgot-password-reset', [LLoginController::class,'forgotPasswordReset']);
        
    Route::group(['middleware' => 'leaderApi'], function(){

      Route::post('my-profile', [LLoginController::class,'getProfile']);   
      Route::post('delete-profile', [LLoginController::class,'deleteProfile']); 
      Route::post('notification', [LLoginController::class,'notification']);
      Route::post('notificationUpdate', [LLoginController::class,'notificationUpdate']); 

      #Complaint  
      Route::get('complaint', [LComplaintController::class,'list']); 
      Route::post('complaint/followup', [LComplaintController::class,'followupList']); 

      #Survey
      Route::get('survey', [LSurveyController::class,'list']); 
      Route::post('survey/store', [LSurveyController::class,'store']); 

      #Appointment
      Route::post('appointment', [LAppointmentController::class,'list']); 
      Route::post('appointment/store', [LAppointmentController::class,'store']); 

      #event  
      Route::post('event', [LEventController::class,'list']);
      Route::post('event/store', [LEventController::class,'store']);


      #Appointment  
      Route::post('user/appointment', [LUserAppointmentController::class,'list']);   
      Route::post('user/appointment/status', [LUserAppointmentController::class,'statusChange']); 

      #Appointment  
      Route::post('executive/appointment', [LRepresentativeAppointmentController::class,'list']);   
      Route::post('executive/appointment/status', [LRepresentativeAppointmentController::class,'statusChange']); 

      #request-approval  
      Route::post('request-approval', [LRepresentativeRequestApprovalController::class,'list']);   
      Route::post('request-approval/status', [LRepresentativeRequestApprovalController::class,'status']);     

          

    });     

});



# Parent Api
Route::prefix('parent')->namespace('Api\Parent')->group(function() {    
   
    Route::post('login', [PLoginController::class,'login']);
        
    Route::group(['middleware' => 'parentApi'], function(){

      Route::post('my-profile', [PLoginController::class,'getProfile']);   
      Route::post('delete-profile', [PLoginController::class,'deleteProfile']);

      #event  
      Route::post('event', [PEventController::class,'list']);

    });     

});

