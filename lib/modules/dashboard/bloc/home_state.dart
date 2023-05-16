part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingState extends HomeState {}

class DataState extends HomeState {
  DataState(this.listViewModel);

  final ListViewModel listViewModel;
}
