import 'package:flutter/material.dart';
import 'package:campus_lost_found/app/theme/color_tokens.dart';
import 'package:campus_lost_found/features/found_items/domain/found_item.dart';

class StatusBadge extends StatelessWidget {
  final ItemStatus status;

  const StatusBadge({
    super.key,
    required this.status,
  });

  String _getStatusText() {
    switch (status) {
      case ItemStatus.inStorage:
        return 'In Storage';
      case ItemStatus.pendingClaim:
        return 'Pending Claim';
      case ItemStatus.delivered:
        return 'Delivered';
    }
  }

  Color _getStatusColor() {
    switch (status) {
      case ItemStatus.inStorage:
        return const Color(0xFF2196F3);
      case ItemStatus.pendingClaim:
        return ColorTokens.warning;
      case ItemStatus.delivered:
        return ColorTokens.success;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _getStatusColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _getStatusColor().withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        _getStatusText(),
        style: TextStyle(
          color: _getStatusColor(),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

