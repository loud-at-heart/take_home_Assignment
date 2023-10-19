part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class GetTodoDataEvent extends TodoEvent {}

class AddTodoDataEvent extends TodoEvent {
  AddTodoDataEvent({this.item});

  final TodoModel? item;
}

class DeleteTodoDataEvent extends TodoEvent {
  DeleteTodoDataEvent({required this.deletedItem});

  final TodoModel? deletedItem;
}