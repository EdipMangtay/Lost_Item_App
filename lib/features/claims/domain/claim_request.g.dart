// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClaimRequestImpl _$$ClaimRequestImplFromJson(Map<String, dynamic> json) =>
    _$ClaimRequestImpl(
      id: json['id'] as String,
      itemId: json['itemId'] as String,
      requesterUid: json['requesterUid'] as String,
      requesterName: json['requesterName'] as String,
      requesterStudentNo: json['requesterStudentNo'] as String?,
      notes: json['notes'] as String,
      status: $enumDecode(_$ClaimStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      decidedAt: json['decidedAt'] == null
          ? null
          : DateTime.parse(json['decidedAt'] as String),
      decidedByOfficerId: json['decidedByOfficerId'] as String?,
    );

Map<String, dynamic> _$$ClaimRequestImplToJson(_$ClaimRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'requesterUid': instance.requesterUid,
      'requesterName': instance.requesterName,
      'requesterStudentNo': instance.requesterStudentNo,
      'notes': instance.notes,
      'status': _$ClaimStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'decidedAt': instance.decidedAt?.toIso8601String(),
      'decidedByOfficerId': instance.decidedByOfficerId,
    };

const _$ClaimStatusEnumMap = {
  ClaimStatus.pending: 'pending',
  ClaimStatus.approved: 'approved',
  ClaimStatus.rejected: 'rejected',
};
