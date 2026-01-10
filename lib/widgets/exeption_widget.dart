import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_size.dart';
import 'package:weather_app/core/constants/app_spacing.dart';

class ExeptionWidget extends StatelessWidget {
  const ExeptionWidget({
    super.key,
    required this.exeption,
    required this.onPressed,
  });

  final String exeption;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.refresh),
            iconSize: AppSize.s_36,
          ),
          AppSpacing.v_16,

          Text(exeption, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
