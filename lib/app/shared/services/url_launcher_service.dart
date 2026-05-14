import 'dart:io';
import 'package:flutter_boilerplate/app/shared/utils/task_runner.dart';
import 'package:flutter_boilerplate/app/shared/utils/typdefs.dart';
import 'package:flutter_boilerplate/app/shared/utils/validators.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  UrlLauncherService._();
  static final UrlLauncherService instance = UrlLauncherService._();

  FutureEither<void> launch(String url, {LaunchMode? mode}) async {
    return runTask(() async {
      final formattedUrl = _formatUrl(url);
      final uri = Uri.parse(formattedUrl);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: mode ?? LaunchMode.externalApplication);
      } else {
        throw Exception('Could not launch url: $formattedUrl');
      }
    });
  }

  String _formatUrl(String url) {
    if (url.isValidUrl && !url.contains('://')) {
      return 'https://$url';
    }
    if (url.isValidPhoneNumber) {
      return Platform.isAndroid
          ? 'whatsapp://send?phone=$url'
          : 'https://wa.me/$url';
    }
    return url;
  }
}
