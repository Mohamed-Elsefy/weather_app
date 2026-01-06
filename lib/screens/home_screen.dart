import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/app_spacing.dart';
import 'package:weather_app/core/utils/safe_padding.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widgets/daily_forecast.dart';
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
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.p_12),
            child: Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: weatherAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) {
          return Center(child: Text(e.toString(), textAlign: TextAlign.center));
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
