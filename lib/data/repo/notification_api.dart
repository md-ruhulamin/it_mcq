import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class NotificationController {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize(BuildContext context) async {
    await _requestPermission();
    await _initLocalNotifications();
    _setupFirebaseListeners(context);
  }

  static Future<void> _requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('✅ Notification permission granted');
    } else {
      debugPrint('⚠️ Notification permission denied');
    }
  }
  static Future<void> _initLocalNotifications() async {
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initSettings =
      InitializationSettings(android: androidSettings);

  await _localNotificationsPlugin.initialize(initSettings);

  // ✅ Create a high-importance notification channel
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // Must match channel ID used in show()
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
    playSound: true,
  );

  await _localNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
}



  static void _setupFirebaseListeners(BuildContext context) {
    // Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showLocalNotification(message);
    });

    // Background (when app is opened from notification)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNotificationTap(context, message);
    });

    // Terminated
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        _handleNotificationTap(context, message);
      }
    });
  }

  // static Future<void> _showLocalNotification(RemoteMessage message) async {
  //   const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
  //     'default_channel',
  //     'Default',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );

  //   const NotificationDetails platformDetails =
  //       NotificationDetails(android: androidDetails);

  //   await _localNotificationsPlugin.show(
  //     message.hashCode,
  //     message.notification?.title ?? 'No Title',
  //     message.notification?.body ?? 'No Body',
  //     platformDetails,
  //   );
  // }
static Future<void> _showLocalNotification(RemoteMessage message) async {
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'high_importance_channel', // ✅ Must match the created channel
    'High Importance Notifications',
    channelDescription: 'This channel is used for important notifications.',
    importance: Importance.high,
    priority: Priority.high,
    playSound: true,
  );

  const NotificationDetails platformDetails =
      NotificationDetails(android: androidDetails);

  await _localNotificationsPlugin.show(
    message.hashCode,
    message.notification?.title ?? 'No Title',
    message.notification?.body ?? 'No Body',
    platformDetails,
  );
}
static void _handleNotificationTap(BuildContext context, RemoteMessage message) {
  final route = message.data['route'];
  final content = message.data['content'];

  if (route == 'notification') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => NotificationPage(content: content),
      ),
    );
  }
}

  static void _handleNotificationTap2(BuildContext context, RemoteMessage message) {
    // TODO: Navigate to specific screen based on message data
    debugPrint('🔔 Notification tapped: ${message.data}');
  }
}

class FCMService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  /// Call this method to get the device's FCM token
  static Future<String?> getDeviceToken() async {
    try {
      final token = await _messaging.getToken();
      if (token != null) {
        print('📱 FCM Token: $token');
      } else {
        print('⚠️ FCM Token is null');
      }
      return token;
    } catch (e) {
      print('❌ Error fetching FCM token: $e');
      return null;
    }
  }
}
class NotificationPage extends StatelessWidget {
  final String content;

  const NotificationPage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(content, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
