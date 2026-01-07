import 'package:freezed_annotation/freezed_annotation.dart';

part 'complaint_state.freezed.dart';

@freezed
class ComplaintState<T> with _$ComplaintState<T> {
  const factory ComplaintState.initial() = _Initial;
  const factory ComplaintState.loading() = Loading;
  const factory ComplaintState.success(T data) = Success<T>;
  const factory ComplaintState.error({required String error}) = Error;
}
