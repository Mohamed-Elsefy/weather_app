import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/providers/location_provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(locationProvider, (previous, next) {
      next.whenOrNull(
        data: (position) {
          ref
              .read(weatherProvider.notifier)
              .fetchByCoordinates(
                lat: position.latitude,
                lon: position.longitude,
                lang: Localizations.localeOf(context).languageCode,
              );
        },
      );
    });

    final weatherAsync = ref.watch(weatherProvider);
    final locationAsync = ref.watch(locationProvider);

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).weather)),
      body: locationAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (_) {
          return weatherAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text(e.toString())),
            data: (weather) => RefreshIndicator(
              onRefresh: () async {
                ref
                    .read(weatherProvider.notifier)
                    .fetchByCity(
                      weather.location.name,
                      Localizations.localeOf(context).languageCode,
                    );
              },
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _CurrentWeatherCard(weather: weather),
                  const SizedBox(height: 24),
                  _HourlyForecast(weather: weather),
                  const SizedBox(height: 24),
                  _DailyForecast(weather: weather),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CurrentWeatherCard extends StatelessWidget {
  final weather;

  const _CurrentWeatherCard({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              weather.location.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Image.network('https:${weather.current.conditionIcon}', width: 80),
            const SizedBox(height: 8),
            Text(
              '${weather.current.tempC.toStringAsFixed(1)}°C',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(weather.current.conditionText),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _Stat(label: 'Humidity', value: '${weather.current.humidity}%'),
                _Stat(label: 'Wind', value: '${weather.current.windKph} km/h'),
                _Stat(label: 'Feels', value: '${weather.current.feelsLikeC}°C'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _Stat({required String label, required String value}) {
    return Column(children: [Text(value), Text(label)]);
  }
}

class _HourlyForecast extends StatelessWidget {
  final weather;

  const _HourlyForecast({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hourly', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: weather.hourly.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final hour = weather.hourly[index];
              return Column(
                children: [
                  Text(hour.time.split(' ').last),
                  Image.network('https:${hour.icon}', width: 40),
                  Text('${hour.tempC.round()}°C'),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _DailyForecast extends StatelessWidget {
  final weather;

  const _DailyForecast({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Next days', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        ...weather.daily.map(
          (day) => ListTile(
            leading: Image.network('https:${day.icon}', width: 40),
            title: Text(day.date),
            trailing: Text('${day.maxTemp.round()} / ${day.minTemp.round()}°C'),
          ),
        ),
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String error;

  const _ErrorView({required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48),
          const SizedBox(height: 12),
          Text(error),
        ],
      ),
    );
  }
}
