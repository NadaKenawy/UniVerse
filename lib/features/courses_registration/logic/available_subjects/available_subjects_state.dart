import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_subjects_state.freezed.dart';

@freezed
class AvailableSubjectsState<T> with _$AvailableSubjectsState<T> {
  const factory AvailableSubjectsState.initial() = _Initial;
  const factory AvailableSubjectsState.loading() = Loading;
  const factory AvailableSubjectsState.success(T data) = Success<T>;
  const factory AvailableSubjectsState.error({required String error}) = Error;
}