// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'settings_state.dart';

/// Cubit for managing app settings such as locale.
class SettingsCubit extends Cubit<SettingsState> {
  /// List of locales supported by the app.
  final List<Locale> supportedLocales;

  /// Constructor for [SettingsCubit] that requires a list of
  /// [supportedLocales].
  SettingsCubit({required this.supportedLocales})
    : super(
        SettingsState(
          locale: Locale(PlatformDispatcher.instance.locale.languageCode),
        ),
      );

  /// Updates the app's locale if it is in the list of supported locales.
  void setLocale({required Locale locale}) {
    if (!supportedLocales.contains(locale)) return;
    emit(state.copyWith(locale: locale));
  }
}
