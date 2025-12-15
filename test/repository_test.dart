import 'package:flutter_test/flutter_test.dart';
import 'package:campus_lost_found/features/found_items/data/found_items_repository.dart';

void main() {
  group('FoundItemsRepository', () {
    late FoundItemsRepository repository;

    setUp(() {
      repository = FoundItemsRepository();
    });

    test('can add and retrieve items', () {
      final item = repository.addItem(
        title: 'Test Item',
        category: 'Electronics',
        description: 'Test description',
        foundLocation: 'Library',
        foundAt: DateTime.now(),
        createdByOfficerId: 'officer-1',
      );

      expect(item.title, 'Test Item');
      expect(item.category, 'Electronics');
      
      final retrieved = repository.getItemById(item.id);
      expect(retrieved, isNotNull);
      expect(retrieved!.id, item.id);
    });

    test('can search items by query', () {
      repository.addItem(
        title: 'iPhone',
        category: 'Electronics',
        description: 'Lost phone',
        foundLocation: 'Library',
        foundAt: DateTime.now(),
        createdByOfficerId: 'officer-1',
      );

      final results = repository.searchItems('iPhone');
      expect(results.length, greaterThan(0));
      expect(results.first.title, contains('iPhone'));
    });

    test('can filter by category', () {
      repository.addItem(
        title: 'Book',
        category: 'Books',
        description: 'Test book',
        foundLocation: 'Library',
        foundAt: DateTime.now(),
        createdByOfficerId: 'officer-1',
      );

      final results = repository.filterByCategory('Books');
      expect(results.every((item) => item.category == 'Books'), isTrue);
    });
  });
}

