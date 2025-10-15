import 'package:flutter/material.dart';
import 'package:solid_software_color_app/l10n/app_localizations.dart';

/// Extension on [BuildContext] to provide easy access to localization methods.
extension Translate on BuildContext {
  /// Provides access to localized strings.
  AppLocalizations get translate {
    final loc = AppLocalizations.of(this);
    if (loc == null) {
      throw FlutterError(
        'AppLocalizations not found in context. '
        'Make sure your MaterialApp includes localizationsDelegates and '
        'supportedLocales.',
      );
    }

    return loc;
  }
}
