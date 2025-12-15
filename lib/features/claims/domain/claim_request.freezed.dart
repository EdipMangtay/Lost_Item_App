// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claim_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClaimRequest _$ClaimRequestFromJson(Map<String, dynamic> json) {
  return _ClaimRequest.fromJson(json);
}

/// @nodoc
mixin _$ClaimRequest {
  String get id => throw _privateConstructorUsedError;
  String get itemId => throw _privateConstructorUsedError;
  String get requesterUid => throw _privateConstructorUsedError;
  String get requesterName => throw _privateConstructorUsedError;
  String? get requesterStudentNo => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  ClaimStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get decidedAt => throw _privateConstructorUsedError;
  String? get decidedByOfficerId => throw _privateConstructorUsedError;

  /// Serializes this ClaimRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClaimRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClaimRequestCopyWith<ClaimRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimRequestCopyWith<$Res> {
  factory $ClaimRequestCopyWith(
          ClaimRequest value, $Res Function(ClaimRequest) then) =
      _$ClaimRequestCopyWithImpl<$Res, ClaimRequest>;
  @useResult
  $Res call(
      {String id,
      String itemId,
      String requesterUid,
      String requesterName,
      String? requesterStudentNo,
      String notes,
      ClaimStatus status,
      DateTime createdAt,
      DateTime? decidedAt,
      String? decidedByOfficerId});
}

/// @nodoc
class _$ClaimRequestCopyWithImpl<$Res, $Val extends ClaimRequest>
    implements $ClaimRequestCopyWith<$Res> {
  _$ClaimRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClaimRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? requesterUid = null,
    Object? requesterName = null,
    Object? requesterStudentNo = freezed,
    Object? notes = null,
    Object? status = null,
    Object? createdAt = null,
    Object? decidedAt = freezed,
    Object? decidedByOfficerId = freezed,
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
      requesterUid: null == requesterUid
          ? _value.requesterUid
          : requesterUid // ignore: cast_nullable_to_non_nullable
              as String,
      requesterName: null == requesterName
          ? _value.requesterName
          : requesterName // ignore: cast_nullable_to_non_nullable
              as String,
      requesterStudentNo: freezed == requesterStudentNo
          ? _value.requesterStudentNo
          : requesterStudentNo // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ClaimStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      decidedAt: freezed == decidedAt
          ? _value.decidedAt
          : decidedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      decidedByOfficerId: freezed == decidedByOfficerId
          ? _value.decidedByOfficerId
          : decidedByOfficerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClaimRequestImplCopyWith<$Res>
    implements $ClaimRequestCopyWith<$Res> {
  factory _$$ClaimRequestImplCopyWith(
          _$ClaimRequestImpl value, $Res Function(_$ClaimRequestImpl) then) =
      __$$ClaimRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String itemId,
      String requesterUid,
      String requesterName,
      String? requesterStudentNo,
      String notes,
      ClaimStatus status,
      DateTime createdAt,
      DateTime? decidedAt,
      String? decidedByOfficerId});
}

/// @nodoc
class __$$ClaimRequestImplCopyWithImpl<$Res>
    extends _$ClaimRequestCopyWithImpl<$Res, _$ClaimRequestImpl>
    implements _$$ClaimRequestImplCopyWith<$Res> {
  __$$ClaimRequestImplCopyWithImpl(
      _$ClaimRequestImpl _value, $Res Function(_$ClaimRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClaimRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? requesterUid = null,
    Object? requesterName = null,
    Object? requesterStudentNo = freezed,
    Object? notes = null,
    Object? status = null,
    Object? createdAt = null,
    Object? decidedAt = freezed,
    Object? decidedByOfficerId = freezed,
  }) {
    return _then(_$ClaimRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      requesterUid: null == requesterUid
          ? _value.requesterUid
          : requesterUid // ignore: cast_nullable_to_non_nullable
              as String,
      requesterName: null == requesterName
          ? _value.requesterName
          : requesterName // ignore: cast_nullable_to_non_nullable
              as String,
      requesterStudentNo: freezed == requesterStudentNo
          ? _value.requesterStudentNo
          : requesterStudentNo // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ClaimStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      decidedAt: freezed == decidedAt
          ? _value.decidedAt
          : decidedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      decidedByOfficerId: freezed == decidedByOfficerId
          ? _value.decidedByOfficerId
          : decidedByOfficerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClaimRequestImpl implements _ClaimRequest {
  const _$ClaimRequestImpl(
      {required this.id,
      required this.itemId,
      required this.requesterUid,
      required this.requesterName,
      this.requesterStudentNo,
      required this.notes,
      required this.status,
      required this.createdAt,
      this.decidedAt,
      this.decidedByOfficerId});

  factory _$ClaimRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClaimRequestImplFromJson(json);

  @override
  final String id;
  @override
  final String itemId;
  @override
  final String requesterUid;
  @override
  final String requesterName;
  @override
  final String? requesterStudentNo;
  @override
  final String notes;
  @override
  final ClaimStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime? decidedAt;
  @override
  final String? decidedByOfficerId;

  @override
  String toString() {
    return 'ClaimRequest(id: $id, itemId: $itemId, requesterUid: $requesterUid, requesterName: $requesterName, requesterStudentNo: $requesterStudentNo, notes: $notes, status: $status, createdAt: $createdAt, decidedAt: $decidedAt, decidedByOfficerId: $decidedByOfficerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.requesterUid, requesterUid) ||
                other.requesterUid == requesterUid) &&
            (identical(other.requesterName, requesterName) ||
                other.requesterName == requesterName) &&
            (identical(other.requesterStudentNo, requesterStudentNo) ||
                other.requesterStudentNo == requesterStudentNo) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.decidedAt, decidedAt) ||
                other.decidedAt == decidedAt) &&
            (identical(other.decidedByOfficerId, decidedByOfficerId) ||
                other.decidedByOfficerId == decidedByOfficerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      itemId,
      requesterUid,
      requesterName,
      requesterStudentNo,
      notes,
      status,
      createdAt,
      decidedAt,
      decidedByOfficerId);

  /// Create a copy of ClaimRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimRequestImplCopyWith<_$ClaimRequestImpl> get copyWith =>
      __$$ClaimRequestImplCopyWithImpl<_$ClaimRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClaimRequestImplToJson(
      this,
    );
  }
}

abstract class _ClaimRequest implements ClaimRequest {
  const factory _ClaimRequest(
      {required final String id,
      required final String itemId,
      required final String requesterUid,
      required final String requesterName,
      final String? requesterStudentNo,
      required final String notes,
      required final ClaimStatus status,
      required final DateTime createdAt,
      final DateTime? decidedAt,
      final String? decidedByOfficerId}) = _$ClaimRequestImpl;

  factory _ClaimRequest.fromJson(Map<String, dynamic> json) =
      _$ClaimRequestImpl.fromJson;

  @override
  String get id;
  @override
  String get itemId;
  @override
  String get requesterUid;
  @override
  String get requesterName;
  @override
  String? get requesterStudentNo;
  @override
  String get notes;
  @override
  ClaimStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime? get decidedAt;
  @override
  String? get decidedByOfficerId;

  /// Create a copy of ClaimRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClaimRequestImplCopyWith<_$ClaimRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
