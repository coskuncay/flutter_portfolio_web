import 'package:url_launcher/url_launcher.dart';

class Launcher {
  static Future<void> launchInBrowser(String url) async {
    try {
      await launch(
        url,
      );
    } catch (e) {
      throw 'Could not launch $url';
    }
  }
}
