part of 'colors_cubit.dart';

/// State class for [ColorsCubit] that holds the current color.
@immutable
final class ColorsState extends Equatable {
  /// The current [Color].
  final Color color;

  /// The alpha channel value of the current color.
  final int alpha;

  /// Constructor for [ColorsState] that requires a [Color].
  const ColorsState({required this.color, required this.alpha});

  /// Creates a copy of the current state with an optional new [Color] and
  /// [alpha].
  ColorsState copyWith({Color? color, int? alpha}) {
    return ColorsState(color: color ?? this.color, alpha: alpha ?? this.alpha);
  }

  @override
  List<Object> get props => [color, alpha];
}
