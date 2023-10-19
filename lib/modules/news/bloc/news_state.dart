part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class PopulateNewsDataState extends NewsState {
  PopulateNewsDataState(this.newsRes);

  final NewsModelList? newsRes;
}

class PopulateCommentsDataState extends NewsState {
  PopulateCommentsDataState(this.commentList);

  final CommentsModelList? commentList;
}

class NoInternetState extends NewsState {}

class RequestFailedWithMessageState extends NewsState {
  RequestFailedWithMessageState({this.errorMessage});

  final String? errorMessage;
}


