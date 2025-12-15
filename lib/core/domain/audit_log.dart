import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_log.freezed.dart';
part 'audit_log.g.dart';

enum ActionType {
  itemCreated,
  itemUpdated,
  claimSubmitted,
  claimApproved,
  claimRejected,
  itemDelivered,
}

enum EntityType {
  foundItem,
  claimRequest,
}

@freezed
class AuditLog with _$AuditLog {
  const factory AuditLog({
    required String id,
    required String actorId,
    required ActionType actionType,
    required EntityType entityType,
    required String entityId,
    required DateTime timestamp,
    Map<String, dynamic>? details,
  }) = _AuditLog;

  factory AuditLog.fromJson(Map<String, dynamic> json) => _$AuditLogFromJson(json);
}

