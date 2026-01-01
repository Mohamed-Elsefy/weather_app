import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/providers/locale_provider.dart';

class LanguageSwitcher extends ConsumerWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(S.of(context).language),
      trailing: DropdownButton<Locale>(
        value: ref.watch(localeProvider),
        items: [
          DropdownMenuItem(
            value: const Locale('en'),
            child: Text(S.of(context).english),
          ),
          DropdownMenuItem(
            value: const Locale('ar'),
            child: Text(S.of(context).arabic),
          ),
        ],
        onChanged: (value) {
          if (value != null) {
            ref.read(localeProvider.notifier).setLocale(value);
          }
        },
      ),
    );
  }
}
