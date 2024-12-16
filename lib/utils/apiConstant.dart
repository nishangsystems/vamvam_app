import 'package:dio/dio.dart';
import 'package:vam_vam/data/remote/dio/dioClient1.dart';
import 'package:vam_vam/diContainer.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/utils/schoolPreference.dart';

class ApiConstant {
  static const String baseUrl = 'http://biaka.alobhatech.com';
  // static const String baseUrl1 = 'https://bnb.stlouissystems.org';
  static const String baseUrl1 = 'https://bnb.stlouissystems.org';

  static const String baseUrl2 = 'https://vamvam.nishangsystems.org';

  static const String getSchools = '/api/schools';

  // User api
  static const String getReleation = '/api/user/relation';
  static const String getState = '/api/user/state';
  static const String getDistrict = '/api/user/district';
  static const String getTehsil = '/api/user/tehsil';
  static const String getBlock = '/api/user/block';
  static const String getParliamentry = '/api/user/parliamentary';
  static const String getAssembly = '/api/user/assembly';
  static const String getMunicipality = '/api/user/municipality';
  static const String getWard = '/api/user/ward';
  static const String getCity = '/api/user/city';
  static const String getDepartment = '/api/user/department';
  static const String getIssueType = '/api/user/issueType';
  static const String register = '/api/user/register';
  static const String login = '/api/user/login';
  static const String verifyOtp = '/api/user/verify-otp';
  static const String myProfile = '/api/student/profile';
  static const String forgetPassword = '/api/user/forgot-password';
  static const String forgetPasswordOtpVerify ='/api/user/forgot-password-otp-verify';
  static const String forgetPasswordReset = '/api/user/forgot-password-reset';
  static const String updateProfile = '/api/user/update-profile';
  static const String banner = '/api/user/banner';
  static const String deleteAccount = '/api/user/delete-profile';
  static const String survey = "/api/user/survey";
  static const String submitSurvey = '/api/user/survey/submit';
  static const String registerComplaint = '/api/user/complaint/store';
  static const String complaintList = '/api/user/complaint';
  static const String complaintFollowUpList = '/api/user/complaint/followup';
  static const String withdrawComplaint = '/api/user/complaint/withdraw';
  static const String reopenComplaint = '/api/user/complaint/reopen';
  static const String followUpComplaint = '/api/user/complaint/followup/submit';
  static const String userGetEvents = '/api/user/event';
  static const String userStoreAppointment = '/api/user/appointment/store';
  static const String userGetAppointment = '/api/user/appointment';

  // New Apis
  static const String getTownOrVillage = '/api/user/townVillage';
  static const String getPanchayatWard = '/api/user/panchayatWard';
  static const String getThana = '/api/user/thana';
  static const String getPostOffice = '/api/user/postOffice';

  // Represantative api
  static const String repLogin = '/api/representative/login';
  static const String repVerifyOtp = '/api/representative/verify-otp';
  static const String repMyProfile = '/api/teacher/profile';
  static const String repBanner = '/api/representative/banner';
  static const String repForgetPassword = '/api/representative/forgot-password';
  static const String repForgetPasswordOtpVerify =
      '/api/representative/forgot-password-otp-verify';
  static const String repForgetPasswordReset =
      '/api/representative/forgot-password-reset';
  static const String repDeleteAccount = '/api/representative/delete-profile';
  static const String repComplaints = '/api/representative/complaint';
  static const String repComplaintFollowUp = '/api/representative/followup';
  static const String repGetComplaintFollowUp =
      '/api/representative/complaint/followup';
  static const String repStoreAppointment =
      '/api/representative/appointment/store';
  static const String repGetAppointment = '/api/representative/appointment';
  static const String repGetEvents = '/api/representative/event';
  static const String repCreateTodo = '/api/representative/todo/store';
  static const String repGetTodo = '/api/representative/todo';
  static const String repRequestApproval =
      '/api/representative/request-approval/store';
  static const String repGetRequestApproval =
      '/api/representative/request-approval';
  static const String repUpdateToDoStatus = '/api/representative/todo/status';

  // delete appointment
  static const String deleterepStoreAppointment =
      '/api/representative/appointment/delete';
  static const String deleteuserStoreAppointment =
      '/api/user/appointment/delete';

  // notification
  static const String usernotificationLists = '/api/user/notification';
  static const String userNotificationUpdate = '/api/user/notificationUpdate';
  static const String repnotificationLists = '/api/representative/notification';
  static const String repNotificationUpdate =
      '/api/representative/notificationUpdate';
  static const String leadernotificationLists = '/api/leader/notification';
  static const String leaderNotificationUpdate =
      '/api/leader/notificationUpdate';

