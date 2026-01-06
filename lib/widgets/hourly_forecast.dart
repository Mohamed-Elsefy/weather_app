import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/constants/app_radius.dart';
import 'package:weather_app/core/constants/app_size.dart';
import 'package:weather_app/core/constants/app_spacing.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/models/api_models/weather_hourly.dart';
import 'package:weather_app/models/api_models/weather_response.dart';

class HourlyForecast extends StatelessWidget {
  final WeatherResponse weather;

  const HourlyForecast({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final hours = weather.hourly;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).hourlyForecast, style: theme.textTheme.titleLarge),
        AppSpacing.v_12,

        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: hours.length,
            separatorBuilder: (_, _) => AppSpacing.h_12,
            itemBuilder: (context, index) {
              final hour = hours[index];
              final time = DateFormat.Hm().format(DateTime.parse(hour.time));

              return _forecastChip(theme, time, hour);
            },
          ),
        ),
      ],
    );
  }

  Container _forecastChip(ThemeData theme, String time, WeatherHourly hour) {
    return Container(
      width: AppSize.s_60,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.p_12),
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r_16),
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time, style: theme.textTheme.labelMedium),
          Image.network(
            'https:${hour.icon}',
            width: AppSize.s_36,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.cloud_off,
                size: AppSize.s_36,
                color: Theme.of(context).colorScheme.primary,
              );
            },
          ),
          Text('${hour.tempC.round()}°', style: theme.textTheme.titleMedium),
        ],
      ),
    );
  }
}
