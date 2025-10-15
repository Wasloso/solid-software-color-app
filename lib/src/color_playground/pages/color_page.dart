import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_color_app/src/color_playground/cubit/colors_cubit.dart';
import 'package:solid_software_color_app/src/color_playground/widgets/color_changing_text.dart';
import 'package:solid_software_color_app/src/color_playground/widgets/colorful_container.dart';
import 'package:solid_software_color_app/src/common/extensions/color_contrast.dart';
import 'package:solid_software_color_app/src/common/extensions/translate.dart';
import 'package:solid_software_color_app/src/settings/widgets/locale_dropdown_menu.dart';

/// Page that displays a colorful background and a centered "Hello world" text.
///
/// Tapping anywhere on the screen randomizes the background color.
class ColorPage extends StatelessWidget {
  /// The route for this page.
  static const route = "/color";

  /// Constructor for [ColorPage].
  ///
  /// Clicking anywhere on the screen randomizes the background color.
  ///
  /// Dragging vertically changes the alpha channel of the current color.
  const ColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorsCubit, ColorsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: ColorChangingText(
              color: state.color.inverted,
              text: context.translate.appTitle,
              fontSize: 20,
            ),
            actions: [LocaleDropdownMenu(color: state.color.inverted)],
            backgroundColor: Colors.transparent,
          ),
          extendBodyBehindAppBar: true,
          body: GestureDetector(
            onTap: () => context.read<ColorsCubit>().randomizeColor(),
            onPanUpdate: (details) => context
                .read<ColorsCubit>()
                .handlePanUpdate(dx: details.delta.dx, dy: details.delta.dy),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ColorfulContainer(color: state.color),
                Center(
                  child: ColorChangingText(
                    color: state.color.inverted,
                    text: context.translate.helloWorld,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
