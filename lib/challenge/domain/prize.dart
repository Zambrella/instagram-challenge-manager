import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'prize.g.dart';

@CopyWith()
class Prize extends Equatable {
  const Prize({
    required this.id,
    required this.name,
    required this.quantity,
    this.sponsor,
  });

  /// The id of the prize.
  final String id;

  /// The name of the prize.
  final String name;

  /// The quantity of the prize.
  final int quantity;

  /// The (optional) sponsor of the prize.
  final String? sponsor;

  @override
  List<Object?> get props => [
        id,
        name,
        quantity,
        sponsor,
      ];
}
