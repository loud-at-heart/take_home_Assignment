part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class GetDataEvent extends NewsEvent {}

class GetCommentsEvent extends NewsEvent {
  GetCommentsEvent({required this.model});

  final NewsModel model;
}
