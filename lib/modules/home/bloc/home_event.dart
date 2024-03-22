part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class InitHomePageEvent extends HomeEvent {}
class StartLoadingEvent extends HomeEvent {}
class LoadNextDataEvent extends HomeEvent {
  LoadNextDataEvent({this.query = ''});

  final String? query;
}

class SearchGifEvent extends HomeEvent {
  SearchGifEvent({required this.query});

  final String? query;
}
