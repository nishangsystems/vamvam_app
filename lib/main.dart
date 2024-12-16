import 'dart:io';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:go_router/go_router.dart';
import 'package:vam_vam/providers/ParentAuthProvider.dart';
import 'package:vam_vam/providers/courseProvider.dart';
import 'package:vam_vam/providers/masterProvider.dart';
import 'package:vam_vam/providers/parentProvider.dart';
import 'package:vam_vam/providers/resultProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/HomeProvider.dart';
import 'package:vam_vam/providers/addComplaintProvider.dart';
import 'package:vam_vam/providers/appointmentProvider.dart';
import 'package:vam_vam/providers/approvalProvider.dart';
import 'package:vam_vam/providers/bannerProvider.dart';
import 'package:vam_vam/providers/bottomHomebarProvider.dart';
import 'package:vam_vam/providers/dialogProvider.dart';
import 'package:vam_vam/providers/forgotPasswordProvider.dart';
import 'package:vam_vam/providers/locationMapProvider.dart';
import 'package:vam_vam/providers/myCalendarProvider.dart';
import 'package:vam_vam/providers/notificationProvider.dart';
import 'package:vam_vam/providers/onBoardingProvider.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/registerProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/providers/schoolsProvider.dart';
import 'package:vam_vam/providers/settingProvider.dart';
import 'package:vam_vam/providers/splashProvider.dart';
import 'package:vam_vam/providers/toDoProvider.dart';
import 'package:vam_vam/screens/notification/PushNotificationsManager.dart';
import 'package:vam_vam/screens/notification/notificationListScreen.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/utils/constant.dart';
import 'package:vam_vam/utils/fontConstant.dart';
import 'package:vam_vam/utils/schoolPreference.dart';
import 'package:vam_vam/widgets/route/goRoute.dart';
import 'diContainer.dart' as di;
import 'firebase_options.dart';
import 'http.dart';
import 'providers/eventProvider.dart';
import 'providers/profileDetailsProvider.dart';
import 'providers/surveyProvider.dart';
import 'providers/teacherProvider.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: "VamVam",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
  );

  await FlutterDownloader.initialize();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await _init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.sl<SchoolsProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<ParentAuthProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<OnBoardingProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<LocationMapProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<BottomHomeBarProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<AddComplaintProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<AppointmentProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<ProfileProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<ProfileDetailsProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<EventProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<SurveyProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<RoleProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<MyCalendarProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<RegisterProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<AddComplaintProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<DialogProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<ForgotPasswordProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<HomeProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<BannerProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<SettingProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<NotificationProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<ToDoProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<ApprovalProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<CourseProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<MasterProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<ResultProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<ParentProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<TeacherProvider>()),
      ],
      child: MyApp(),
    ),
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

_init() async {
  WidgetsFlutterBinding.ensureInitialized();
  loadSchoolApiRoot();
  await di.init();

  HttpOverrides.global = MyHttpOverrides();

  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);



  // Handle foreground messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {

      GoRoute(
        path: notificationlistscreen,
        builder: (context, state) => const NotificationListScreen(),
      );
    });

  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() =>
        Provider.of<AuthProvider>(context, listen: false).getDeviceToken());
    PushNotificationsManager().init();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'VamVam Uniport',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: FontRes.primary,
        primaryColor: primaryLight,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryDark),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: black,
            fontSize: 18,
          ),
        ),
        useMaterial3: true,
      ),
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!),
      routerConfig: goRouter,
    );
  }
}

Future<void> _messageHandler(RemoteMessage remoteMessage) async {
  if (kDebugMode) {
    print("onBackgroundMessage-->   ${remoteMessage.notification!.title!}");
  }
}
