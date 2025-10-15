import 'package:flutter/material.dart';

/// A container that fills its parent and animates color changes.
class ColorfulContainer extends StatelessWidget {
  /// The background [Color] of the container.
  final Color color;

  /// The [Duration] of the color transition animation.
  final Duration animationDuration;

  /// Constructor for [ColorfulContainer] that requires a [Color].
  ///
  /// The [animationDuration] defaults to 250 milliseconds if not provided.
  const ColorfulContainer({
    required this.color,
    this.animationDuration = const Duration(milliseconds: 250),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      curve: Curves.easeInOut,
      color: color,
    );
  }
}
