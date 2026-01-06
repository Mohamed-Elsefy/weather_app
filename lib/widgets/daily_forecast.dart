import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_radius.dart';
import 'package:weather_app/core/constants/app_size.dart';
import 'package:weather_app/core/constants/app_spacing.dart';
import 'package:weather_app/core/utils/format_date.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/models/api_models/weather_response.dart';

class DailyForecast extends StatelessWidget {
  final WeatherResponse weather;

  const DailyForecast({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final days = weather.daily;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).nextDays, style: theme.textTheme.titleLarge),
        AppSpacing.v_12,

        Column(
          children: days.map((day) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: AppSpacing.p_6),
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.p_12,
                horizontal: AppSpacing.p_20,
              ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatDate(day.date, locale),
                    style: theme.textTheme.bodyMedium,
                  ),
                  Image.network(
                    'https:${day.icon}',
                    width: AppSize.s_36,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.cloud_off,
                        size: AppSize.s_36,
                        color: Theme.of(context).colorScheme.primary,
                      );
                    },
                  ),
                  Text(
                    '${day.maxTemp.round()}° / ${day.minTemp.round()}°',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
