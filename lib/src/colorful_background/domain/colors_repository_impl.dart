import 'dart:ui';

import 'package:solid_software_color_app/src/colorful_background/domain/colors_generator.dart';
import 'package:solid_software_color_app/src/colorful_background/domain/colors_repository.dart';

/// Implementation of [ColorsRepository] that uses [ColorsGenerator] to
/// generate random colors.
class ColorsRepositoryImpl implements ColorsRepository {
  /// The [ColorsGenerator] instance used to generate colors.
  final ColorsGenerator generator;

  /// Constructor for [ColorsRepositoryImpl] that requires a [ColorsGenerator]
  ColorsRepositoryImpl({required this.generator});

  @override
  Color generateRandomColor({int alpha = 255}) {
    return generator.generateRandomColor(alpha: alpha);
  }
}
