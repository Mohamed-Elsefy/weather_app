import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_size.dart';
import 'package:weather_app/core/constants/app_spacing.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/models/api_models/weather_response.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.weather});

  final WeatherResponse weather;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.p_32,
          horizontal: AppSpacing.p_20,
        ),
        child: Column(
          children: [
            Text(weather.location.name, style: theme.textTheme.headlineSmall),
            AppSpacing.v_4,
            Text(weather.location.country, style: theme.textTheme.bodyMedium),
            AppSpacing.v_24,
            Image.network(
              'https:${weather.current.conditionIcon}',
              width: AppSize.s_100,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.cloud_off,
                  size: AppSize.s_100,
                  color: Theme.of(context).colorScheme.primary,
                );
              },
            ),

            AppSpacing.v_16,

            Text(
              '${weather.current.tempC.round()}°',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontSize: 64,
                fontWeight: FontWeight.w300,
              ),
            ),

            AppSpacing.v_4,

            Text(
              weather.current.conditionText,
              style: theme.textTheme.titleMedium,
            ),

            AppSpacing.v_24,

            const Divider(),

            AppSpacing.v_16,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _WeatherStat(
                  label: S.of(context).humidity,
                  value: '${weather.current.humidity}%',
                ),
                _WeatherStat(
                  label: S.of(context).wind,
                  value: '${weather.current.windKph} km/h',
                ),
                _WeatherStat(
                  label: S.of(context).feels,
                  value: '${weather.current.feelsLikeC.round()}°',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _WeatherStat extends StatelessWidget {
  final String label;
  final String value;

  const _WeatherStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(value, style: theme.textTheme.titleMedium),
        AppSpacing.v_4,
        Text(label, style: theme.textTheme.labelMedium),
      ],
    );
  }
}
