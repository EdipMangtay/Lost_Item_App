// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuditLogImpl _$$AuditLogImplFromJson(Map<String, dynamic> json) =>
    _$AuditLogImpl(
      id: json['id'] as String,
      actorId: json['actorId'] as String,
      actionType: $enumDecode(_$ActionTypeEnumMap, json['actionType']),
      entityType: $enumDecode(_$EntityTypeEnumMap, json['entityType']),
      entityId: json['entityId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      details: json['details'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AuditLogImplToJson(_$AuditLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'actorId': instance.actorId,
      'actionType': _$ActionTypeEnumMap[instance.actionType]!,
      'entityType': _$EntityTypeEnumMap[instance.entityType]!,
      'entityId': instance.entityId,
      'timestamp': instance.timestamp.toIso8601String(),
      'details': instance.details,
    };

const _$ActionTypeEnumMap = {
  ActionType.itemCreated: 'itemCreated',
  ActionType.itemUpdated: 'itemUpdated',
  ActionType.claimSubmitted: 'claimSubmitted',
  ActionType.claimApproved: 'claimApproved',
  ActionType.claimRejected: 'claimRejected',
  ActionType.itemDelivered: 'itemDelivered',
};

const _$EntityTypeEnumMap = {
  EntityType.foundItem: 'foundItem',
  EntityType.claimRequest: 'claimRequest',
};
