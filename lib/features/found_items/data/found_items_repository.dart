import 'package:campus_lost_found/core/domain/item_photo.dart';
import 'package:campus_lost_found/features/found_items/domain/found_item.dart';
import 'package:campus_lost_found/core/utils/id_generator.dart';
import 'package:campus_lost_found/features/found_items/data/mock_found_items.dart';

class FoundItemsRepository {
  List<FoundItem> _items = [];
  bool _initialized = false;

  void _initialize() {
    if (!_initialized) {
      _items = List.from(MockFoundItems.getInitialItems());
      _initialized = true;
    }
  }

  List<FoundItem> getAllItems() {
    _initialize();
    return List.unmodifiable(_items);
  }

  FoundItem? getItemById(String id) {
    _initialize();
    try {
      return _items.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  List<FoundItem> searchItems(String query) {
    _initialize();
    if (query.isEmpty) return getAllItems();
    
    final lowerQuery = query.toLowerCase();
    return _items.where((item) {
      return item.title.toLowerCase().contains(lowerQuery) ||
          item.description.toLowerCase().contains(lowerQuery) ||
          item.category.toLowerCase().contains(lowerQuery) ||
          item.foundLocation.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  List<FoundItem> filterByCategory(String? category) {
    _initialize();
    if (category == null || category.isEmpty) return getAllItems();
    return _items.where((item) => item.category == category).toList();
  }

  List<FoundItem> filterByStatus(ItemStatus? status) {
    _initialize();
    if (status == null) return getAllItems();
    return _items.where((item) => item.status == status).toList();
  }

  FoundItem addItem({
    required String title,
    required String category,
    required String description,
    required String foundLocation,
    required DateTime foundAt,
    required String createdByOfficerId,
    List<String>? photoPaths,
  }) {
    _initialize();
    final id = IdGenerator.generateFoundItemId();
    final qrValue = IdGenerator.generateQrValue(id);
    
    final photos = (photoPaths ?? []).asMap().entries.map((entry) {
      return ItemPhoto(
        id: 'photo-$id-${entry.key}',
        itemId: id,
        type: PhotoType.found,
        assetPath: entry.value,
        uploadedAt: DateTime.now(),
      );
    }).toList();

    final item = FoundItem(
      id: id,
      title: title,
      category: category,
      description: description,
      foundLocation: foundLocation,
      foundAt: foundAt,
      status: ItemStatus.inStorage,
      photos: photos,
      qrValue: qrValue,
      createdByOfficerId: createdByOfficerId,
    );

    _items.insert(0, item);
    return item;
  }

  FoundItem updateItemStatus(String id, ItemStatus status, {DateTime? deliveredAt}) {
    _initialize();
    final index = _items.indexWhere((item) => item.id == id);
    if (index == -1) {
      throw Exception('Item not found');
    }

    final item = _items[index];
    _items[index] = item.copyWith(
      status: status,
      deliveredAt: deliveredAt,
    );
    return _items[index];
  }

  void reset() {
    _items = List.from(MockFoundItems.getInitialItems());
    IdGenerator.reset();
  }
}

