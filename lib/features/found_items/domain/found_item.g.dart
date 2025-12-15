// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'found_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoundItemImpl _$$FoundItemImplFromJson(Map<String, dynamic> json) =>
    _$FoundItemImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      foundLocation: json['foundLocation'] as String,
      foundAt: DateTime.parse(json['foundAt'] as String),
      status: $enumDecode(_$ItemStatusEnumMap, json['status']),
      photos: (json['photos'] as List<dynamic>)
          .map((e) => ItemPhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      qrValue: json['qrValue'] as String,
      createdByOfficerId: json['createdByOfficerId'] as String,
      deliveredAt: json['deliveredAt'] == null
          ? null
          : DateTime.parse(json['deliveredAt'] as String),
      mainPhotoUrl: json['mainPhotoUrl'] as String?,
    );

Map<String, dynamic> _$$FoundItemImplToJson(_$FoundItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'description': instance.description,
      'foundLocation': instance.foundLocation,
      'foundAt': instance.foundAt.toIso8601String(),
      'status': _$ItemStatusEnumMap[instance.status]!,
      'photos': instance.photos,
      'qrValue': instance.qrValue,
      'createdByOfficerId': instance.createdByOfficerId,
      'deliveredAt': instance.deliveredAt?.toIso8601String(),
      'mainPhotoUrl': instance.mainPhotoUrl,
    };

const _$ItemStatusEnumMap = {
  ItemStatus.inStorage: 'inStorage',
  ItemStatus.pendingClaim: 'pendingClaim',
  ItemStatus.delivered: 'delivered',
};
