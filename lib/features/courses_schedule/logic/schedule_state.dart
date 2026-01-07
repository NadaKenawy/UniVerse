import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_state.freezed.dart';

@freezed
class ScheduleState<T> with _$ScheduleState<T> {
  const factory ScheduleState.initial() = _Initial;
  const factory ScheduleState.loading() = Loading;
  const factory ScheduleState.success(T data) = Success<T>;
  const factory ScheduleState.error({required String error}) = Error;
}
