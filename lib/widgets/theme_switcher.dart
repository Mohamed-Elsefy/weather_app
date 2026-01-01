import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/theme_provider.dart';
import 'package:weather_app/generated/l10n.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return ListTile(
      title: Text(S.of(context).theme),
      trailing: DropdownButton<ThemeMode>(
        value: themeMode,
        items: [
          DropdownMenuItem(
            value: ThemeMode.system,
            child: Text(S.of(context).systme),
          ),
          DropdownMenuItem(
            value: ThemeMode.light,
            child: Text(S.of(context).light),
          ),
          DropdownMenuItem(
            value: ThemeMode.dark,
            child: Text(S.of(context).dark),
          ),
        ],
        onChanged: (value) {
          if (value != null) {
            ref.read(themeProvider.notifier).setTheme(value);
          }
        },
      ),
    );
  }
}
