import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:campus_lost_found/core/domain/item_photo.dart';

part 'found_item.freezed.dart';
part 'found_item.g.dart';

enum ItemStatus {
  inStorage,
  pendingClaim,
  delivered,
}

@freezed
class FoundItem with _$FoundItem {
  const factory FoundItem({
    required String id,
    required String title,
    required String category,
    required String description,
    required String foundLocation,
    required DateTime foundAt,
    required ItemStatus status,
    required List<ItemPhoto> photos,
    required String qrValue,
    required String createdByOfficerId,
    DateTime? deliveredAt,
  }) = _FoundItem;

  factory FoundItem.fromJson(Map<String, dynamic> json) => _$FoundItemFromJson(json);
}

