// ignore_for_file: avoid_print, unused_local_variable
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vam_vam/main.dart';

class PushNotificationsManager {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Initialize all Settings -->
    var initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _firebaseMessaging.requestPermission(
      badge: true,
      alert: true,
      provisional: true,
    );

    //Configuration of new notification -->
    print("<--Inside--Notification--Manager-->");
    FirebaseMessaging.onMessage.listen((RemoteMessage initialMessage) async {
      String notificationTitle = '';
      String notificationBody = '';
      if (initialMessage.notification != null) {
        print("onMessage-->${initialMessage.notification!.title}");
        notificationTitle = initialMessage.data['title'].toString();
        notificationBody = initialMessage.data['body'].toString();
      } else {
        print("onMessage-->${initialMessage.data['title']}");
        notificationTitle = initialMessage.data['title'].toString();
        notificationBody = initialMessage.data['body'].toString();
      }

      var androidPlatformChannelSpecifics =
      AndroidNotificationDetails(channel.id, channel.name,
          channelDescription: channel.description,
          importance: Importance.max,
          playSound: true,
          icon: "@mipmap/ic_launcher",
          // sound: RawResourceAndroidNotificationSound('notification'),
          showProgress: true,
          priority: Priority.high,
          ticker: 'test ticker');

      var iOSChannelSpecifics = DarwinNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics, iOS: iOSChannelSpecifics);

      ///Show notification container -->
      await flutterLocalNotificationsPlugin.show(
          0, notificationTitle, notificationBody, platformChannelSpecifics,
          payload: 'test');

      /*const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('your channel id', 'your channel name',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');
      const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
      await flutterLocalNotificationsPlugin.show(
          0, 'plain title', 'plain body', notificationDetails,
          payload: 'item x');*/
    });

    /*await flutterLocalNotificationsPlugin.show(
          0, notificationTitle, notificationBody,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'channel.id',
            'channel.name',
            icon: '@mipmap/ic_launcher',
          ),
        ),
      );*/

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      print("onMessageOpenedApp-->  ${remoteMessage.data}");
    });
  }
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
    print("BData $data");
  }

  if (message.containsKey('notification')) {
    //Handle notification message
    final dynamic notification = message['notification'];
    print("BNotification----->>>   $notification");
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
  flutterLocalNotificationsPlugin.show(
    message.hashCode,
    message.data['title'],
    message.data['body'],
    NotificationDetails(
      android: AndroidNotificationDetails(channel.id, channel.name,
          playSound: true,
          importance: Importance.max,
          priority: Priority.high,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: '@mipmap/app_icon',
          ticker: 'test ticker'),
    ),
  );
}

/*

static final navigatorKey = GlobalKey<NavigatorState>();

  Future onSelectNotification(String? payload) async {
    Map data = json.decode(payload!);
    log('message======>>>>  $data');
    await Navigator.push(
      navigatorKey.currentState!.context,
      MaterialPageRoute(
        builder: (context) => OrderDetails(
          orderId: '21',
          userId: '2',
        ),
      ),
    );
  }

=======================================================================


final FlutterLocalNotificationsPlugin flutterLocalNotify =
        FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings();

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotify.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        log('A new onMessagep event was published!' +
            message.data['title'].toString() +
            '     ' +
            message.data['message'].toString());

        log('Data----->   ${message.data}');

        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        // if (notification != null && android != null) {
        flutterLocalNotify.show(
          notification.hashCode,
          message.data['title'],
          message.data['message'],
          NotificationDetails(
            android: AndroidNotificationDetails(
              'channel_ID',
              'channel name',
              channelDescription: 'channel description',
              importance: Importance.max,
              playSound: true,
              showProgress: true,
              priority: Priority.high,
              ticker: 'test ticker',
              sound: RawResourceAndroidNotificationSound('ring'),
            ),
          ),
          payload: json.encode(message.data),
          // payload: message.data['payload']
        );
        /*   Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OrderDetails(
              deliveryBoyId: message.data['deliveruboyid'].toString(),
              orderId: message.data['order_id'].toString(),
              userId: message.data['user_id'].toString(),
            ),
          ),
        ); */
        // }
      },
    );

*/
