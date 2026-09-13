import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radio/provider/frequently_played.dart';
import 'package:radio/utils/shared_pref.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  static const _version = '1.1.7';
  static const _repoUrl = 'https://github.com/2shrestha22/radio';


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: Theme.of(context).iconTheme.color),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('About'),
      ),
      body: ListView(
            children: [
              const SizedBox(height: 24),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/radio-np.png',
                  width: 80,
                  height: 80,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Radio NP',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'Nepali Internet Radio',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 32),
              _Tile(
                icon: HugeIcon(icon: HugeIcons.strokeRoundedInformationCircle, color: colorScheme.primary),
                title: 'Version',
                subtitle: _version,
              ),
              _Tile(
                icon: HugeIcon(icon: HugeIcons.strokeRoundedSourceCodeCircle, color: colorScheme.primary),
                title: 'Source Code',
                subtitle: 'View on GitHub',
                onTap: () => launchUrl(Uri.parse(_repoUrl)),
              ),
              if (!kIsWeb)
                _Tile(
                  icon: HugeIcon(icon: HugeIcons.strokeRoundedStar, color: colorScheme.primary),
                  title: 'Rate Us',
                  subtitle: Platform.isIOS ? 'Rate on App Store' : 'Rate on Play Store',
                  onTap: () => launchUrl(
                    Uri.parse(
                      Platform.isIOS
                          ? 'https://apps.apple.com/app/id6504672941'
                          : 'https://play.google.com/store/apps/details?id=np.com.sargam.radio',
                    ),
                  ),
                ),
              const Divider(height: 32),
              _Tile(
                icon: HugeIcon(icon: HugeIcons.strokeRoundedDelete02, color: colorScheme.primary),
                title: 'Clear Frequently Played',
                subtitle: 'Reset your frequently played stations',
                onTap: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Clear Frequently Played?'),
                      content: const Text(
                        'This will reset your frequently played stations list.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Clear'),
                        ),
                      ],
                    ),
                  );
                  if (confirmed == true) {
                    await SharedPref.clearFrecency();
                    ref.invalidate(frequentlyPlayedProvider);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Frequently played stations cleared'),
                        ),
                      );
                    }
                  }
                },
              ),
            ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final Widget icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: onTap != null
          ? HugeIcon(
              icon: HugeIcons.strokeRoundedArrowRight01,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            )
          : null,
      onTap: onTap,
    );
  }
}
