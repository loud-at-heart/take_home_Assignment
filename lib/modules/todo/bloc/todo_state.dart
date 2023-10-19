part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class NoInternetState extends TodoState {}

class RequestFailedWithMessageState extends TodoState {
  RequestFailedWithMessageState({this.errorMessage});

  final String? errorMessage;
}

class DataFetchedState extends TodoState {
  DataFetchedState({this.modelList});

  final List<TodoModel>? modelList;
}
