import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:solid_software_color_app/src/color_playground/domain/colors_repository.dart';

part 'colors_state.dart';

/// Cubit for managing color state.
class ColorsCubit extends Cubit<ColorsState> {
  /// The [ColorsRepository] used to provide colors.
  final ColorsRepository repository;

  /// Constructor for [ColorsCubit] that requires a [ColorsRepository].
  ColorsCubit({required this.repository})
    : super(const ColorsState(color: Colors.white, alpha: 255));

  /// Randomizes the current color by generating a new random color from the
  /// [ColorsRepository] and emitting a new state with the updated color.
  void randomizeColor() {
    final Color color = repository.generateRandomColor(alpha: state.alpha);
    emit(state.copyWith(color: color));
  }

  /// Updates the alpha channel of the current color by the given [delta].
  void _updateAlpha({required int delta}) {
    final newAlpha = (state.alpha + delta).clamp(0, 255);
    emit(
      state.copyWith(color: state.color.withAlpha(newAlpha), alpha: newAlpha),
    );
  }

  /// Adjusts the hue of the current color by the given [delta].
  void _adjustHue({required double delta}) {
    const int maxHue = 360;
    final HSLColor hsl = HSLColor.fromColor(state.color);
    double newHue = (hsl.hue + delta) % maxHue;
    if (newHue < 0) newHue += maxHue;
    emit(state.copyWith(color: hsl.withHue(newHue).toColor()));
  }

  /// Handles pan update gestures to adjust alpha and hue.
  void handlePanUpdate({required double dx, required double dy}) {
    const double sensitivity = 0.5;
    _updateAlpha(delta: (dy * sensitivity).round());
    _adjustHue(delta: dx * sensitivity);
  }
}
