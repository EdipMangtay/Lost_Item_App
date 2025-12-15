import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_photo.freezed.dart';
part 'item_photo.g.dart';

enum PhotoType {
  found,
  handover,
}

@freezed
class ItemPhoto with _$ItemPhoto {
  const factory ItemPhoto({
    required String id,
    required String itemId,
    required PhotoType type,
    required String assetPath,
    required DateTime uploadedAt,
  }) = _ItemPhoto;

  factory ItemPhoto.fromJson(Map<String, dynamic> json) => _$ItemPhotoFromJson(json);
}

