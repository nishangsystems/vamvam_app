import 'package:vam_vam/data/remote/dio/dioClient1.dart';
import 'package:vam_vam/data/repo/courseRepo.dart';
import 'package:vam_vam/data/repo/masterRepo.dart';
import 'package:vam_vam/data/repo/parentRepo.dart';
import 'package:vam_vam/data/repo/teacherRepo.dart';
import 'package:vam_vam/providers/courseProvider.dart';
import 'package:vam_vam/providers/masterProvider.dart';
import 'package:vam_vam/providers/parentProvider.dart';
import 'package:vam_vam/providers/resultProvider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/data/repo/addComplaintRepo.dart';
import 'package:vam_vam/data/repo/appointmentRepo.dart';
import 'package:vam_vam/data/repo/approvalRepo.dart';
import 'package:vam_vam/data/repo/authRepo.dart';
import 'package:vam_vam/data/repo/bannerRepo.dart';
import 'package:vam_vam/data/repo/eventRepo.dart';
import 'package:vam_vam/data/repo/forgotPasswordRepo.dart';
import 'package:vam_vam/data/repo/profileRepo.dart';
import 'package:vam_vam/data/repo/registerRepo.dart';
import 'package:vam_vam/data/repo/roleRepo.dart';
import 'package:vam_vam/data/repo/settingRepo.dart';
import 'package:vam_vam/data/repo/surveyRepo.dart';
import 'package:vam_vam/data/repo/toDoRepo.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/HomeProvider.dart';
import 'package:vam_vam/providers/addComplaintProvider.dart';
import 'package:vam_vam/providers/appointmentProvider.dart';
import 'package:vam_vam/providers/approvalProvider.dart';
import 'package:vam_vam/providers/bannerProvider.dart';
import 'package:vam_vam/providers/bottomHomebarProvider.dart';
import 'package:vam_vam/providers/dialogProvider.dart';
import 'package:vam_vam/providers/eventProvider.dart';
import 'package:vam_vam/providers/forgotPasswordProvider.dart';
import 'package:vam_vam/providers/locationMapProvider.dart';
import 'package:vam_vam/providers/myCalendarProvider.dart';
import 'package:vam_vam/providers/notificationProvider.dart';
import 'package:vam_vam/providers/onBoardingProvider.dart';
import 'package:vam_vam/providers/profileDetailsProvider.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/registerProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/providers/settingProvider.dart';
import 'package:vam_vam/providers/splashProvider.dart';
import 'package:vam_vam/providers/surveyProvider.dart';
import 'package:vam_vam/providers/teacherProvider.dart';
import 'package:vam_vam/providers/toDoProvider.dart';
import 'package:vam_vam/utils/apiConstant.dart';

