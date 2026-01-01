import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_colors.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primaryLight,
  onPrimary: AppColors.onPrimaryLight,
  secondary: AppColors.secondaryLight,
  onSecondary: AppColors.onSecondaryLight,
  error: AppColors.errorLight,
  onError: AppColors.onErrorLight,
  surface: AppColors.surfaceLight,
  onSurface: AppColors.onSurfaceLight,
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.primaryDark,
  onPrimary: AppColors.onPrimaryDark,
  secondary: AppColors.secondaryDark,
  onSecondary: AppColors.onSecondaryDark,
  error: AppColors.errorDark,
  onError: AppColors.onErrorDark,
  surface: AppColors.surfaceDark,
  onSurface: AppColors.onSurfaceDark,
);
