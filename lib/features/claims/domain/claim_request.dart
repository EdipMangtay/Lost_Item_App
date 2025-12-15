import 'package:freezed_annotation/freezed_annotation.dart';

part 'claim_request.freezed.dart';
part 'claim_request.g.dart';

enum ClaimStatus {
  pending,
  approved,
  rejected,
}

@freezed
class ClaimRequest with _$ClaimRequest {
  const factory ClaimRequest({
    required String id,
    required String itemId,
    required String requesterName,
    String? requesterStudentNo,
    required String notes,
    required ClaimStatus status,
    required DateTime createdAt,
    DateTime? decidedAt,
    String? decidedByOfficerId,
  }) = _ClaimRequest;

  factory ClaimRequest.fromJson(Map<String, dynamic> json) => _$ClaimRequestFromJson(json);
}

