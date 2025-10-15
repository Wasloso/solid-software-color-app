import 'dart:ui' show Color;

/// Abstract repository for generating random colors.
abstract class ColorsRepository {
  /// Constructor for [ColorsRepository].
  const ColorsRepository();

  /// Generates and returns a random [Color]
  ///
  /// If [alpha] is not null, the alpha channel will be set to that value.
  Color generateRandomColor({int alpha = 255});
}