import 'data/remote/dio/dioClient.dart';
import 'data/remote/dio/loggingInterceptor.dart';
import 'data/repo/resultRepo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio instances
  sl.registerLazySingleton<Dio>(() => Dio(), instanceName: 'dio1');
  sl.registerLazySingleton<Dio>(() => Dio(), instanceName: 'dio2');

  // Core
  sl.registerLazySingleton(() => DioClient(
      ApiConstant.baseUrl, sl<Dio>(instanceName: 'dio1'),
      loggingInterceptor: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => DioClient1(
      ApiConstant.baseUrl1, sl<Dio>(instanceName: 'dio2'),
      loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(
      () => RegisterRepo(prefs: sl(), dioClient: sl<DioClient>()));
  sl.registerLazySingleton(() => AuthRepo(
      prefs: sl(), dioClient: sl<DioClient>(), dioClient1: sl<DioClient1>()));
  sl.registerLazySingleton(
      () => AddComplaintRepo(prefs: sl(), dioClient: sl<DioClient>()));
  sl.registerLazySingleton(() => RoleRepo(prefs: sl()));
  sl.registerLazySingleton(() =>
      ProfileRepo(dioClient: sl<DioClient>(), dioClient1: sl<DioClient1>()));
  sl.registerLazySingleton(
      () => ForgotPasswordRepo(dioClient: sl<DioClient>(), prefs: sl()));
  sl.registerLazySingleton(
      () => BannerRepo(dioClient: sl<DioClient>(), prefs: sl()));
  sl.registerLazySingleton(
      () => SettingRepo(dioClient: sl<DioClient>(), prefs: sl()));
  sl.registerLazySingleton(
      () => SurveyRepo(dioClient: sl<DioClient>(), prefs: sl()));
  sl.registerLazySingleton(
      () => AppointmentRepo(dioClient: sl<DioClient>(), prefs: sl()));
  sl.registerLazySingleton(
      () => EventRepo(dioClient: sl<DioClient>(), prefs: sl()));
  sl.registerLazySingleton(
      () => ToDoRepo(dioClient: sl<DioClient>(), prefs: sl()));
  sl.registerLazySingleton(
      () => ApprovalRepo(dioClient: sl<DioClient>(), prefs: sl()));
  sl.registerLazySingleton(() => CourseRepo(
        dioClient1: sl<DioClient1>(),
      ));
  sl.registerLazySingleton(
      () => MasterRepo(dioClient1: sl<DioClient1>(), prefs: sl()));
  sl.registerLazySingleton(() => ResultRepo(dioClient1: sl<DioClient1>()));
  sl.registerLazySingleton(() => ParentRepo(dioClient1: sl<DioClient1>()));
  sl.registerLazySingleton(() => TeacherRepo(dioClient1: sl<DioClient1>()));

  // Providers
  sl.registerFactory(
      () => AddComplaintProvider(addComplaintRepo: sl<AddComplaintRepo>()));
  sl.registerFactory(() => AuthProvider(authRepo: sl<AuthRepo>()));
  sl.registerFactory(
      () => AppointmentProvider(appoinmentRepo: sl<AppointmentRepo>()));
  sl.registerFactory(
      () => NotificationProvider(appoinmentRepo: sl<AppointmentRepo>()));
  sl.registerFactory(() => BottomHomeBarProvider());
  sl.registerFactory(() => DialogProvider());
  sl.registerFactory(() => EventProvider(eventRepo: sl<EventRepo>()));
  sl.registerFactory(() => LocationMapProvider());
  sl.registerFactory(() => MyCalendarProvider());
  sl.registerFactory(() => OnBoardingProvider());
  sl.registerFactory(() => ProfileDetailsProvider());
  sl.registerFactory(() => ProfileProvider(profileRepo: sl<ProfileRepo>()));
  sl.registerFactory(() => RegisterProvider(registerRepo: sl<RegisterRepo>()));
  sl.registerFactory(() => RoleProvider(roleRepo: sl<RoleRepo>()));
  sl.registerFactory(() => SplashProvider());
  sl.registerFactory(() => SurveyProvider(surveyRepo: sl<SurveyRepo>()));
  sl.registerFactory(
      () => ForgotPasswordProvider(repo: sl<ForgotPasswordRepo>()));
  sl.registerFactory(() => HomeProvider());
  sl.registerFactory(() => BannerProvider(bannerRepo: sl<BannerRepo>()));
  sl.registerFactory(() => SettingProvider(settingRepo: sl<SettingRepo>()));
  sl.registerFactory(() => ToDoProvider(toDoRepo: sl<ToDoRepo>()));
  sl.registerFactory(() => ApprovalProvider(approvalRepo: sl<ApprovalRepo>()));
  sl.registerFactory(() => CourseProvider(courseRepo: sl<CourseRepo>()));
  sl.registerFactory(() => MasterProvider(masterRepo: sl<MasterRepo>()));
  sl.registerFactory(() => ResultProvider(resultRepo: sl<ResultRepo>()));
  sl.registerFactory(() => ParentProvider(parentRepo: sl<ParentRepo>()));
  sl.registerFactory(() => TeacherProvider(teacherRepo: sl<TeacherRepo>()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => LoggingInterceptor());
}
