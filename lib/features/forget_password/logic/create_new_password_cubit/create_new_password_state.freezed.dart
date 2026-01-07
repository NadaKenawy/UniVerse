// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_new_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreatePasswordState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePasswordState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePasswordState<$T>()';
}


}

/// @nodoc
class $CreatePasswordStateCopyWith<T,$Res>  {
$CreatePasswordStateCopyWith(CreatePasswordState<T> _, $Res Function(CreatePasswordState<T>) __);
}


/// Adds pattern-matching-related methods to [CreatePasswordState].
extension CreatePasswordStatePatterns<T> on CreatePasswordState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T> value)?  initial,TResult Function( CreateNewPasswordLoading<T> value)?  createNewPasswordloading,TResult Function( CreateNewPasswordSuccess<T> value)?  createNewPasswordsuccess,TResult Function( Error<T> value)?  createNewPassworderrorerror,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CreateNewPasswordLoading() when createNewPasswordloading != null:
return createNewPasswordloading(_that);case CreateNewPasswordSuccess() when createNewPasswordsuccess != null:
return createNewPasswordsuccess(_that);case Error() when createNewPassworderrorerror != null:
return createNewPassworderrorerror(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T> value)  initial,required TResult Function( CreateNewPasswordLoading<T> value)  createNewPasswordloading,required TResult Function( CreateNewPasswordSuccess<T> value)  createNewPasswordsuccess,required TResult Function( Error<T> value)  createNewPassworderrorerror,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case CreateNewPasswordLoading():
return createNewPasswordloading(_that);case CreateNewPasswordSuccess():
return createNewPasswordsuccess(_that);case Error():
return createNewPassworderrorerror(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T> value)?  initial,TResult? Function( CreateNewPasswordLoading<T> value)?  createNewPasswordloading,TResult? Function( CreateNewPasswordSuccess<T> value)?  createNewPasswordsuccess,TResult? Function( Error<T> value)?  createNewPassworderrorerror,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CreateNewPasswordLoading() when createNewPasswordloading != null:
return createNewPasswordloading(_that);case CreateNewPasswordSuccess() when createNewPasswordsuccess != null:
return createNewPasswordsuccess(_that);case Error() when createNewPassworderrorerror != null:
return createNewPassworderrorerror(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  createNewPasswordloading,TResult Function( String message)?  createNewPasswordsuccess,TResult Function( String error)?  createNewPassworderrorerror,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CreateNewPasswordLoading() when createNewPasswordloading != null:
return createNewPasswordloading();case CreateNewPasswordSuccess() when createNewPasswordsuccess != null:
return createNewPasswordsuccess(_that.message);case Error() when createNewPassworderrorerror != null:
return createNewPassworderrorerror(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  createNewPasswordloading,required TResult Function( String message)  createNewPasswordsuccess,required TResult Function( String error)  createNewPassworderrorerror,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case CreateNewPasswordLoading():
return createNewPasswordloading();case CreateNewPasswordSuccess():
return createNewPasswordsuccess(_that.message);case Error():
return createNewPassworderrorerror(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  createNewPasswordloading,TResult? Function( String message)?  createNewPasswordsuccess,TResult? Function( String error)?  createNewPassworderrorerror,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CreateNewPasswordLoading() when createNewPasswordloading != null:
return createNewPasswordloading();case CreateNewPasswordSuccess() when createNewPasswordsuccess != null:
return createNewPasswordsuccess(_that.message);case Error() when createNewPassworderrorerror != null:
return createNewPassworderrorerror(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<T> implements CreatePasswordState<T> {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePasswordState<$T>.initial()';
}


}




/// @nodoc


class CreateNewPasswordLoading<T> implements CreatePasswordState<T> {
  const CreateNewPasswordLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNewPasswordLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePasswordState<$T>.createNewPasswordloading()';
}


}




/// @nodoc


class CreateNewPasswordSuccess<T> implements CreatePasswordState<T> {
  const CreateNewPasswordSuccess({required this.message});
  

 final  String message;

/// Create a copy of CreatePasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateNewPasswordSuccessCopyWith<T, CreateNewPasswordSuccess<T>> get copyWith => _$CreateNewPasswordSuccessCopyWithImpl<T, CreateNewPasswordSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNewPasswordSuccess<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CreatePasswordState<$T>.createNewPasswordsuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class $CreateNewPasswordSuccessCopyWith<T,$Res> implements $CreatePasswordStateCopyWith<T, $Res> {
  factory $CreateNewPasswordSuccessCopyWith(CreateNewPasswordSuccess<T> value, $Res Function(CreateNewPasswordSuccess<T>) _then) = _$CreateNewPasswordSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CreateNewPasswordSuccessCopyWithImpl<T,$Res>
    implements $CreateNewPasswordSuccessCopyWith<T, $Res> {
  _$CreateNewPasswordSuccessCopyWithImpl(this._self, this._then);

  final CreateNewPasswordSuccess<T> _self;
  final $Res Function(CreateNewPasswordSuccess<T>) _then;

/// Create a copy of CreatePasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CreateNewPasswordSuccess<T>(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Error<T> implements CreatePasswordState<T> {
  const Error({required this.error});
  

 final  String error;

/// Create a copy of CreatePasswordState
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
  return 'CreatePasswordState<$T>.createNewPassworderrorerror(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<T,$Res> implements $CreatePasswordStateCopyWith<T, $Res> {
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

/// Create a copy of CreatePasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(Error<T>(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
