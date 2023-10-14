import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:take_home_assignment/models/news_model.dart';
import 'package:take_home_assignment/modules/news/data/news_repository.dart';
import 'package:take_home_assignment/utils/utils.dart';
import 'package:take_home_assignment/webservice/data_load_result.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required this.newsRepository}) : super(NewsInitial()) {
    on<GetDataEvent>(_handleGetDataEvent);
  }

  final NewsRepository newsRepository;

  Future<void> _handleGetDataEvent(
    GetDataEvent event,
    Emitter<NewsState> emit,
  ) async {
    try{

        var newsResponse = await newsRepository.requestData();
        if (newsResponse.isSuccessful()) {
          var newsRes = newsResponse.data as NewsModelList?;
          emit(PopulateDataState(newsRes));
        } else {
          _handleErrorState(newsResponse, emit);
        }

    }catch(_){
      emit(RequestFailedWithMessageState(errorMessage: "Something went wrong ..."));
    }
  }

  Stream<NewsState> _handleErrorState(
      DataLoadResult result,
      Emitter<NewsState> emit,
      ) async* {
    if (result.error == LoadingError.NO_CONNECTION) {
      emit(NoInternetState());
    } else {
      emit(RequestFailedWithMessageState(errorMessage: result.errorMessage!));
    }
  }
}
