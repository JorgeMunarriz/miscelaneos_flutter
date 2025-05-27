import 'package:share_plus/share_plus.dart';

class SharePlugin {
  static void shareLink(Uri link, String subject) {
    SharePlus.instance.share(ShareParams(uri: link, subject: subject));
  }
}
