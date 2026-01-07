import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/scan/data/models/scan_request_body.dart';
import 'package:universe/features/scan/data/repos/scan_repo.dart';
import 'package:universe/features/scan/logic/scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit(this._scanRepo) : super(const ScanState.initial());

  final ScanRepo _scanRepo;

  Future<void> scan(String qrCodeId) async {
    emit(const ScanState.loading());

    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    final response = await _scanRepo.scan(
      ScanRequestBody(qrCodeId: qrCodeId),
      token,
    );

    response.when(
      success: (scanResponse) {
        emit(ScanState.success(scanResponse));
      },
      failure: (errorHandler) {
        emit(ScanState.error(error: errorHandler.serverFailure.errmessage));
      },
    );
  }
}
