# 🌤 Weather App (Flutter)

A modern and clean weather application built with **Flutter**, providing current weather conditions, hourly forecast, and daily forecast with a smooth and professional UI.

---

## ✨ Features

- 🌍 **Search weather by city** with animated search field (no separate screen)
- 📍 **Current weather details**
  - Temperature
  - Condition
  - Humidity
  - Wind speed
  - Feels like
- ⏰ **Hourly forecast**
- 📅 **Daily forecast**
- 🌐 **Multi-language support** (English / Arabic)
- 🎨 **Theme support**
  - Light
  - Dark
  - System
- 🔄 **Pull to refresh**
- 💾 **Local caching** to reduce unnecessary API calls
- ⚠️ **Graceful error handling**

---

## 🧱 Architecture

The project follows a clean and scalable architecture:

lib/
├── core/
│ ├── constants/
│ ├── utils/
│ └── theme/
├── models/
│ ├── api_models/
│ └── cache_models/
├── providers/
│ ├── weather_provider.dart
│ ├── theme_provider.dart
│ └── locale_provider.dart
├── screens/
│ ├── home_screen.dart
│ └── settings_screen.dart
├── widgets/
│ ├── weather_card.dart
│ ├── hourly_forecast.dart
│ ├── daily_forecast.dart
│ ├── animated_search_field.dart
│ └── exception_widget.dart
└── main.dart


---

## 🛠 Tech Stack

- **Flutter**
- **Riverpod** (state management)
- **Hive** (local cache)
- **Intl** (date & localization)
- **REST API** (weather data)

---

## 🔄 State Management

- `Riverpod` is used for:
  - Weather data
  - App theme
  - App language
- Async states handled using `AsyncValue` (`loading`, `error`, `data`)

---

## 🌍 Localization

- Supports **English** and **Arabic**
- Implemented using `intl` and generated localization files
- Language can be changed from **Settings Screen**

---

## 🎨 UI & UX

- Clean Material 3 design
- Large centered weather card
- Horizontal hourly forecast
- Vertical daily forecast
- Animated search field in AppBar
- Responsive spacing and typography
