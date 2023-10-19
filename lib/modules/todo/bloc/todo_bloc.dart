import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:take_home_assignment/models/todo_model.dart';
import 'package:take_home_assignment/modules/todo/data/todo_repository.dart';
import 'package:take_home_assignment/webservice/data_load_result.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({required this.todoRepository}) : super(TodoInitial()) {
    on<GetTodoDataEvent>(_handleGetDataEvent);
    on<DeleteTodoDataEvent>(_handleDeleteTodoDataEvent);
    on<AddTodoDataEvent>(_handleAddTodoDataEvent);
  }

  final TodoRepository todoRepository;

  TodoModelList? todoRes;

  Future<void> _handleGetDataEvent(
    GetTodoDataEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      var todoResponse = await todoRepository.requestData();
      if (todoResponse.isSuccessful()) {
        todoRes = todoResponse.data as TodoModelList?;
        emit(DataFetchedState(modelList: todoRes?.todoModelList));
      } else {
        _handleErrorState(todoResponse, emit);
      }
    } catch (_) {
      emit(RequestFailedWithMessageState(
          errorMessage: "Something went wrong ..."));
    }
  }

  Stream<TodoState> _handleErrorState(
    DataLoadResult result,
    Emitter<TodoState> emit,
  ) async* {
    if (result.error == LoadingError.NO_CONNECTION) {
      emit(NoInternetState());
    } else {
      emit(RequestFailedWithMessageState(errorMessage: result.errorMessage!));
    }
  }

  Future<void> _handleDeleteTodoDataEvent(DeleteTodoDataEvent event, Emitter<TodoState> emit,) async {
    todoRes?.todoModelList?.removeWhere((element) => element.id == event.deletedItem?.id);
    emit(DataFetchedState(modelList: todoRes?.todoModelList));
  }

  Future<void> _handleAddTodoDataEvent(AddTodoDataEvent event, Emitter<TodoState> emit) async {
    todoRes?.todoModelList?.add(event.item ?? TodoModel());
    emit(DataFetchedState(modelList: todoRes?.todoModelList));
  }
}
