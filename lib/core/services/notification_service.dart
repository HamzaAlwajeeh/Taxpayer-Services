import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  NotificationService._();

  static const String taxDeclarationTitle = 'الإقرار الضريبي';
  static const String taxDeclarationBody =
      'عزيزي العميل يرجي مراجعة مكتب الضرائب من أجل عمل الإقرار الضريبي';

  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _androidChannel =
      AndroidNotificationChannel(
        'tax_payer_general_notifications',
        'General Notifications',
        description: 'General alerts and updates for Tax Payer.',
        importance: Importance.high,
      );

  static Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings('ic_notification');
    const iosSettings = DarwinInitializationSettings();

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _plugin.initialize(settings);
    await _requestPermissions();
    await _createAndroidChannel();
  }

  static Future<void> _requestPermissions() async {
    final androidImplementation =
        _plugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();
    await androidImplementation?.requestNotificationsPermission();

    final iosImplementation =
        _plugin
            .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin
            >();
    await iosImplementation?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  static Future<void> _createAndroidChannel() async {
    final androidImplementation =
        _plugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();
    await androidImplementation?.createNotificationChannel(_androidChannel);
  }

  static Future<void> showBasicNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'tax_payer_general_notifications',
      'General Notifications',
      channelDescription: 'General alerts and updates for Tax Payer.',
      importance: Importance.high,
      priority: Priority.high,
      icon: 'ic_notification',
    );
    const iosDetails = DarwinNotificationDetails();

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _plugin.show(id, title, body, details);
  }

  static Future<void> showTaxDeclarationReminder() async {
    await showBasicNotification(
      id: 1,
      title: taxDeclarationTitle,
      body: taxDeclarationBody,
    );

    await Future<void>.delayed(const Duration(seconds: 10));

    await showBasicNotification(
      id: 2,
      title: taxDeclarationTitle,
      body: taxDeclarationBody,
    );
  }

  static Future<NotificationAppLaunchDetails?> getLaunchDetails() {
    return _plugin.getNotificationAppLaunchDetails();
  }

  @visibleForTesting
  static FlutterLocalNotificationsPlugin get plugin => _plugin;
}
