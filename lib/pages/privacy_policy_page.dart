import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  static const githubUrl = 'https://github.com/2shrestha22/radio';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Effective Date: Aug 8, 2024',
                style: context.textStyles.titleMedium,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Radio NP is a free, open-source application and does not collect anything from the end users.',
              ),
              const SizedBox(height: 16.0),
              Text(
                'Streaming APIs',
                style: context.textStyles.titleLarge,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'The application streams audio using original Radio station provided endpoints or third-party streaming endpoints. While the app do not collect any personal data, please refer to the streaming provider\'s privacy policy for more information on how they handle data.',
              ),
              const SizedBox(height: 16.0),
              Text(
                'Open Source',
                style: context.textStyles.titleLarge,
              ),
              const SizedBox(height: 8.0),
              RichText(
                text: TextSpan(
                  text:
                      'This app is open-source. You can view and contribute to the code on ',
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'GitHub',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunchUrl(Uri.parse(githubUrl))) {
                            await launchUrl(Uri.parse(githubUrl));
                          } else {
                            throw 'Could not launch $githubUrl';
                          }
                        },
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Changes',
                style: context.textStyles.titleLarge,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Policy may be updated occasionally. Changes will be posted here.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'By using this app, you consent to this privacy practices.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
