import 'package:url_launcher/url_launcher.dart';

Future<bool> launchInAppBrowser(
  String url, {
  LaunchMode mode = LaunchMode.inAppBrowserView,
}) async {
  return await launchUrl(
    Uri.parse(url),
    mode: mode,
    browserConfiguration: const BrowserConfiguration(
      showTitle: true,
    ),
  );
}
