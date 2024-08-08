<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Admin\LoginController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\ContentManagementController;
use App\Http\Controllers\Admin\OurServiceController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\ComplaintController;
use App\Http\Controllers\Admin\SurveyController;

use App\Http\Controllers\Admin\Master\StateController;
use App\Http\Controllers\Admin\Master\DistrictController;
use App\Http\Controllers\Admin\Master\ParliamentaryConstituencyController;
use App\Http\Controllers\Admin\Master\TehsilController;
use App\Http\Controllers\Admin\Master\AssemblyConstituencyController;
use App\Http\Controllers\Admin\Master\PanchayatWardController;
use App\Http\Controllers\Admin\Master\TownVillageController;
use App\Http\Controllers\Admin\Master\DepartmentController;
use App\Http\Controllers\Admin\Master\IssueTypeController;
use App\Http\Controllers\Admin\Master\BannerController;
use App\Http\Controllers\Admin\Master\BlockController;
use App\Http\Controllers\Admin\Master\ThanaController;
use App\Http\Controllers\Admin\Master\PostOfficeController;

use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\SystemUserController;

use App\Http\Controllers\Admin\ExecutiveController;
use App\Http\Controllers\Admin\LeaderController;
use App\Http\Controllers\Admin\EventController;
use App\Http\Controllers\Admin\RepresentativeRequestApprovalController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('mobile_privacy_policy', [ContentManagementController::class,'mobile_privacy_policy'])->name('mobile_privacy_policy');
Route::get('mobile_term_condition', [ContentManagementController::class,'mobile_term_condition'])->name('mobile_term_condition');
Route::get('mobile_about_us', [ContentManagementController::class,'mobile_about_us'])->name('mobile_about_us');



/*Admin*/

