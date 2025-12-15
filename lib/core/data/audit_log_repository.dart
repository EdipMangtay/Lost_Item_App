import 'package:campus_lost_found/core/domain/audit_log.dart';

class AuditLogRepository {
  List<AuditLog> _logs = [];

  List<AuditLog> getAllLogs() {
    return List.unmodifiable(_logs);
  }

  List<AuditLog> getLogsByEntity(String entityId) {
    return _logs.where((log) => log.entityId == entityId).toList();
  }

  void addLog({
    required String actorId,
    required ActionType actionType,
    required EntityType entityType,
    required String entityId,
    Map<String, dynamic>? details,
  }) {
    final log = AuditLog(
      id: 'log-${DateTime.now().millisecondsSinceEpoch}',
      actorId: actorId,
      actionType: actionType,
      entityType: entityType,
      entityId: entityId,
      timestamp: DateTime.now(),
      details: details,
    );

    _logs.insert(0, log);
  }

  void reset() {
    _logs = [];
  }
}

