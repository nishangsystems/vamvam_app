import 'dart:io';

import 'package:vam_vam/data/repo/schoolRepo.dart';
import 'package:vam_vam/providers/courseProvider.dart';
import 'package:vam_vam/providers/masterProvider.dart';
import 'package:vam_vam/providers/parentProvider.dart';
import 'package:vam_vam/providers/resultProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
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
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/utils/fontConstant.dart';
import 'package:vam_vam/utils/schoolPreference.dart';
import 'package:vam_vam/widgets/route/goRoute.dart';
import 'diContainer.dart' as di;
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
  await _init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.sl<SchoolsProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
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

_init() async {
  WidgetsFlutterBinding.ensureInitialized();
  loadSchoolApiRoot();
  await di.init();

  // Flutter Downloader
  await FlutterDownloader.initialize(
    debug: true,
    ignoreSsl: true,
  );
  HttpOverrides.global = MyHttpOverrides();

  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: Platform.isAndroid
              ? 'AIzaSyDNx5VpXN2gcrbfxML1tyYSHYUfwST4cyA'
              : 'AIzaSyDvtKOCN1ENw0mgggwlGRQy39sWhB2rx-g',
          appId: Platform.isAndroid
              ? '1:772996709358:android:eaf13c720b460a56026cff'
              : '1:772996709358:ios:58da51f4a4745ef0026cff',
          messagingSenderId: '772996709358',
          projectId: 'biaka-b2945'));

  FirebaseMessaging.onBackgroundMessage(_messageHandler);

  // await NotificationHelper.initialize(flutterLocalNotificationsPlugin!);
  // FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  // FirebaseMessaging.onBackgroundMessage(_messageHandler);*/
  // await  NotificationService().setupFirebase(flutterLocalNotificationsPlugin!);
  // await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
  // FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
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
      title: 'Vam Vam',
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
