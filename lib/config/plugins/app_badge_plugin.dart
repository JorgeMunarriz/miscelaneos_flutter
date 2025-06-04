import 'package:miscelaneos/lib_barrel.dart';

class AppBadgePlugin {
  static Future<bool> get isBadgeSupported async {
    return true;
  }

  static Future<void> updateBadgeCount(int count) async {
    if (!await isBadgeSupported) {
      print('Badge no soportado');
      return;
    }
    if (count > 0) {
      await FlutterLocalNotifications.showBadgeNotification(count);
    } else {
      await removeBadge();
    }
  }

  static Future<void> removeBadge() async {
    if (!await isBadgeSupported) {
      print('Badge no soportado');
      return;
    }

    await FlutterLocalNotifications.removeBadge();
  }
  
}
