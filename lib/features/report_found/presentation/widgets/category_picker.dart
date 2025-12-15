import 'package:flutter/material.dart';
import 'package:campus_lost_found/core/constants/categories.dart';

class CategoryPicker extends StatelessWidget {
  final String? selectedCategory;
  final ValueChanged<String?> onCategorySelected;

  const CategoryPicker({
    super.key,
    this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ...ItemCategories.all.map((category) {
              final isSelected = selectedCategory == category;
              return ChoiceChip(
                label: Text('${ItemCategories.icons[category]} $category'),
                selected: isSelected,
                onSelected: (_) => onCategorySelected(isSelected ? null : category),
              );
            }),
          ],
        ),
      ],
    );
  }
}

