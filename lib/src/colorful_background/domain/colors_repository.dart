import 'dart:ui' show Color;

import 'package:solid_software_color_app/src/colorful_background/domain/colors_generator.dart';

/// Abstract repository for generating random colors.
abstract class ColorsRepository {
  /// Constructor for [ColorsRepository].
  const ColorsRepository();

  /// Generates and returns a random [Color]
  ///
  /// If [alpha] is not null, the alpha channel will be set to that value.
  Color generateRandomColor({int alpha = 255});
}
