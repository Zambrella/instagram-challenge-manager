import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_challenge_manager/challenge/domain/prize.dart';

part 'prize_dto.freezed.dart';
part 'prize_dto.g.dart';

@freezed
class PrizeDto with _$PrizeDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory PrizeDto({
    required String id,
    required String name,
    required int quantity,
    String? sponsor,
  }) = _PrizeDto;

  const PrizeDto._();

  factory PrizeDto.fromJson(Map<String, dynamic> json) =>
      _$PrizeDtoFromJson(json);

  factory PrizeDto.fromDomain(Prize prize) {
    return PrizeDto(
      id: prize.id,
      name: prize.name,
      quantity: prize.quantity,
      sponsor: prize.sponsor,
    );
  }

  Prize toDomain() {
    return Prize(
      id: id,
      name: name,
      quantity: quantity,
      sponsor: sponsor,
    );
  }
}
