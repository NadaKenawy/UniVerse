import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_subject_state.freezed.dart';

@freezed
class RegisterSubjectState<T> with _$RegisterSubjectState<T> {
  const factory RegisterSubjectState.initial() = _Initial;
  const factory RegisterSubjectState.loading() = Loading;
  const factory RegisterSubjectState.success(T data) = Success<T>;
  const factory RegisterSubjectState.error({required String error}) = Error;
}
