// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_fcm_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateFcmState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateFcmState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateFcmState<$T>()';
}


}

/// @nodoc
class $UpdateFcmStateCopyWith<T,$Res>  {
$UpdateFcmStateCopyWith(UpdateFcmState<T> _, $Res Function(UpdateFcmState<T>) __);
}


/// Adds pattern-matching-related methods to [UpdateFcmState].
extension UpdateFcmStatePatterns<T> on UpdateFcmState<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T> value)?  initial,TResult Function( UpdateFcmLoading<T> value)?  updateFcmLoading,TResult Function( UpdateFcmSuccess<T> value)?  updateFcmSuccess,TResult Function( Error<T> value)?  updateFcmError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case UpdateFcmLoading() when updateFcmLoading != null:
return updateFcmLoading(_that);case UpdateFcmSuccess() when updateFcmSuccess != null:
return updateFcmSuccess(_that);case Error() when updateFcmError != null:
return updateFcmError(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T> value)  initial,required TResult Function( UpdateFcmLoading<T> value)  updateFcmLoading,required TResult Function( UpdateFcmSuccess<T> value)  updateFcmSuccess,required TResult Function( Error<T> value)  updateFcmError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case UpdateFcmLoading():
return updateFcmLoading(_that);case UpdateFcmSuccess():
return updateFcmSuccess(_that);case Error():
return updateFcmError(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T> value)?  initial,TResult? Function( UpdateFcmLoading<T> value)?  updateFcmLoading,TResult? Function( UpdateFcmSuccess<T> value)?  updateFcmSuccess,TResult? Function( Error<T> value)?  updateFcmError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case UpdateFcmLoading() when updateFcmLoading != null:
return updateFcmLoading(_that);case UpdateFcmSuccess() when updateFcmSuccess != null:
return updateFcmSuccess(_that);case Error() when updateFcmError != null:
return updateFcmError(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  updateFcmLoading,TResult Function( T data)?  updateFcmSuccess,TResult Function( String error)?  updateFcmError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case UpdateFcmLoading() when updateFcmLoading != null:
return updateFcmLoading();case UpdateFcmSuccess() when updateFcmSuccess != null:
return updateFcmSuccess(_that.data);case Error() when updateFcmError != null:
return updateFcmError(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  updateFcmLoading,required TResult Function( T data)  updateFcmSuccess,required TResult Function( String error)  updateFcmError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case UpdateFcmLoading():
return updateFcmLoading();case UpdateFcmSuccess():
return updateFcmSuccess(_that.data);case Error():
return updateFcmError(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  updateFcmLoading,TResult? Function( T data)?  updateFcmSuccess,TResult? Function( String error)?  updateFcmError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case UpdateFcmLoading() when updateFcmLoading != null:
return updateFcmLoading();case UpdateFcmSuccess() when updateFcmSuccess != null:
return updateFcmSuccess(_that.data);case Error() when updateFcmError != null:
return updateFcmError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<T> implements UpdateFcmState<T> {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateFcmState<$T>.initial()';
}


}




/// @nodoc


class UpdateFcmLoading<T> implements UpdateFcmState<T> {
  const UpdateFcmLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateFcmLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateFcmState<$T>.updateFcmLoading()';
}


}




/// @nodoc


class UpdateFcmSuccess<T> implements UpdateFcmState<T> {
  const UpdateFcmSuccess(this.data);
  

 final  T data;

/// Create a copy of UpdateFcmState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateFcmSuccessCopyWith<T, UpdateFcmSuccess<T>> get copyWith => _$UpdateFcmSuccessCopyWithImpl<T, UpdateFcmSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateFcmSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'UpdateFcmState<$T>.updateFcmSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateFcmSuccessCopyWith<T,$Res> implements $UpdateFcmStateCopyWith<T, $Res> {
  factory $UpdateFcmSuccessCopyWith(UpdateFcmSuccess<T> value, $Res Function(UpdateFcmSuccess<T>) _then) = _$UpdateFcmSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$UpdateFcmSuccessCopyWithImpl<T,$Res>
    implements $UpdateFcmSuccessCopyWith<T, $Res> {
  _$UpdateFcmSuccessCopyWithImpl(this._self, this._then);

  final UpdateFcmSuccess<T> _self;
  final $Res Function(UpdateFcmSuccess<T>) _then;

/// Create a copy of UpdateFcmState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(UpdateFcmSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class Error<T> implements UpdateFcmState<T> {
  const Error({required this.error});
  

 final  String error;

/// Create a copy of UpdateFcmState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<T, Error<T>> get copyWith => _$ErrorCopyWithImpl<T, Error<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error<T>&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'UpdateFcmState<$T>.updateFcmError(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<T,$Res> implements $UpdateFcmStateCopyWith<T, $Res> {
  factory $ErrorCopyWith(Error<T> value, $Res Function(Error<T>) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ErrorCopyWithImpl<T,$Res>
    implements $ErrorCopyWith<T, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<T> _self;
  final $Res Function(Error<T>) _then;

/// Create a copy of UpdateFcmState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(Error<T>(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