  // Leader api
  static const String leaderLogin = '/api/leader/login';
  static const String leaderVerifyOtp = '/api/leader/verify-otp';
  static const String leaderMyProfile = '/api/leader/my-profile';
  static const String leaderForgotPassword = '/api/leader/forgot-password';
  static const String leaderForgetPasswordotpVerify =
      '/api/leader/forgot-password-otp-verify';
  static const String leaderForgetPasswordReset =
      '/api/leader/forgot-password-reset';
  static const String leaderDeleteProfile = '/api/leader/delete-profile';
  static const String leaderComplaintList = '/api/leader/complaint';
  static const String leaderStoreSurvey = '/api/leader/survey/store';
  static const String leaderGetSurvey = '/api/leader/survey';
  static const String leaderStoreAppointment = '/api/leader/appointment/store';
  static const String leaderGetAppointment = '/api/leader/appointment';
  static const String leaderGetComplaintFollowUp =
      '/api/leader/complaint/followup';
  static const String leaderCreateEvent = '/api/leader/event/store';
  static const String leaderGetEvent = '/api/leader/event';
  static const String leaderGetApprovals = '/api/leader/request-approval';
  static const String leaderApprovalStatusChange =
      '/api/leader/request-approval/status';

  // Student api
  static const String login1 = '/api/login/student';
  static const String logout = '/api/logout/student';
  static const String getSchool = '/api/student/school';
  static const String getBatch = '/api/student/years';
  static const String getSemester = '/api/student/semesters';
  static const String getLevels = '/api/student/levels';
  static const String getCoursesForRegistration = '/api/student/courses';
  static const String getClassCourses = '/api/student/class_courses/';
  static const String registerCourse = '/api/student/register_courses?courses=';
  static const String getRegisteredCourse =
      '/api/student/registered_courses?semester=';
  static const String downloadForm = '/api/student/form_b/download?semester=';
  static const String registrationPossibilities =
      '/api/student/registration/eligible';
  // static const String getCaResult = '/api/student/results/ca?semester=';
  static const String getExamResult = '/api/student/results/exam?semester=';
  static const String getCaResult = '/api/student/results/ca?semester=';
  static const String downloadResult =
      '/api/student/results/exam/download?semester=';
  static const String getFees = '/api/student/fee';
  static const String getFaqs = '/api/student/faqs';
  static const String getStudentProfile = '/api/student/profile_details';
  static const String getStudentCourses = '/api/student/notifications';

  // Teacher Apis
  static const String teacherLogin = '/api/login/teacher?email=';
  static const String getTeacherCourses = '/api/teacher/courses';
  static const String createAnnouncement = '/api/teacher/create_notification?';
  static const String getAllAnnouncements =
      '/api/teacher/all_course_notifications?';
  static const String updateAnnouncement =
      '/api/teacher/update_course_notification/';
  static const String deleteAnnouncement =
      '/api/teacher/delete_course_notification/';
  static const String getTeacherCourseList = '/api/teacher/course_list?course=';
  static const String teacherLogout = '/api/logout/teacher';
  static const String getTeacherStudentProfile =
      '/api/teacher/student_profile?student=';

  // Parent Apis
  static const String getYears = '/api/year';
  static const String getParentSemester = '/api/parent/semesters';
  static const String parentBiakaLogin = '/api/parent/login';
  static const String parentBiakaProfile = '/api/parent/my-profile';
  static const String parentBiakaEvent = '/api/parent/event';
  static const String parentLogin = '/api/login/user?phone=';
  static const String getParentProfile = '/api/parent/profile';
  static const String getParentStudents = '/api/parent/students';
  static const String getParentStudentFeesHistory = '/api/parent/fee?student=';
  static const String getParentStudentResult = '/api/parent/result?student=';
  static const String getParentRegisteredCourses =
      '/api/parent/registerd_courses?student=';
  static const String parentLogout = '/api/logout/user';

  // Common Apis
  static const String privacyPolicy = '/mobile_privacy_policy';
  static const String termsAndCondition = '/mobile_term_condition';
  static const String about = '/mobile_about_us';

  //--------------------------- Keys ------------------------------
  static const String keyUserId = '#usdfhsskjdedsrmidsdsd';
  static const String keyToken = '#tsdosdksdesdnds';
  static const String keyUserId1 = '#usdfhsskjdedsrmidsdsd1';
  static const String keyToken1 = '#tsdosdksdesdnds1';
  static const String keyRole = '#rlkdfnodsfgldsed';
  static const String keyOnboarding = '#osdnsdhbsdfoadfsasdkj';
  static const String academicYear = '#wrwefacademicyearfsdff';
  static const String semester = '#dfsfdfsemesterfsdfds';

