import 'package:flutter/material.dart';
import 'package:campus_lost_found/features/claims/domain/claim_request.dart';

class ClaimDecisionDialog extends StatelessWidget {
  final ClaimRequest claim;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const ClaimDecisionDialog({
    super.key,
    required this.claim,
    required this.onApprove,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Review Claim Request'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Requester: ${claim.requesterName}'),
          if (claim.requesterStudentNo != null)
            Text('Student #: ${claim.requesterStudentNo}'),
          const SizedBox(height: 16),
          const Text('Verification Notes:'),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(claim.notes),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onReject();
          },
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          child: const Text('Reject'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            onApprove();
          },
          child: const Text('Approve'),
        ),
      ],
    );
  }
}

