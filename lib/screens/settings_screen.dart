import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/app_spacing.dart';
import 'package:weather_app/core/utils/safe_padding.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/widgets/language_switcher.dart';
import 'package:weather_app/widgets/theme_switcher.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).settings)),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: SafePadding.horizP(context)),
        children: [
          _SectionTitle(title: S.of(context).general),
          AppSpacing.v_12,

          const Card(
            child: Column(
              children: [
                LanguageSwitcher(),
                Divider(height: 1),
                ThemeSwitcher(),
              ],
            ),
          ),

          AppSpacing.v_32,

          _SectionTitle(title: S.of(context).about),
          AppSpacing.v_12,

          Card(
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(S.of(context).weather),
              subtitle: Text(S.of(context).weatherAppV),
            ),
          ),

          AppSpacing.v_24,

          Text(
            S.of(context).settingsHint,
            style: theme.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(title, style: theme.textTheme.titleMedium);
  }
}
