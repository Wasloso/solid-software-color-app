import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_color_app/src/colorful_background/cubit/colors_cubit.dart';
import 'package:solid_software_color_app/src/colorful_background/widgets/colorful_container.dart';

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
    return Scaffold(
      body: GestureDetector(
        onTap: () => context.read<ColorsCubit>().randomizeColor(),
        onPanUpdate: (details) {
          context.read<ColorsCubit>().updateAlpha(
            delta: (details.delta.dy * 0.5).round(),
          );
          context.read<ColorsCubit>().adjustHue(delta: details.delta.dx * 0.5);
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            BlocBuilder<ColorsCubit, ColorsState>(
              builder: (context, state) =>
                  ColorfulContainer(color: state.color),
            ),
            const Center(child: Text("Hello world")),
          ],
        ),
      ),
    );
  }
}
