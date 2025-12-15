// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemPhoto _$ItemPhotoFromJson(Map<String, dynamic> json) {
  return _ItemPhoto.fromJson(json);
}

/// @nodoc
mixin _$ItemPhoto {
  String get id => throw _privateConstructorUsedError;
  String get itemId => throw _privateConstructorUsedError;
  PhotoType get type => throw _privateConstructorUsedError;
  String get assetPath => throw _privateConstructorUsedError;
  DateTime get uploadedAt => throw _privateConstructorUsedError;

  /// Serializes this ItemPhoto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemPhoto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemPhotoCopyWith<ItemPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemPhotoCopyWith<$Res> {
  factory $ItemPhotoCopyWith(ItemPhoto value, $Res Function(ItemPhoto) then) =
      _$ItemPhotoCopyWithImpl<$Res, ItemPhoto>;
  @useResult
  $Res call(
      {String id,
      String itemId,
      PhotoType type,
      String assetPath,
      DateTime uploadedAt});
}

/// @nodoc
class _$ItemPhotoCopyWithImpl<$Res, $Val extends ItemPhoto>
    implements $ItemPhotoCopyWith<$Res> {
  _$ItemPhotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemPhoto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? type = null,
    Object? assetPath = null,
    Object? uploadedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PhotoType,
      assetPath: null == assetPath
          ? _value.assetPath
          : assetPath // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemPhotoImplCopyWith<$Res>
    implements $ItemPhotoCopyWith<$Res> {
  factory _$$ItemPhotoImplCopyWith(
          _$ItemPhotoImpl value, $Res Function(_$ItemPhotoImpl) then) =
      __$$ItemPhotoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String itemId,
      PhotoType type,
      String assetPath,
      DateTime uploadedAt});
}

/// @nodoc
class __$$ItemPhotoImplCopyWithImpl<$Res>
    extends _$ItemPhotoCopyWithImpl<$Res, _$ItemPhotoImpl>
    implements _$$ItemPhotoImplCopyWith<$Res> {
  __$$ItemPhotoImplCopyWithImpl(
      _$ItemPhotoImpl _value, $Res Function(_$ItemPhotoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemPhoto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? type = null,
    Object? assetPath = null,
    Object? uploadedAt = null,
  }) {
    return _then(_$ItemPhotoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PhotoType,
      assetPath: null == assetPath
          ? _value.assetPath
          : assetPath // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemPhotoImpl implements _ItemPhoto {
  const _$ItemPhotoImpl(
      {required this.id,
      required this.itemId,
      required this.type,
      required this.assetPath,
      required this.uploadedAt});

  factory _$ItemPhotoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemPhotoImplFromJson(json);

  @override
  final String id;
  @override
  final String itemId;
  @override
  final PhotoType type;
  @override
  final String assetPath;
  @override
  final DateTime uploadedAt;

  @override
  String toString() {
    return 'ItemPhoto(id: $id, itemId: $itemId, type: $type, assetPath: $assetPath, uploadedAt: $uploadedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemPhotoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.assetPath, assetPath) ||
                other.assetPath == assetPath) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, itemId, type, assetPath, uploadedAt);

  /// Create a copy of ItemPhoto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemPhotoImplCopyWith<_$ItemPhotoImpl> get copyWith =>
      __$$ItemPhotoImplCopyWithImpl<_$ItemPhotoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemPhotoImplToJson(
      this,
    );
  }
}

abstract class _ItemPhoto implements ItemPhoto {
  const factory _ItemPhoto(
      {required final String id,
      required final String itemId,
      required final PhotoType type,
      required final String assetPath,
      required final DateTime uploadedAt}) = _$ItemPhotoImpl;

  factory _ItemPhoto.fromJson(Map<String, dynamic> json) =
      _$ItemPhotoImpl.fromJson;

  @override
  String get id;
  @override
  String get itemId;
  @override
  PhotoType get type;
  @override
  String get assetPath;
  @override
  DateTime get uploadedAt;

  /// Create a copy of ItemPhoto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemPhotoImplCopyWith<_$ItemPhotoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
