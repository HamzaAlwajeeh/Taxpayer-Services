import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  NotificationService._();

  static const String taxDeclarationTitle = 'الإقرار الضريبي';
  static const String taxDeclarationBody =
      'عزيزي العميل يرجي مراجعة مكتب الضرائب من أجل عمل الإقرار الضريبي';

  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const String _channelId = 'tax_payer_general_notifications';
  static const String _channelName = 'General Notifications';
  static const String _channelDesc =
      'General alerts and updates for Tax Payer.';

  static const AndroidNotificationChannel _androidChannel =
      AndroidNotificationChannel(
        _channelId,
        _channelName,
        description: _channelDesc,
        importance: Importance.high,
      );

  // 🔥 INIT
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

  // 🔐 Permissions
  static Future<void> _requestPermissions() async {
    final android =
        _plugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();

    await android?.requestNotificationsPermission();

    final ios =
        _plugin
            .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin
            >();

    await ios?.requestPermissions(alert: true, badge: true, sound: true);
  }

  // 📦 Channel
  static Future<void> _createAndroidChannel() async {
    final android =
        _plugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();

    await android?.createNotificationChannel(_androidChannel);
  }

  // 🔔 فوري (للتجربة السريعة)
  static Future<void> showBasicNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDesc,
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

  // 🚀 TEST زر سريع (بعد 5 ثواني)
  static Future<void> testScheduledNotification() async {
    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDesc,
      importance: Importance.high,
      priority: Priority.high,
      icon: 'ic_notification',
    );

    const iosDetails = DarwinNotificationDetails();

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    final scheduledDate = tz.TZDateTime.now(
      tz.local,
    ).add(const Duration(seconds: 5));

    await _plugin.zonedSchedule(
      999,
      'Test Notification',
      'هذه رسالة اختبار مجدولة بعد 5 ثواني',
      scheduledDate,
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  // 📅 إشعارات من يناير إلى أبريل (مرة واحدة فقط)
  static Future<void> scheduleTaxRemindersJanToApr() async {
    try {
      final now = tz.TZDateTime.now(tz.local);
      final year = now.year;

      final dates = [
        tz.TZDateTime(tz.local, year, 1, 1, 9),
        tz.TZDateTime(tz.local, year, 2, 1, 9),
        tz.TZDateTime(tz.local, year, 3, 1, 9),
        tz.TZDateTime(tz.local, year, 4, 1, 9),
      ];

      for (int i = 0; i < dates.length; i++) {
        final scheduled = dates[i];

        if (scheduled.isBefore(now)) continue;

        await _plugin.zonedSchedule(
          i + 1,
          'الإقرار الضريبي',
          'تذكير بموعد الإقرار الضريبي',
          scheduled,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'tax_payer_general_notifications',
              'General Notifications',
              importance: Importance.high,
              priority: Priority.high,
              icon: '@mipmap/ic_launcher',
            ),
          ),
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
        );
      }
    } catch (e) {
      debugPrint("scheduleTaxRemindersJanToApr error: $e");
    }
  }

  // 📱 عند فتح التطبيق من الإشعار
  static Future<NotificationAppLaunchDetails?> getLaunchDetails() {
    return _plugin.getNotificationAppLaunchDetails();
  }

  @visibleForTesting
  static FlutterLocalNotificationsPlugin get plugin => _plugin;
}
