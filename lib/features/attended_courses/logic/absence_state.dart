import 'package:freezed_annotation/freezed_annotation.dart';

part 'absence_state.freezed.dart';

@freezed
class AbsenceState<T> with _$AbsenceState<T> {
  const factory AbsenceState.initial() = _Initial;
  const factory AbsenceState.loading() = Loading;
  const factory AbsenceState.success(T data) = Success<T>;
  const factory AbsenceState.error({
    required String error,
  }) = Error;
}
