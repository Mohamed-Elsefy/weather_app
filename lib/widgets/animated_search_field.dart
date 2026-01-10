import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/app_size.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/providers/weather_provider.dart';

class AnimatedSearchField extends ConsumerStatefulWidget {
  const AnimatedSearchField({super.key});

  @override
  ConsumerState<AnimatedSearchField> createState() =>
      _AnimatedSearchFieldState();
}

class _AnimatedSearchFieldState extends ConsumerState<AnimatedSearchField> {
  bool _isSearching = false;

  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  void _startSearch() {
    setState(() => _isSearching = true);
    Future.microtask(() => _focusNode.requestFocus());
  }

  Future<void> _submitSearch() async {
    final city = _controller.text.trim();
    if (city.isEmpty) return;

    final lang = Localizations.localeOf(context).languageCode;

    await ref.read(weatherProvider.notifier).fetchByCity(city, lang);

    _stopSearch();
  }

  void _stopSearch() {
    _controller.clear();
    _focusNode.unfocus();
    setState(() => _isSearching = false);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 140),
      transitionBuilder: (child, anim) =>
          FadeTransition(opacity: anim, child: child),
      child: _isSearching
          ? SizedBox(
              key: const ValueKey('searchField'),
              width: AppSize.s_180,
              child: _buildSearchField(),
            )
          : IconButton(
              key: const ValueKey('searchIcon'),
              onPressed: _startSearch,
              icon: const Icon(Icons.search, size: AppSize.s_28),
            ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      textInputAction: TextInputAction.search,
      onSubmitted: (_) => _submitSearch(),
      decoration: InputDecoration(
        isDense: true,
        hintText: S.of(context).searchCity,
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: _stopSearch,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
