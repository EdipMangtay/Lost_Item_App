import 'package:campus_lost_found/core/domain/item_photo.dart';
import 'package:campus_lost_found/features/found_items/domain/found_item.dart';
import 'package:campus_lost_found/core/utils/id_generator.dart';

class MockFoundItems {
  static List<FoundItem> getInitialItems() {
    final now = DateTime.now();
    return [
      FoundItem(
        id: 'LF-2025-000001',
        title: 'iPhone 14 Pro',
        category: 'Electronics',
        description: 'Found near the library entrance. Black case with a blue sticker on the back.',
        foundLocation: 'Library',
        foundAt: now.subtract(const Duration(days: 2)),
        status: ItemStatus.inStorage,
        photos: [
          ItemPhoto(
            id: 'photo-1',
            itemId: 'LF-2025-000001',
            type: PhotoType.found,
            assetPath: 'assets/images/placeholder_phone.png',
            uploadedAt: now.subtract(const Duration(days: 2)),
          ),
        ],
        qrValue: IdGenerator.generateQrValue('LF-2025-000001'),
        createdByOfficerId: 'officer-1',
      ),
      FoundItem(
        id: 'LF-2025-000002',
        title: 'Blue Backpack',
        category: 'Bags',
        description: 'Nike backpack with laptop compartment. Contains notebooks and pens.',
        foundLocation: 'Student Center',
        foundAt: now.subtract(const Duration(days: 5)),
        status: ItemStatus.pendingClaim,
        photos: [
          ItemPhoto(
            id: 'photo-2',
            itemId: 'LF-2025-000002',
            type: PhotoType.found,
            assetPath: 'assets/images/placeholder_bag.png',
            uploadedAt: now.subtract(const Duration(days: 5)),
          ),
        ],
        qrValue: IdGenerator.generateQrValue('LF-2025-000002'),
        createdByOfficerId: 'officer-1',
      ),
      FoundItem(
        id: 'LF-2025-000003',
        title: 'Student ID Card',
        category: 'ID Cards',
        description: 'Student ID found in the cafeteria. Name visible on card.',
        foundLocation: 'Cafeteria',
        foundAt: now.subtract(const Duration(hours: 12)),
        status: ItemStatus.inStorage,
        photos: [
          ItemPhoto(
            id: 'photo-3',
            itemId: 'LF-2025-000003',
            type: PhotoType.found,
            assetPath: 'assets/images/placeholder_id.png',
            uploadedAt: now.subtract(const Duration(hours: 12)),
          ),
        ],
        qrValue: IdGenerator.generateQrValue('LF-2025-000003'),
        createdByOfficerId: 'officer-2',
      ),
      FoundItem(
        id: 'LF-2025-000004',
        title: 'Wireless Earbuds',
        category: 'Electronics',
        description: 'AirPods Pro in a white case. Found in the gym locker room.',
        foundLocation: 'Gym',
        foundAt: now.subtract(const Duration(days: 1)),
        status: ItemStatus.delivered,
        photos: [
          ItemPhoto(
            id: 'photo-4',
            itemId: 'LF-2025-000004',
            type: PhotoType.found,
            assetPath: 'assets/images/placeholder_earbuds.png',
            uploadedAt: now.subtract(const Duration(days: 1)),
          ),
        ],
        qrValue: IdGenerator.generateQrValue('LF-2025-000004'),
        createdByOfficerId: 'officer-1',
        deliveredAt: now.subtract(const Duration(hours: 6)),
      ),
      FoundItem(
        id: 'LF-2025-000005',
        title: 'Textbook: Calculus',
        category: 'Books',
        description: 'Calculus textbook, 3rd edition. Has notes written in margins.',
        foundLocation: 'Library',
        foundAt: now.subtract(const Duration(days: 3)),
        status: ItemStatus.inStorage,
        photos: [
          ItemPhoto(
            id: 'photo-5',
            itemId: 'LF-2025-000005',
            type: PhotoType.found,
            assetPath: 'assets/images/placeholder_book.png',
            uploadedAt: now.subtract(const Duration(days: 3)),
          ),
        ],
        qrValue: IdGenerator.generateQrValue('LF-2025-000005'),
        createdByOfficerId: 'officer-2',
      ),
    ];
  }
}

