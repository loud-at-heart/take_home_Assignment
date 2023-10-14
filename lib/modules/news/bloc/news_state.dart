part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class PopulateDataState extends NewsState {
  PopulateDataState(this.newsRes);

  final NewsModelList? newsRes;
}

class NoInternetState extends NewsState {}

class RequestFailedWithMessageState extends NewsState {
  RequestFailedWithMessageState({this.errorMessage});

  final String? errorMessage;
}


