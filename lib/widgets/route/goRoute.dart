import 'package:go_router/go_router.dart';
import 'package:vam_vam/screens/auth/parent/login_screen.dart';
import 'package:vam_vam/screens/auth/parent/verify_phone.dart';
import 'package:vam_vam/screens/auth/registerScreen.dart';
import 'package:vam_vam/screens/bookAppointment/repBookAppointment.dart';
import 'package:vam_vam/screens/forgotPassword/forgotPasswordResetScreen.dart';
import 'package:vam_vam/screens/forgotPassword/forgotPasswordScreen.dart';
import 'package:vam_vam/screens/modules/admin/calendar/repCalender.dart';
import 'package:vam_vam/screens/modules/admin/complaint/leaderTrackComplaintScreen.dart';
import 'package:vam_vam/screens/modules/home/home_widget.dart';
import 'package:vam_vam/screens/modules/admin/home/surveys/addSurveyScreen.dart';
import 'package:vam_vam/screens/modules/admin/home/surveys/allSurveyScreen.dart';
import 'package:vam_vam/screens/modules/parent/bottomHomeScreen.dart';
import 'package:vam_vam/screens/modules/representative/BottomHomeBar.dart';
import 'package:vam_vam/screens/modules/representative/complaintStatus/complaintStatusScreen.dart';
import 'package:vam_vam/screens/modules/representative/complaintStatus/repTrackComplaintScreen.dart';
// import 'package:vam_vam/screens/modules/representative/complaintStatus/repUpdateComplaintScreen.dart';
import 'package:vam_vam/screens/modules/representative/events/eventScreen.dart';
import 'package:vam_vam/screens/modules/search/search_widget.dart';
// import 'package:vam_vam/screens/modules/user/complaintStatus/complaintStatusScreen.dart';
// import 'package:vam_vam/screens/modules/user/complaintStatus/reviewComplaintScreen.dart';
import 'package:vam_vam/screens/modules/user/events/eventScreen.dart';
import 'package:vam_vam/screens/notification/notificationListScreen.dart';
import 'package:vam_vam/screens/onBoarding/onBoardingScreen.dart';
import 'package:vam_vam/screens/role/roleScreen.dart';
import 'package:vam_vam/screens/track/trackScreen.dart';

// import '../../screens/addComplaint/AddComplaintScreen.dart';
// import '../../screens/auth/locationMapScreen.dart';
import '../../screens/auth/loginScreen.dart';
import '../../screens/auth/verifyOTPScreen.dart';
import '../../screens/bookAppointment/BookAppointmentScreen.dart';
import '../../screens/modules/admin/calendar/calendarScreen.dart';
import '../../screens/modules/admin/complaint/complaintScreen.dart';
import '../../screens/modules/admin/home/BottomHomeBar.dart';
// import '../../screens/modules/admin/home/events/adminCreateEvent.dart';
import '../../screens/modules/admin/home/events/eventScreen.dart';
import '../../screens/modules/admin/home/surveys/surveyScreen.dart';
import '../../screens/modules/admin/meeting/meetingScreen.dart';
import '../../screens/modules/representative/complaintStatus/requestApprovalScreen.dart';
import '../../screens/modules/representative/reqApproval/addReqApprovalScreen.dart';
import '../../screens/modules/representative/reqApproval/reqApprovalScreen.dart';
import '../../screens/modules/representative/toDo/ToDoScreen.dart';
import '../../screens/modules/user/BottomHomeBar.dart';
import '../../screens/profile/editProfileScreen.dart';
import '../../screens/profile/profileScreen.dart';
import '../../screens/profile/profileScreenDetails.dart';
import '../../screens/setting/settingScreen.dart';
import '../../screens/splash/splash.dart';
import '../../utils/constant.dart';

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      path: splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: onBoarding,
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
        path: homeScreen,
        builder: (context, state) => const Index()
    ),
    GoRoute(
      path: '$login/:schoolName',
      builder: (context, state) => LoginScreen(
        schoolName: state.pathParameters['schoolName'].toString(),
      ),
    ),
    GoRoute(
      path: '$loginParent/:schoolName',
      builder: (context, state) => ParentLoginScreen(
        schoolName: state.pathParameters['schoolName'].toString(),
      ),
    ),
    GoRoute(
      path: verifyOTP,
      builder: (context, state) => const VerifyOTPScreen(),
    ),
    GoRoute(
      path: verifyPhonePage,
      builder: (context, state) => const ProfileVerifyPhone(),
    ),
    // GoRoute(
    //   path: '$locationMapScreen/:locator',
    //   builder: (context, state) =>
    //       LocationMapScreen(locator: '${state.pathParameters['locator']}'),
    // ),
    GoRoute(
      path: '$repRequestApprovalScreen/:complaintId',
      builder: (context, state) => RepRequestApprovalScreen(
          complaintId: '${state.pathParameters['complaintId']}'),
    ),
    // GoRoute(
    //   path: addComplain,
    //   builder: (context, state) => const AddComplaintScreen(),
    // ),
    GoRoute(
      path: bookAppointment,
      builder: (context, state) => const BookAppointmentScreen(),
    ),

    GoRoute(
      path: repbookAppointment,
      builder: (context, state) => const RepBookAppointmentScreen(),
    ),

    GoRoute(
        path: searchScreen,
        builder: (context, state) => const SearchWidget()
    ),

