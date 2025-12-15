import 'package:campus_lost_found/features/claims/domain/claim_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClaimsRepository {
  final FirebaseFirestore _firestore;

  ClaimsRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _claims =>
      _firestore.collection('claims');

  /// All claims stream (for officers/admins).
  Stream<List<ClaimRequest>> watchAllClaims() {
    return _claims
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return _fromFirestore(doc.id, data);
      }).toList();
    });
  }

  /// Claims for a specific requester (student) ordered by createdAt.
  Stream<List<ClaimRequest>> watchClaimsForUser(String uid) {
    return _claims
        .where('requesterUid', isEqualTo: uid)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return _fromFirestore(doc.id, data);
      }).toList();
    });
  }

  /// Create a new pending claim for an item.
  ///
  /// For now this does not enforce single-active-claim in a transaction;
  /// it simply creates the claim document with pending status.
  Future<void> addClaim({
    required String itemId,
    required String requesterUid,
    required String requesterName,
    String? requesterStudentNo,
    required String notes,
  }) async {
    final docRef = _claims.doc();
    await docRef.set({
      'itemId': itemId,
      'requesterUid': requesterUid,
      'requesterName': requesterName,
      'requesterStudentNo': requesterStudentNo,
      'notes': notes,
      'status': 'PENDING',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  /// Update claim status (pending / approved / rejected).
  Future<void> updateClaimStatus(
    String id,
    ClaimStatus status,
    String decidedByOfficerId,
  ) async {
    String statusString;
    switch (status) {
      case ClaimStatus.approved:
        statusString = 'APPROVED';
        break;
      case ClaimStatus.rejected:
        statusString = 'REJECTED';
        break;
      case ClaimStatus.pending:
      default:
        statusString = 'PENDING';
        break;
    }

    await _claims.doc(id).update({
      'status': statusString,
      'decidedAt': FieldValue.serverTimestamp(),
      'decidedByOfficerId': decidedByOfficerId,
    });
  }

  ClaimRequest _fromFirestore(String id, Map<String, dynamic> data) {
    final statusString =
        (data['status'] as String? ?? 'PENDING').toUpperCase();
    final ClaimStatus status;
    switch (statusString) {
      case 'APPROVED':
        status = ClaimStatus.approved;
        break;
      case 'REJECTED':
        status = ClaimStatus.rejected;
        break;
      default:
        status = ClaimStatus.pending;
    }

    final createdAt =
        (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now();
    final decidedAt =
        (data['decidedAt'] as Timestamp?)?.toDate();

    return ClaimRequest(
      id: id,
      itemId: data['itemId'] as String? ?? '',
      requesterUid: data['requesterUid'] as String? ?? '',
      requesterName: data['requesterName'] as String? ?? '',
      requesterStudentNo: data['requesterStudentNo'] as String?,
      notes: data['notes'] as String? ?? '',
      status: status,
      createdAt: createdAt,
      decidedAt: decidedAt,
      decidedByOfficerId: data['decidedByOfficerId'] as String?,
    );
  }
}

