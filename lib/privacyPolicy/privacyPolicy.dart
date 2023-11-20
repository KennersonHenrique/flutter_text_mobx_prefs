import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacityPolicy extends StatelessWidget {
  final url = 'https://www.google.com';
  final buttonTextColor = Colors.white;
  final labelFontSize = 25.0;

  PrivacityPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Text(
          "Política de privacidade",
          style: TextStyle(
            color: buttonTextColor,
            fontSize: labelFontSize,
          ),
        ),
        onTap: () => launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView));
  }
}