  // This will be the URL used throughout the app
  static String currentSchoolUrl = "";

  // Method to set the current school URL
  static void setCurrentSchoolUrl(String apiRoot) {
    currentSchoolUrl = apiRoot;
    // remove /api at the end
    if (currentSchoolUrl.endsWith('/api')) {
      currentSchoolUrl = currentSchoolUrl.substring(0, currentSchoolUrl.length - 4);
      SchoolPreference.saveSchoolApiRoot(currentSchoolUrl);
    }

    reinitializeDioClient();
    print("current: $currentSchoolUrl");
  }


  // Method to set the current school ID
  static void setCurrentSchoolID(String id) {
    SchoolPreference.saveSchoolID(id);
  }

  // Method to reset the current school URL (e.g., on logout)
  static void resetCurrentSchoolUrl() {
    currentSchoolUrl = "";
    SchoolPreference.clearSchoolApiRoot();
    reinitializeDioClient();
  }

  static void reinitializeDioClient() {

    sl.unregister<DioClient1>();  // Unregister the old DioClient1

    print("api current school: ${ApiConstant.currentSchoolUrl}");
    sl.registerFactory(() => DioClient1(
        ApiConstant.currentSchoolUrl, sl<Dio>(instanceName: 'dio2'),
     sharedPreferences: sl()));
  }

  static String getLogin(int roleType) {
    return roleType == getRoleType(RoleEnum.student)
        ? login
        : roleType == getRoleType(RoleEnum.teacher)
            ? repLogin
            : roleType == getRoleType(RoleEnum.parent)
                ? parentBiakaLogin
                : leaderLogin;
  }

  static String getVerifyOtp(int roleType) {
    return roleType == getRoleType(RoleEnum.student)
        ? verifyOtp
        : roleType == getRoleType(RoleEnum.teacher)
            ? repVerifyOtp
            : leaderVerifyOtp;
  }

  static String getProfile(int roleType) {
    return roleType == getRoleType(RoleEnum.student)
        ? myProfile
        : roleType == getRoleType(RoleEnum.teacher)
            ? repMyProfile
            : roleType == getRoleType(RoleEnum.parent)
                ? parentBiakaProfile
                : leaderMyProfile;
  }

  static String getforgetPassword(int roleType) {
    if (roleType == getRoleType(RoleEnum.student)) {
      return forgetPassword;
    } else if (roleType == getRoleType(RoleEnum.teacher)) {
      return repForgetPassword;
    } else {
      return leaderForgotPassword;
    }
  }

  static String getForgetPasswordVerifyOtp(int roleType) {
    return roleType == getRoleType(RoleEnum.student)
        ? forgetPasswordOtpVerify
        : roleType == getRoleType(RoleEnum.teacher)
            ? repForgetPasswordOtpVerify
            : leaderForgetPasswordotpVerify;
  }

  static String getResetPassword(int roleType) {
    return roleType == getRoleType(RoleEnum.student)
        ? forgetPasswordReset
        : roleType == getRoleType(RoleEnum.student)
            ? repForgetPasswordReset
            : leaderForgetPasswordReset;
  }

  static String getBanner(int roleType) {
    return roleType == getRoleType(RoleEnum.student) ? banner : repBanner;
  }

  static String getDeleteAccount(int roleType) {
    return roleType == getRoleType(RoleEnum.student)
        ? deleteAccount
        : roleType == getRoleType(RoleEnum.teacher)
            ? repDeleteAccount
            : leaderDeleteProfile;
  }

  static String getEvents(int roleType) {
    return roleType == getRoleType(RoleEnum.student)
        ? userGetEvents
        : roleType == getRoleType(RoleEnum.teacher)
            ? repGetEvents
            : roleType == getRoleType(RoleEnum.parent)
                ? parentBiakaEvent
                : leaderGetEvent;
  }

  static String getNotificationUpdate(int roleType) {
    return roleType == getRoleType(RoleEnum.student)
        ? userNotificationUpdate
        : roleType == getRoleType(RoleEnum.teacher)
            ? repNotificationUpdate
            : leaderNotificationUpdate;
  }

  static String getRequestApproval(int roleType) {
    return roleType == getRoleType(RoleEnum.teacher)
        ? repGetRequestApproval
        : leaderGetApprovals;
  }
}

const String successCode = '200';
const int successCode1 = 200;
const String pending = 'Pending';
const String assigned = 'Assigned';
const String inProgress = 'In Progress';
const String resolved = 'Resolved';
const String cancelled = 'Cancelled';
const String reopened = 'Re Open';
