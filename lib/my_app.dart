import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_color_app/src/colorful_background/cubit/colors_cubit.dart';
import 'package:solid_software_color_app/src/colorful_background/domain/colors_generator.dart';
import 'package:solid_software_color_app/src/colorful_background/domain/colors_repository.dart';
import 'package:solid_software_color_app/src/colorful_background/domain/colors_repository_impl.dart';
import 'package:solid_software_color_app/src/colorful_background/pages/color_page.dart';
import 'package:solid_software_color_app/src/colorful_background/widgets/colorful_container.dart';

/// Entry point of the app
class MyApp extends StatelessWidget {
  /// Constructor for [MyApp].
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ColorsRepository>(
      create: (_) => ColorsRepositoryImpl(generator: ColorsGenerator()),
      child: MaterialApp(
        title: 'Colors App',
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return BlocProvider(
            create: (context) =>
                ColorsCubit(repository: context.read<ColorsRepository>()),
            child: child,
          );
        },
        home: const ColorPage(),
      ),
    );
  }
}
