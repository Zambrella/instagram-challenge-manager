// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prize_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrizeDtoImpl _$$PrizeDtoImplFromJson(Map<String, dynamic> json) =>
    _$PrizeDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      sponsor: json['sponsor'] as String?,
    );

Map<String, dynamic> _$$PrizeDtoImplToJson(_$PrizeDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'sponsor': instance.sponsor,
    };