// GoRoute(
//       path: leaderbookAppointment,
//       builder: (context, state) => const LeaderBookAppointmentScreen(),
//     ),

    GoRoute(
      path: notificationlistscreen,
      builder: (context, state) => const NotificationListScreen(),
    ),

    GoRoute(
      path: register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: profile,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: editProfile,
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: profileDetails,
      builder: (context, state) => const ProfileScreenDetails(),
    ),
    GoRoute(
      path: survey,
      builder: (context, state) => const SurveyScreen(),
    ),
    GoRoute(
      path: calendar,
      builder: (context, state) => const CalendarScreen(),
    ),

    GoRoute(
      path: repcalendar,
      builder: (context, state) => const RepCalendarScreen(),
    ),

    GoRoute(
      path: meeting,
      builder: (context, state) => const MeetingScreen(),
    ),
    GoRoute(
      path: complaint,
      builder: (context, state) => const ComplaintScreen(),
    ),
    GoRoute(
      path: reqApproval,
      builder: (context, state) => const RequestApprovalScreen(),
    ),
    GoRoute(
      path: addReqApproval,
      builder: (context, state) => const AddReqApprovalScreen(),
    ),
    GoRoute(
      path: toDo,
      builder: (context, state) => const ToDoScreen(),
    ),
    GoRoute(
      path: track,
      builder: (context, state) => const TrackScreen(),
    ),
    GoRoute(
      path: setting,
      builder: (context, state) => const SettingScreen(),
    ),

    GoRoute(
      path: forgotPassword,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: forgotPasswordReset,
      builder: (context, state) => const ForgotPasswordResetScreen(),
    ),

    // User Module
    GoRoute(
      path: userBottomHomeBar,
      builder: (context, state) => const UserBottomHomeBar(),
    ),
    GoRoute(
      path: userEvent,
      builder: (context, state) => const UserEventScreen(),
    ),
    // GoRoute(
    //   path: userComplaintStatus,
    //   builder: (context, state) => const UserComplaintStatusScreen(),
    // ),
    GoRoute(
      path: '$role/:schoolName',
      builder: (context, state) => RoleScreen(
          schoolName: state.pathParameters['schoolName'].toString()
      ),
    ),

    // Admin Module
    GoRoute(
      path: adminBottomHomeBar,
      builder: (context, state) => const AdminBottomHomeBar(),
    ),
    GoRoute(
      path: paretnBottomHomeBar,
      builder: (context, state) => const ParentBottomHomeScreen(),
    ),
    GoRoute(
      path: adminEvent,
      builder: (context, state) => const AdminEventScreen(),
    ),
    // GoRoute(
    //   path: '$reviewComplaint/:complaintId',
    //   builder: (context, state) => ReviewComplaintScreen(
    //       complaintId: state.pathParameters['complaintId'].toString()),
    // ),
    GoRoute(
      path: addSurveyScreen,
      builder: (context, state) => const AddSurveyScreen(),
    ),
    GoRoute(
      path: allSurvey,
      builder: (context, state) => const AllSurveyScreen(),
    ),
    GoRoute(
      path: '$leaderTrackComplaint/:complaintId',
      builder: (context, state) => LeaderTrackComplaintScreen(
          complaintId: state.pathParameters['complaintId'].toString()),
    ),
    // GoRoute(
    //   path: adminCreateEvent,
    //   builder: (context, state) => const AdminCreateEventScreen(),
    // ),

    // Represantative Module
    GoRoute(
      path: represantativeBottomHomeBar,
      builder: (context, state) => const RepresantativeBottomHomeBar(),
    ),
    GoRoute(
      path: represantativeEvent,
      builder: (context, state) => const RepresantativeEventScreen(),
    ),
    GoRoute(
      path: represantativeComplaintStatus,
      builder: (context, state) => const RepresantativeComplaintStatusScreen(),
    ),
    // GoRoute(
    //   path: '$represantativeUpdateComplaint/:complaintId/:assignComplaintId',
    //   builder: (context, state) => RepUpdateComplaintScreen(
    //       complaintId: state.pathParameters['complaintId'].toString(),
    //       assignComplaintId:
    //       state.pathParameters['assignComplaintId'].toString()),
    // ),
    // GoRoute(
    //   path: '$represantativeTrackComplaint/:complaintId',
    //   builder: (context, state) => RepTrackComplaintScreen(
    //       complaintId: state.pathParameters['complaintId'].toString()),
    // ),
  ],
);
