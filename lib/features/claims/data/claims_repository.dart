import 'package:campus_lost_found/features/claims/domain/claim_request.dart';
import 'package:campus_lost_found/core/utils/id_generator.dart';
import 'package:campus_lost_found/features/claims/data/mock_claims.dart';

class ClaimsRepository {
  List<ClaimRequest> _claims = [];
  bool _initialized = false;

  void _initialize() {
    if (!_initialized) {
      _claims = List.from(MockClaims.getInitialClaims());
      _initialized = true;
    }
  }

  List<ClaimRequest> getAllClaims() {
    _initialize();
    return List.unmodifiable(_claims);
  }

  List<ClaimRequest> getClaimsByItemId(String itemId) {
    _initialize();
    return _claims.where((claim) => claim.itemId == itemId).toList();
  }

  List<ClaimRequest> getClaimsByStatus(ClaimStatus status) {
    _initialize();
    return _claims.where((claim) => claim.status == status).toList();
  }

  ClaimRequest? getClaimById(String id) {
    _initialize();
    try {
      return _claims.firstWhere((claim) => claim.id == id);
    } catch (e) {
      return null;
    }
  }

  ClaimRequest addClaim({
    required String itemId,
    required String requesterName,
    String? requesterStudentNo,
    required String notes,
  }) {
    _initialize();
    final id = IdGenerator.generateClaimId();
    final claim = ClaimRequest(
      id: id,
      itemId: itemId,
      requesterName: requesterName,
      requesterStudentNo: requesterStudentNo,
      notes: notes,
      status: ClaimStatus.pending,
      createdAt: DateTime.now(),
    );

    _claims.insert(0, claim);
    return claim;
  }

  ClaimRequest updateClaimStatus(
    String id,
    ClaimStatus status,
    String decidedByOfficerId,
  ) {
    _initialize();
    final index = _claims.indexWhere((claim) => claim.id == id);
    if (index == -1) {
      throw Exception('Claim not found');
    }

    final claim = _claims[index];
    _claims[index] = claim.copyWith(
      status: status,
      decidedAt: DateTime.now(),
      decidedByOfficerId: decidedByOfficerId,
    );
    return _claims[index];
  }

  void reset() {
    _claims = List.from(MockClaims.getInitialClaims());
  }
}

