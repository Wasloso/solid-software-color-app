import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_color_app/l10n/app_localizations.dart';
import 'package:solid_software_color_app/src/colorful_background/cubit/colors_cubit.dart';
import 'package:solid_software_color_app/src/colorful_background/domain/colors_generator.dart';
import 'package:solid_software_color_app/src/colorful_background/domain/colors_repository.dart';
import 'package:solid_software_color_app/src/colorful_background/domain/colors_repository_impl.dart';
import 'package:solid_software_color_app/src/colorful_background/pages/color_page.dart';
import 'package:solid_software_color_app/src/settings/cubit/settings_cubit.dart';

/// Entry point of the app
class MyApp extends StatelessWidget {
  /// Constructor for [MyApp].
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ColorsRepository>(
      create: (_) => ColorsRepositoryImpl(generator: ColorsGenerator()),
      child: BlocProvider(
        create: (_) =>
            SettingsCubit(supportedLocales: AppLocalizations.supportedLocales),
        lazy: false,
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (_, settingsState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: settingsState.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              home: const ColorPage(),
              builder: (_, child) {
                if (child == null) return const SizedBox.shrink();

                return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => ColorsCubit(
                        repository: context.read<ColorsRepository>(),
                      ),
                    ),
                  ],
                  child: child,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
