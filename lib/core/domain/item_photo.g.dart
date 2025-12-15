// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemPhotoImpl _$$ItemPhotoImplFromJson(Map<String, dynamic> json) =>
    _$ItemPhotoImpl(
      id: json['id'] as String,
      itemId: json['itemId'] as String,
      type: $enumDecode(_$PhotoTypeEnumMap, json['type']),
      assetPath: json['assetPath'] as String,
      uploadedAt: DateTime.parse(json['uploadedAt'] as String),
    );

Map<String, dynamic> _$$ItemPhotoImplToJson(_$ItemPhotoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'type': _$PhotoTypeEnumMap[instance.type]!,
      'assetPath': instance.assetPath,
      'uploadedAt': instance.uploadedAt.toIso8601String(),
    };

const _$PhotoTypeEnumMap = {
  PhotoType.found: 'found',
  PhotoType.handover: 'handover',
};
