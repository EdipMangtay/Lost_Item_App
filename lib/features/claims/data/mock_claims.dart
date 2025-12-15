import 'package:campus_lost_found/features/claims/domain/claim_request.dart';

class MockClaims {
  static List<ClaimRequest> getInitialClaims() {
    final now = DateTime.now();
    return [
      ClaimRequest(
        id: 'CLM-1',
        itemId: 'LF-2025-000002',
        requesterName: 'John Doe',
        requesterStudentNo: 'STU-2023-001',
        notes: 'The backpack has my name tag inside. It\'s a blue Nike backpack with a laptop compartment.',
        status: ClaimStatus.pending,
        createdAt: now.subtract(const Duration(days: 1)),
      ),
    ];
  }
}

