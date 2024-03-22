import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:take_home_assignment/models/gif_model.dart';
import 'package:take_home_assignment/modules/home/repository/home_repository.dart';
import 'package:take_home_assignment/utils/utils.dart';
import 'package:take_home_assignment/webservice/data_load_result.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<InitHomePageEvent>(_handleInitHomePage);
    on<SearchGifEvent>(_handleSearchGifEvent);
    on<LoadNextDataEvent>(_handleLoadNextDataEvent);
    on<StartLoadingEvent>(_handleStartLoadingEvent);
  }

  final HomeRepository homeRepository;

  GifModelList? _dataList;
  GifModelList? _searchedDataList;
  int _offset =0;

  Future<void> _handleInitHomePage(
    InitHomePageEvent event,
    Emitter<HomeState> emit,
  ) async {
    final _response = await homeRepository.requestData();
    _dataList = _response.data as GifModelList;
    if (_response.isSuccessful()) {
      emit(ShowAllTrendingGifState(_dataList));
    } else {
      _handleErrorState(_response, emit);
    }
  }
  Future<void> _handleSearchGifEvent(SearchGifEvent event, Emitter<HomeState> emit,) async {
    if(!isNullOrEmpty(event.query)){
      _offset =0;
      _searchedDataList = [];
      final _response =
          await homeRepository.searchData(query: event.query ?? '');
    _searchedDataList = _response.data as GifModelList;
      if (_response.isSuccessful()) {
        emit(ShowAllTrendingGifState(_searchedDataList));
      } else {
        _handleErrorState(_response, emit);
      }
    }else{
      emit(ShowAllTrendingGifState(_dataList));
    }
  }
  Stream<HomeState> _handleErrorState(
      DataLoadResult result,
      Emitter<HomeState> emit,
      ) async* {
    if (result.error == LoadingError.NO_CONNECTION) {
      emit(NoInternetState());
    } else {
      emit(RequestFailedWithMessageState(errorMessage: result.errorMessage!));
    }
  }

  Future<void> _handleStartLoadingEvent(StartLoadingEvent event, Emitter<HomeState> emit,) async {
    emit(LoadingState());
  }

  Future<void> _handleLoadNextDataEvent(LoadNextDataEvent event, Emitter<HomeState> emit,) async {
    if(isNullOrEmpty(event.query)){
      final _response = await homeRepository.requestData();
      _dataList?.data = [...?_dataList?.data,...?(_response.data as GifModelList).data];
      if (_response.isSuccessful()) {
        emit(ShowAllTrendingGifState(_dataList));
      } else {
        _handleErrorState(_response, emit);
      }
    }else{
      final _response =
      await homeRepository.searchData(query: event.query ?? '');
      _searchedDataList = _response.data as GifModelList;
      if (_response.isSuccessful()) {
        emit(ShowAllTrendingGifState(_searchedDataList));
      } else {
        _handleErrorState(_response, emit);
      }
    }
  }
}