Route::prefix('admin')->namespace('Admin')->group(function () {

    Route::get('/', [LoginController::class,'index'])->name('admin_login');
    Route::post('login', [LoginController::class,'login'])->name('admin_login_submit');
    Route::get('forgot-password', [LoginController::class,'forgotPassword'])->name('admin_forgot_password');
    Route::post('send-otp', [LoginController::class,'sendOtp'])->name('admin_send_otp');
    Route::get('/verify-otp/{email}', [LoginController::class,'verifyOTP'])->name('admin_verify_otp');
    Route::post('match-otp', [LoginController::class,'matchotp'])->name('admin_match_otp');
    Route::get('reset-password', [LoginController::class,'resertPassword'])->name('admin_reset_password');
    Route::post('update-password/{email}', [LoginController::class,'resetSubmitPassword'])->name('admin_updatePassword');
    
    Route::middleware(['cacheControl', 'admin_auth'])->group(function () {

        Route::get('dashboard', [DashboardController::class,'index'])->name('admin_dashboard');
        Route::get('profile', [LoginController::class,'profile'])->name('admin_profile');
        Route::post('profile', [LoginController::class,'updateProfile'])->name('admin_update_profile');
        Route::post('password', [LoginController::class,'updatePassword'])->name('admin_update_password');
        Route::get('logout', [LoginController::class,'logout'])->name('admin_logout');


        #Survey
        Route::get('survey', [SurveyController::class,'index'])->name('survey_question_list');
        Route::get('survey-question/create',[SurveyController::class,'create'])->name('survey_question_create');
        Route::post('survey-question/store',[SurveyController::class,'store'])->name('survey_question_store');
        Route::any('survey-question/status/{id}',[SurveyController::class,'status'])->name('survey_question_status');
        Route::get('survey-question/edit/{id}', [SurveyController::class,'edit'])->name('survey_question_edit');
        Route::post('survey-question/update', [SurveyController::class,'update'])->name('survey_question_update');

        #survey Answer
        Route::get('survey-answer/{id}', [SurveyController::class,'answerList'])->name('survey_answer');
        Route::post('store-survey-answer', [SurveyController::class,'answerStore'])->name('add_survey_answer');
        Route::get('edit-survey-answer/{id}', [SurveyController::class,'ansUpdate'])->name('edit-survey-answer');
        Route::post('edit-survey-answer/update', [SurveyController::class,'ansEdit'])->name('edit-survey-answer-update');
        Route::get('view-survey-answer/{id}', [SurveyController::class,'view']);
        Route::get('delete-survey-answer/{id}', [SurveyController::class,'delete']);
        Route::any('survey-answer-status/{id}', [SurveyController::class,'ansStatus'])->name('survey-answer-status');


      

        #CMS
        Route::get('cms', [ContentManagementController::class,'index'])->name('admin_cms');
        Route::get('update-cms/{id}', [ContentManagementController::class,'update'])->name('update_cms');
        Route::post('edit-cms', [ContentManagementController::class,'edit'])->name('edit_cms');

        #Banner Management
        Route::get('banner', [BannerController::class,'index'])->name('admin.banner');
        Route::post('store-banner', [BannerController::class,'store'])->name('store_banner');
        Route::get('edit-banner/{id}',[BannerController::class,'editBanner'])->name('edit_banner');
        Route::post('update-banner',[BannerController::class,'update'])->name('update_banner');
        Route::get('delete-banner/{id}', [BannerController::class,'delete'])->name('delete_banner');

        #OurService Management
        Route::get('our-service', [OurServiceController::class,'index'])->name('admin.our-service');
        Route::post('store-our-service', [OurServiceController::class,'store'])->name('store_our-service');
        Route::get('edit-our-service/{id}',[OurServiceController::class,'edit'])->name('edit_our-service');
        Route::post('update-our-service',[OurServiceController::class,'update'])->name('update_our-service');
        Route::get('delete-our-service/{id}', [OurServiceController::class,'delete'])->name('delete_our-service');



        #Setting
        Route::get('setting',[SettingController::class,'index'])->name('admin_setting');
        Route::post('edit-setting',[SettingController::class,'edit'])->name('stor_setting');


        #User Management
        Route::get('user', [UserController::class,'index'])->name('admin_user');
        Route::get('user/create', [UserController::class,'create'])->name('admin_create_user');
        Route::post('user/store', [UserController::class,'store'])->name('admin_user_store');
        Route::any('status-user/{id}', [UserController::class,'status'])->name('status_user');
        Route::get('edit-user/{id}',[UserController::class,'edit'])->name('edit_user');
        Route::post('user/update', [UserController::class,'update'])->name('admin_user_update');
        
        #user Complaint
        Route::any('user-complaint/{id}', [UserController::class,'complaint'])->name('user_complaint');
        Route::get('user-complaint/create/{id}', [UserController::class,'complaintCreate'])->name('admin_user_complaint_create');
        Route::post('user/complaint/store', [UserController::class,'complaintStore'])->name('admin_user_complaint_store');


        #ComplaintController Management
        Route::any('jsonCustomerInfo', [ComplaintController::class,'jsonCustomerInfo'])->name('jsonCustomerInfo');
        Route::get('complaint', [ComplaintController::class,'index'])->name('admin_complaint');
        Route::get('complaint/create', [ComplaintController::class,'create'])->name('admin_create_complaint');
        Route::post('complaint/store', [ComplaintController::class,'store'])->name('admin_complaint_store');
        Route::get('complaint/assign/{id}', [ComplaintController::class,'assignComplaint'])->name('assign_complaint');
        Route::post('complaint/assign/store', [ComplaintController::class,'storeAssignComplaint'])->name('admin_assign_complaint_store');
        Route::get('complaint/followup/{id}', [ComplaintController::class,'followUp'])->name('admin_complaint_followup');


        #Executive Management
        Route::get('executive', [ExecutiveController::class,'index'])->name('admin_executive');
        Route::get('executive/create', [ExecutiveController::class,'create'])->name('admin_create_executive');
        Route::post('executive/store', [ExecutiveController::class,'store'])->name('admin_executive_store');
        Route::post('jsonCityExecutive', [ExecutiveController::class,'jsonCityExecutive'])->name('jsonCityExecutive');
        Route::any('status-executive/{id}', [ExecutiveController::class,'status'])->name('status_executive');
        Route::get('edit-executive/{id}',[ExecutiveController::class,'edit'])->name('edit_executive');
        Route::post('executive/update', [ExecutiveController::class,'update'])->name('admin_executive_update');

        #leader Management
        Route::get('leader', [LeaderController::class,'index'])->name('admin_leader');
        Route::get('leader/create', [LeaderController::class,'create'])->name('admin_create_leader');
        Route::post('leader/store', [LeaderController::class,'store'])->name('admin_leader_store');
        Route::any('status-leader/{id}', [LeaderController::class,'status'])->name('status_leader');
        Route::get('edit-leader/{id}',[LeaderController::class,'edit'])->name('edit_leader');
        Route::post('leader/update', [LeaderController::class,'update'])->name('admin_leader_update');

        #event Management
        Route::get('event', [EventController::class,'index'])->name('admin_event');
        Route::get('event/create', [EventController::class,'create'])->name('admin_create_event');
        Route::post('event/store', [EventController::class,'store'])->name('admin_event_store');
        Route::any('status-event/{id}', [EventController::class,'status'])->name('status_event');
        Route::get('edit-event/{id}',[EventController::class,'edit'])->name('edit_event');
        Route::post('event/update', [EventController::class,'update'])->name('admin_event_update');
       



        ################Master#######################
        
        #State
        Route::get('state',[StateController::class,'index'])->name('admin.state');

        #District
        Route::get('district', [DistrictController::class,'index'])->name('admin.district');
        Route::get('district/create', [DistrictController::class,'create'])->name('admin_create_district');
        Route::post('district/store', [DistrictController::class,'store'])->name('admin_district_store');
        Route::any('status-district/{id}', [DistrictController::class,'status'])->name('admin_status_district');
        Route::get('edit-district/{id}',[DistrictController::class,'edit'])->name('admin_edit_district');
        Route::post('district/update', [DistrictController::class,'update'])->name('admin_update_district');
        Route::get('delete-district/{id}', [DistrictController::class,'delete'])->name('admin_delete_district');
        Route::post('jsonDistrict', [DistrictController::class,'jsonDistrict'])->name('jsonDistrict');

        #ParliamentaryConstituency
        Route::get('parliamentary_constituency', [ParliamentaryConstituencyController::class,'index'])->name('admin.parliamentary_constituency');
        Route::get('parliamentary_constituency/create', [ParliamentaryConstituencyController::class,'create'])->name('admin_create_parliamentary_constituency');
        Route::post('parliamentary_constituency/store', [ParliamentaryConstituencyController::class,'store'])->name('admin_parliamentary_constituency_store');
        Route::any('status-parliamentary_constituency/{id}', [ParliamentaryConstituencyController::class,'status'])->name('admin_status_parliamentary_constituency');
        Route::get('edit-parliamentary_constituency/{id}',[ParliamentaryConstituencyController::class,'edit'])->name('admin_edit_parliamentary_constituency');
        Route::post('parliamentary_constituency/update', [ParliamentaryConstituencyController::class,'update'])->name('admin_update_parliamentary_constituency');
        Route::get('delete-parliamentary_constituency/{id}', [ParliamentaryConstituencyController::class,'delete'])->name('admin_delete_parliamentary_constituency');


        #Tehsil
        Route::get('tehsil', [TehsilController::class,'index'])->name('admin.tehsil');
        Route::get('tehsil/create', [TehsilController::class,'create'])->name('admin_create_tehsil');
        Route::post('tehsil/store', [TehsilController::class,'store'])->name('admin_tehsil_store');
        Route::any('status-tehsil/{id}', [TehsilController::class,'status'])->name('admin_status_tehsil');
        Route::get('edit-tehsil/{id}',[TehsilController::class,'edit'])->name('admin_edit_tehsil');
        Route::post('tehsil/update', [TehsilController::class,'update'])->name('admin_update_tehsil');
        Route::get('delete-tehsil/{id}', [TehsilController::class,'delete'])->name('admin_delete_tehsil');
        Route::post('jsonTehsil', [TehsilController::class,'jsonTehsil'])->name('jsonTehsil');
        Route::post('jsonTehsilRelation', [TehsilController::class,'jsonTehsilRelation'])->name('jsonTehsilRelation');


        #Assembly Constituency
        Route::get('assembly_constituency', [AssemblyConstituencyController::class,'index'])->name('admin.assembly_constituency');
        Route::get('assembly_constituency/create', [AssemblyConstituencyController::class,'create'])->name('admin_create_assembly_constituency');
        Route::post('assembly_constituency/store', [AssemblyConstituencyController::class,'store'])->name('admin_assembly_constituency_store');
        Route::any('status-assembly_constituency/{id}', [AssemblyConstituencyController::class,'status'])->name('admin_status_assembly_constituency');
        Route::get('edit-assembly_constituency/{id}',[AssemblyConstituencyController::class,'edit'])->name('admin_edit_assembly_constituency');
        Route::post('assembly_constituency/update', [AssemblyConstituencyController::class,'update'])->name('admin_update_assembly_constituency');
        Route::get('delete-assembly_constituency/{id}', [AssemblyConstituencyController::class,'delete'])->name('admin_delete_assembly_constituency');


        #PanchayatWard
        Route::get('panchayat_ward', [PanchayatWardController::class,'index'])->name('admin.panchayat_ward');
        Route::get('panchayat_ward/create', [PanchayatWardController::class,'create'])->name('admin_create_panchayat_ward');
        Route::post('panchayat_ward/store', [PanchayatWardController::class,'store'])->name('admin_panchayat_ward_store');
        Route::any('status-panchayat_ward/{id}', [PanchayatWardController::class,'status'])->name('admin_status_panchayat_ward');
        Route::get('edit-panchayat_ward/{id}',[PanchayatWardController::class,'edit'])->name('admin_edit_panchayat_ward');
        Route::post('panchayat_ward/update', [PanchayatWardController::class,'update'])->name('admin_update_panchayat_ward');
        Route::get('delete-panchayat_ward/{id}', [PanchayatWardController::class,'delete'])->name('admin_delete_panchayat_ward');


        #city
        Route::get('townVillage', [TownVillageController::class,'index'])->name('admin.townVillage');
        Route::get('townVillage/create', [TownVillageController::class,'create'])->name('admin_create_townVillage');
        Route::post('townVillage/store', [TownVillageController::class,'store'])->name('admin_townVillage_store');
        Route::any('status-townVillage/{id}', [TownVillageController::class,'status'])->name('admin_status_townVillage');
        Route::get('edit-townVillage/{id}',[TownVillageController::class,'edit'])->name('admin_edit_townVillage');
        Route::post('townVillage/update', [TownVillageController::class,'update'])->name('admin_update_townVillage');
        Route::get('delete-townVillage/{id}', [TownVillageController::class,'delete'])->name('admin_delete_townVillage');


        #block
        Route::get('block', [BlockController::class,'index'])->name('admin.block');
        Route::get('block/create', [BlockController::class,'create'])->name('admin_create_block');
        Route::post('block/store', [BlockController::class,'store'])->name('admin_block_store');
        Route::any('status-block/{id}', [BlockController::class,'status'])->name('admin_status_block');
        Route::get('edit-block/{id}',[BlockController::class,'edit'])->name('admin_edit_block');
        Route::post('block/update', [BlockController::class,'update'])->name('admin_update_block');
        Route::get('delete-block/{id}', [BlockController::class,'delete'])->name('admin_delete_block');

        #postOffice
        Route::get('postOffice', [PostOfficeController::class,'index'])->name('admin.postOffice');
        Route::get('postOffice/create', [PostOfficeController::class,'create'])->name('admin_create_postOffice');
        Route::post('postOffice/store', [PostOfficeController::class,'store'])->name('admin_postOffice_store');
        Route::any('status-postOffice/{id}', [PostOfficeController::class,'status'])->name('admin_status_postOffice');
        Route::get('edit-postOffice/{id}',[PostOfficeController::class,'edit'])->name('admin_edit_postOffice');
        Route::post('postOffice/update', [PostOfficeController::class,'update'])->name('admin_update_postOffice');
        Route::get('delete-postOffice/{id}', [PostOfficeController::class,'delete'])->name('admin_delete_postOffice');

        #thana
        Route::get('thana', [ThanaController::class,'index'])->name('admin.thana');
        Route::get('thana/create', [ThanaController::class,'create'])->name('admin_create_thana');
        Route::post('thana/store', [ThanaController::class,'store'])->name('admin_thana_store');
        Route::any('status-thana/{id}', [ThanaController::class,'status'])->name('admin_status_thana');
        Route::get('edit-thana/{id}',[ThanaController::class,'edit'])->name('admin_edit_thana');
        Route::post('thana/update', [ThanaController::class,'update'])->name('admin_update_thana');
        Route::get('delete-thana/{id}', [ThanaController::class,'delete'])->name('admin_delete_thana');

        


        #Department
        Route::get('department', [DepartmentController::class,'index'])->name('admin.department');
        Route::get('department/create', [DepartmentController::class,'create'])->name('admin_create_department');
        Route::post('department/store', [DepartmentController::class,'store'])->name('admin_department_store');
        Route::any('status-department/{id}', [DepartmentController::class,'status'])->name('admin_status_department');
        Route::get('edit-department/{id}',[DepartmentController::class,'edit'])->name('admin_edit_department');
        Route::post('department/update', [DepartmentController::class,'update'])->name('admin_update_department');


        #IssueType
        Route::get('issue-type', [IssueTypeController::class,'index'])->name('admin.issue-type');
        Route::get('issue-type/create', [IssueTypeController::class,'create'])->name('admin_create_issue-type');
        Route::post('issue-type/store', [IssueTypeController::class,'store'])->name('admin_issue-type_store');
        Route::any('status-issue-type/{id}', [IssueTypeController::class,'status'])->name('admin_status_issue-type');
        Route::get('edit-issue-type/{id}',[IssueTypeController::class,'edit'])->name('admin_edit_issue-type');
        Route::post('issue-type/update', [IssueTypeController::class,'update'])->name('admin_update_issue_type');



        #Role
        Route::get('role', [RoleController::class,'index'])->name('admin.role');
        Route::get('role/create', [RoleController::class,'create'])->name('admin_create_role');
        Route::post('role/store', [RoleController::class,'store'])->name('admin_role_store');
        Route::any('status-role/{id}', [RoleController::class,'status'])->name('admin_status_role');
        Route::get('edit-role/{id}',[RoleController::class,'edit'])->name('admin_edit_role');
        Route::post('role/update', [RoleController::class,'update'])->name('admin_update_role');


        #System User
        Route::get('system_user', [SystemUserController::class,'index'])->name('admin.system_user');
        Route::get('system_user/create', [SystemUserController::class,'create'])->name('admin_create_system_user');
        Route::post('system_user/store', [SystemUserController::class,'store'])->name('admin_system_user_store');
        Route::any('status-system_user/{id}', [SystemUserController::class,'status'])->name('admin_status_system_user');
        Route::get('edit-system_user/{id}',[SystemUserController::class,'edit'])->name('admin_edit_system_user');
        Route::post('system_user/update', [SystemUserController::class,'update'])->name('admin_update_system_user');

        Route::get('request-approval', [RepresentativeRequestApprovalController::class,'index']);


          
       
    
    });

});

/*End Admin*/
