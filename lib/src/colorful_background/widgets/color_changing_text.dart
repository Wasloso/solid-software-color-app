import 'package:flutter/material.dart';
import 'package:solid_software_color_app/src/common/extensions/color_contrast.dart';

/// A text widget that changes its color with an animation.
class ColorChangingText extends StatelessWidget {
  /// [Color] of the text
  final Color color;

  /// The text to display
  final String text;

  /// Font size of the text
  final double fontSize;

  /// [Duration] of the color change animation
  final Duration colorChangeDuration;

  /// Constructor for [ColorChangingText] that requires a [Color].
  ///
  /// The [fontSize] defaults to 48 and [colorChangeDuration] defaults to 250
  /// milliseconds if not provided.
  const ColorChangingText({
    required this.color,
    required this.text,
    this.fontSize = 48,
    this.colorChangeDuration = const Duration(milliseconds: 250),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: ColorTween(begin: color, end: color),
      duration: colorChangeDuration,
      builder: (_, value, _) {
        final Color color = value ?? this.color;

        return Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            shadows: [
              Shadow(
                offset: const Offset(1, 1),
                blurRadius: 3,
                color: color.inverted,
              ),
            ],
          ),
        );
      },
    );
  }
}
