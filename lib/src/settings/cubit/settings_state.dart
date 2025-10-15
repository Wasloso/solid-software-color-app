part of 'settings_cubit.dart';

/// State class for [SettingsCubit] containing the current settings.
class SettingsState extends Equatable {
  /// Currently selected [Locale] of the app.
  final Locale locale;

  @override
  List<Object> get props => [locale];

  /// Constructor for [SettingsState] requiring a [locale].
  const SettingsState({required this.locale});

  /// Creates a copy of the current state with optional new values.
  SettingsState copyWith({Locale? locale}) {
    return SettingsState(locale: locale ?? this.locale);
  }
}
