import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/app_size.dart';
import 'package:weather_app/core/constants/app_spacing.dart';
import 'package:weather_app/core/utils/navigation.dart';
import 'package:weather_app/core/utils/safe_padding.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/settings_screen.dart';
import 'package:weather_app/widgets/animated_search_field.dart';
import 'package:weather_app/widgets/daily_forecast.dart';
import 'package:weather_app/widgets/exeption_widget.dart';
import 'package:weather_app/widgets/hourly_forecast.dart';
import 'package:weather_app/widgets/weather_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).weather),
        actions: [
          const AnimatedSearchField(),
          IconButton(
            onPressed: () {
              ref.read(weatherProvider.notifier).refresh();
            },
            icon: const Icon(Icons.gps_fixed),
            iconSize: AppSize.s_28,
          ),
          IconButton(
            onPressed: () => Navigation.push(context, const SettingsScreen()),
            icon: const Icon(Icons.settings),
            iconSize: AppSize.s_28,
          ),
        ],
      ),
      body: weatherAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (e, _) {
          return ExeptionWidget(
            exeption: e.toString(),
            onPressed: () {
              ref.read(weatherProvider.notifier).refresh();
            },
          );
        },

        data: (weather) => RefreshIndicator(
          onRefresh: () async {
            ref.read(weatherProvider.notifier).refresh();
          },
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: SafePadding.horizP(context),
            ),
            children: [
              WeatherCard(weather: weather),
              AppSpacing.v_32,
              HourlyForecast(weather: weather),
              AppSpacing.v_32,
              DailyForecast(weather: weather),
              AppSpacing.v_32,
            ],
          ),
        ),
      ),
    );
  }
}
