// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'found_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoundItem _$FoundItemFromJson(Map<String, dynamic> json) {
  return _FoundItem.fromJson(json);
}

/// @nodoc
mixin _$FoundItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get foundLocation => throw _privateConstructorUsedError;
  DateTime get foundAt => throw _privateConstructorUsedError;
  ItemStatus get status => throw _privateConstructorUsedError;
  List<ItemPhoto> get photos => throw _privateConstructorUsedError;
  String get qrValue => throw _privateConstructorUsedError;
  String get createdByOfficerId => throw _privateConstructorUsedError;
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  String? get mainPhotoUrl => throw _privateConstructorUsedError;

  /// Serializes this FoundItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoundItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoundItemCopyWith<FoundItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoundItemCopyWith<$Res> {
  factory $FoundItemCopyWith(FoundItem value, $Res Function(FoundItem) then) =
      _$FoundItemCopyWithImpl<$Res, FoundItem>;
  @useResult
  $Res call(
      {String id,
      String title,
      String category,
      String description,
      String foundLocation,
      DateTime foundAt,
      ItemStatus status,
      List<ItemPhoto> photos,
      String qrValue,
      String createdByOfficerId,
      DateTime? deliveredAt,
      String? mainPhotoUrl});
}

/// @nodoc
class _$FoundItemCopyWithImpl<$Res, $Val extends FoundItem>
    implements $FoundItemCopyWith<$Res> {
  _$FoundItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoundItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? category = null,
    Object? description = null,
    Object? foundLocation = null,
    Object? foundAt = null,
    Object? status = null,
    Object? photos = null,
    Object? qrValue = null,
    Object? createdByOfficerId = null,
    Object? deliveredAt = freezed,
    Object? mainPhotoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      foundLocation: null == foundLocation
          ? _value.foundLocation
          : foundLocation // ignore: cast_nullable_to_non_nullable
              as String,
      foundAt: null == foundAt
          ? _value.foundAt
          : foundAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ItemStatus,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<ItemPhoto>,
      qrValue: null == qrValue
          ? _value.qrValue
          : qrValue // ignore: cast_nullable_to_non_nullable
              as String,
      createdByOfficerId: null == createdByOfficerId
          ? _value.createdByOfficerId
          : createdByOfficerId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mainPhotoUrl: freezed == mainPhotoUrl
          ? _value.mainPhotoUrl
          : mainPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoundItemImplCopyWith<$Res>
    implements $FoundItemCopyWith<$Res> {
  factory _$$FoundItemImplCopyWith(
          _$FoundItemImpl value, $Res Function(_$FoundItemImpl) then) =
      __$$FoundItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String category,
      String description,
      String foundLocation,
      DateTime foundAt,
      ItemStatus status,
      List<ItemPhoto> photos,
      String qrValue,
      String createdByOfficerId,
      DateTime? deliveredAt,
      String? mainPhotoUrl});
}

/// @nodoc
class __$$FoundItemImplCopyWithImpl<$Res>
    extends _$FoundItemCopyWithImpl<$Res, _$FoundItemImpl>
    implements _$$FoundItemImplCopyWith<$Res> {
  __$$FoundItemImplCopyWithImpl(
      _$FoundItemImpl _value, $Res Function(_$FoundItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoundItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? category = null,
    Object? description = null,
    Object? foundLocation = null,
    Object? foundAt = null,
    Object? status = null,
    Object? photos = null,
    Object? qrValue = null,
    Object? createdByOfficerId = null,
    Object? deliveredAt = freezed,
    Object? mainPhotoUrl = freezed,
  }) {
    return _then(_$FoundItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      foundLocation: null == foundLocation
          ? _value.foundLocation
          : foundLocation // ignore: cast_nullable_to_non_nullable
              as String,
      foundAt: null == foundAt
          ? _value.foundAt
          : foundAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ItemStatus,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<ItemPhoto>,
      qrValue: null == qrValue
          ? _value.qrValue
          : qrValue // ignore: cast_nullable_to_non_nullable
              as String,
      createdByOfficerId: null == createdByOfficerId
          ? _value.createdByOfficerId
          : createdByOfficerId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mainPhotoUrl: freezed == mainPhotoUrl
          ? _value.mainPhotoUrl
          : mainPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoundItemImpl implements _FoundItem {
  const _$FoundItemImpl(
      {required this.id,
      required this.title,
      required this.category,
      required this.description,
      required this.foundLocation,
      required this.foundAt,
      required this.status,
      required final List<ItemPhoto> photos,
      required this.qrValue,
      required this.createdByOfficerId,
      this.deliveredAt,
      this.mainPhotoUrl})
      : _photos = photos;

  factory _$FoundItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoundItemImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String category;
  @override
  final String description;
  @override
  final String foundLocation;
  @override
  final DateTime foundAt;
  @override
  final ItemStatus status;
  final List<ItemPhoto> _photos;
  @override
  List<ItemPhoto> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  final String qrValue;
  @override
  final String createdByOfficerId;
  @override
  final DateTime? deliveredAt;
  @override
  final String? mainPhotoUrl;

  @override
  String toString() {
    return 'FoundItem(id: $id, title: $title, category: $category, description: $description, foundLocation: $foundLocation, foundAt: $foundAt, status: $status, photos: $photos, qrValue: $qrValue, createdByOfficerId: $createdByOfficerId, deliveredAt: $deliveredAt, mainPhotoUrl: $mainPhotoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoundItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.foundLocation, foundLocation) ||
                other.foundLocation == foundLocation) &&
            (identical(other.foundAt, foundAt) || other.foundAt == foundAt) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.qrValue, qrValue) || other.qrValue == qrValue) &&
            (identical(other.createdByOfficerId, createdByOfficerId) ||
                other.createdByOfficerId == createdByOfficerId) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.mainPhotoUrl, mainPhotoUrl) ||
                other.mainPhotoUrl == mainPhotoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      category,
      description,
      foundLocation,
      foundAt,
      status,
      const DeepCollectionEquality().hash(_photos),
      qrValue,
      createdByOfficerId,
      deliveredAt,
      mainPhotoUrl);

  /// Create a copy of FoundItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoundItemImplCopyWith<_$FoundItemImpl> get copyWith =>
      __$$FoundItemImplCopyWithImpl<_$FoundItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoundItemImplToJson(
      this,
    );
  }
}

abstract class _FoundItem implements FoundItem {
  const factory _FoundItem(
      {required final String id,
      required final String title,
      required final String category,
      required final String description,
      required final String foundLocation,
      required final DateTime foundAt,
      required final ItemStatus status,
      required final List<ItemPhoto> photos,
      required final String qrValue,
      required final String createdByOfficerId,
      final DateTime? deliveredAt,
      final String? mainPhotoUrl}) = _$FoundItemImpl;

  factory _FoundItem.fromJson(Map<String, dynamic> json) =
      _$FoundItemImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get category;
  @override
  String get description;
  @override
  String get foundLocation;
  @override
  DateTime get foundAt;
  @override
  ItemStatus get status;
  @override
  List<ItemPhoto> get photos;
  @override
  String get qrValue;
  @override
  String get createdByOfficerId;
  @override
  DateTime? get deliveredAt;
  @override
  String? get mainPhotoUrl;

  /// Create a copy of FoundItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoundItemImplCopyWith<_$FoundItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
