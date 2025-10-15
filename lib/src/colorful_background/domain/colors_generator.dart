import 'dart:math';
import 'dart:ui';

/// Utility class responsible for generating random [Color]
class ColorsGenerator {
  /// The random number generator used to produce color values.
  final Random random;

  /// Maximum value for RGB color components
  static const int _maxRgbValue = 256;

  /// Constructor for [ColorsGenerator]
  ///
  /// Optionally takes a [seed] as a parameter for initializing [Random]
  /// generator
  ColorsGenerator({int? seed}) : random = Random(seed);

  /// Generates and returns a random [Color]
  ///
  /// If [alpha] is not null, the alpha channel will be set to that value.
  Color generateRandomColor({int alpha = 255}) {
    final int r = random.nextInt(_maxRgbValue);
    final int g = random.nextInt(_maxRgbValue);
    final int b = random.nextInt(_maxRgbValue);
    final int a = alpha.clamp(0, 255);

    return Color.fromARGB(a, r, g, b);
  }
}
