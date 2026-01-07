import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/networking/server_result.dart';

import '../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  Future<void> fetchHomeData() async {
    emit(const HomeState.loading());

    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    if (token.isEmpty) {
      log('🏠 No token found');
      emit(const HomeState.error(error: 'No token found'));
      return;
    }

    final response = await _homeRepo.getHomeData(token);

    response.when(
      success: (homeData) {
        log('🏠 Home data: ${homeData.data.toJson()}');
        log('🏠 Success: emitting success state');
        emit(HomeState.success(homeData));
      },
      failure: (errorHandler) {
        log('🏠 Failure: ${errorHandler.serverFailure.errmessage}');
        emit(HomeState.error(error: errorHandler.serverFailure.errmessage));
      },
    );
  }

  Future<void> fetchHomeDataWithToken(String token) async {
    emit(const HomeState.loading());

    final response = await _homeRepo.getHomeData(token);

    response.when(
      success: (homeData) {
        log('🏠 Home data: ${homeData.data.toJson()}');
        emit(HomeState.success(homeData));
      },
      failure: (errorHandler) {
        emit(HomeState.error(error: errorHandler.serverFailure.errmessage));
      },
    );
  }
}
