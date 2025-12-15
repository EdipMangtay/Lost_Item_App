import 'package:flutter/material.dart';
import 'package:campus_lost_found/core/utils/date_time_x.dart';
import 'package:campus_lost_found/features/claims/domain/claim_request.dart';

class ClaimCard extends StatelessWidget {
  final ClaimRequest claim;
  final VoidCallback? onTap;

  const ClaimCard({
    super.key,
    required this.claim,
    this.onTap,
  });

  String _getStatusText() {
    switch (claim.status) {
      case ClaimStatus.pending:
        return 'Pending';
      case ClaimStatus.approved:
        return 'Approved';
      case ClaimStatus.rejected:
        return 'Rejected';
    }
  }

  Color _getStatusColor(BuildContext context) {
    switch (claim.status) {
      case ClaimStatus.pending:
        return const Color(0xFFFF9800);
      case ClaimStatus.approved:
        return Theme.of(context).colorScheme.tertiaryContainer;
      case ClaimStatus.rejected:
        return Theme.of(context).colorScheme.errorContainer;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      claim.requesterName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getStatusColor(context),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _getStatusText(),
                      style: TextStyle(
                        color: claim.status == ClaimStatus.pending
                            ? Theme.of(context).colorScheme.onSurface
                            : Theme.of(context).colorScheme.onTertiaryContainer,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              if (claim.requesterStudentNo != null) ...[
                const SizedBox(height: 4),
                Text(
                  'Student #: ${claim.requesterStudentNo}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
              const SizedBox(height: 8),
              Text(
                claim.notes,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                'Submitted ${claim.createdAt.toRelativeTime()}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

