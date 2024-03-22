part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class LoadingState extends HomeState {}

class NoInternetState extends HomeState {}

class RequestFailedWithMessageState extends HomeState {
  RequestFailedWithMessageState({required this.errorMessage});

  final String? errorMessage;
}

class ShowAllTrendingGifState extends HomeState {
  ShowAllTrendingGifState(this.data);

  final GifModelList? data;
}
