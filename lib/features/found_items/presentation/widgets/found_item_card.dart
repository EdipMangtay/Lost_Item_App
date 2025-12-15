import 'package:flutter/material.dart';
import 'package:campus_lost_found/core/widgets/status_badge.dart';
import 'package:campus_lost_found/core/utils/date_time_x.dart';
import 'package:campus_lost_found/core/constants/categories.dart';
import 'package:campus_lost_found/features/found_items/domain/found_item.dart';

class FoundItemCard extends StatelessWidget {
  final FoundItem item;
  final VoidCallback? onTap;

  const FoundItemCard({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover image (or category icon fallback)
            Container(
              height: 180,
              width: double.infinity,
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: (item.mainPhotoUrl != null &&
                      item.mainPhotoUrl!.isNotEmpty)
                  ? Image.network(
                      item.mainPhotoUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Center(
                        child: Text(
                          ItemCategories.icons[item.category] ?? '📦',
                          style: const TextStyle(fontSize: 64),
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        ItemCategories.icons[item.category] ?? '📦',
                        style: const TextStyle(fontSize: 64),
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      StatusBadge(status: item.status),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.category_outlined,
                        size: 16,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item.category,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          item.foundLocation,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.foundAt.toRelativeTime(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

