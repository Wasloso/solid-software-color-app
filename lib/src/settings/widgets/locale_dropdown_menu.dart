import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_color_app/l10n/app_localizations.dart';
import 'package:solid_software_color_app/src/settings/cubit/settings_cubit.dart';

/// A dropdown menu for selecting the app's locale.
class LocaleDropdownMenu extends StatelessWidget {
  /// Whether to include a trailing icon in the dropdown menu.
  final bool includeLeadingIcon;

  /// Whether to include a trailing icon in the dropdown menu.
  final bool includeTrailingIcon;

  /// Color of the dropdown menu icon and text.
  final Color color;

  /// [Duration] of the color change animation.
  final Duration colorChangeDuration;

  /// Constructor for [LocaleDropdownMenu].
  ///
  /// The [includeLeadingIcon] parameter defaults to true.
  const LocaleDropdownMenu({
    required this.color,
    this.includeLeadingIcon = true,
    this.includeTrailingIcon = true,
    this.colorChangeDuration = const Duration(milliseconds: 250),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsCubit, SettingsState, Locale>(
      selector: (state) => state.locale,
      builder: (_, locale) {
        return TweenAnimationBuilder<Color?>(
          tween: ColorTween(begin: Colors.transparent, end: color),
          duration: colorChangeDuration,
          builder: (context, animatedColor, _) {
            return DropdownMenu<Locale>(
              initialSelection: locale,
              leadingIcon: includeLeadingIcon
                  ? Icon(Icons.language, color: animatedColor)
                  : null,
              enableSearch: false,
              requestFocusOnTap: false,
              textStyle: TextStyle(color: animatedColor),
              trailingIcon: includeTrailingIcon
                  ? Icon(Icons.arrow_drop_down, color: animatedColor)
                  : null,
              selectedTrailingIcon: includeTrailingIcon
                  ? Icon(Icons.arrow_drop_up, color: animatedColor)
                  : null,
              inputDecorationTheme: InputDecorationTheme(
                isCollapsed: true,
                isDense: true,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide.none,
                ),
              ),
              onSelected: (locale) {
                if (locale == null) return;
                context.read<SettingsCubit>().setLocale(locale: locale);
              },
              dropdownMenuEntries: AppLocalizations.supportedLocales.map((
                locale,
              ) {
                return DropdownMenuEntry(
                  value: locale,
                  label: locale.languageCode.toUpperCase(),
                );
              }).toList(),
            );
          },
        );
      },
    );
  }
}
