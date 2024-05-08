// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adoption.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Adoption _$AdoptionFromJson(Map<String, dynamic> json) {
  return _Adoption.fromJson(json);
}

/// @nodoc
mixin _$Adoption {
  Pet get pet => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userImageUrl => throw _privateConstructorUsedError;
  bool get isImportant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdoptionCopyWith<Adoption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdoptionCopyWith<$Res> {
  factory $AdoptionCopyWith(Adoption value, $Res Function(Adoption) then) =
      _$AdoptionCopyWithImpl<$Res, Adoption>;
  @useResult
  $Res call(
      {Pet pet,
      String description,
      String userName,
      String userId,
      String userImageUrl,
      bool isImportant});

  $PetCopyWith<$Res> get pet;
}

/// @nodoc
class _$AdoptionCopyWithImpl<$Res, $Val extends Adoption>
    implements $AdoptionCopyWith<$Res> {
  _$AdoptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pet = null,
    Object? description = null,
    Object? userName = null,
    Object? userId = null,
    Object? userImageUrl = null,
    Object? isImportant = null,
  }) {
    return _then(_value.copyWith(
      pet: null == pet
          ? _value.pet
          : pet // ignore: cast_nullable_to_non_nullable
              as Pet,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userImageUrl: null == userImageUrl
          ? _value.userImageUrl
          : userImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isImportant: null == isImportant
          ? _value.isImportant
          : isImportant // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PetCopyWith<$Res> get pet {
    return $PetCopyWith<$Res>(_value.pet, (value) {
      return _then(_value.copyWith(pet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AdoptionImplCopyWith<$Res>
    implements $AdoptionCopyWith<$Res> {
  factory _$$AdoptionImplCopyWith(
          _$AdoptionImpl value, $Res Function(_$AdoptionImpl) then) =
      __$$AdoptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Pet pet,
      String description,
      String userName,
      String userId,
      String userImageUrl,
      bool isImportant});

  @override
  $PetCopyWith<$Res> get pet;
}

/// @nodoc
class __$$AdoptionImplCopyWithImpl<$Res>
    extends _$AdoptionCopyWithImpl<$Res, _$AdoptionImpl>
    implements _$$AdoptionImplCopyWith<$Res> {
  __$$AdoptionImplCopyWithImpl(
      _$AdoptionImpl _value, $Res Function(_$AdoptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pet = null,
    Object? description = null,
    Object? userName = null,
    Object? userId = null,
    Object? userImageUrl = null,
    Object? isImportant = null,
  }) {
    return _then(_$AdoptionImpl(
      pet: null == pet
          ? _value.pet
          : pet // ignore: cast_nullable_to_non_nullable
              as Pet,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userImageUrl: null == userImageUrl
          ? _value.userImageUrl
          : userImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isImportant: null == isImportant
          ? _value.isImportant
          : isImportant // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdoptionImpl implements _Adoption {
  const _$AdoptionImpl(
      {required this.pet,
      required this.description,
      required this.userName,
      required this.userId,
      required this.userImageUrl,
      this.isImportant = true});

  factory _$AdoptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdoptionImplFromJson(json);

  @override
  final Pet pet;
  @override
  final String description;
  @override
  final String userName;
  @override
  final String userId;
  @override
  final String userImageUrl;
  @override
  @JsonKey()
  final bool isImportant;

  @override
  String toString() {
    return 'Adoption(pet: $pet, description: $description, userName: $userName, userId: $userId, userImageUrl: $userImageUrl, isImportant: $isImportant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdoptionImpl &&
            (identical(other.pet, pet) || other.pet == pet) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userImageUrl, userImageUrl) ||
                other.userImageUrl == userImageUrl) &&
            (identical(other.isImportant, isImportant) ||
                other.isImportant == isImportant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pet, description, userName,
      userId, userImageUrl, isImportant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdoptionImplCopyWith<_$AdoptionImpl> get copyWith =>
      __$$AdoptionImplCopyWithImpl<_$AdoptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdoptionImplToJson(
      this,
    );
  }
}

abstract class _Adoption implements Adoption {
  const factory _Adoption(
      {required final Pet pet,
      required final String description,
      required final String userName,
      required final String userId,
      required final String userImageUrl,
      final bool isImportant}) = _$AdoptionImpl;

  factory _Adoption.fromJson(Map<String, dynamic> json) =
      _$AdoptionImpl.fromJson;

  @override
  Pet get pet;
  @override
  String get description;
  @override
  String get userName;
  @override
  String get userId;
  @override
  String get userImageUrl;
  @override
  bool get isImportant;
  @override
  @JsonKey(ignore: true)
  _$$AdoptionImplCopyWith<_$AdoptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
