import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:take_home_assignment/models/listview_data.dart';
import 'package:take_home_assignment/modules/dashboard/data/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<GetDataEvent>(_handleGetDataEvent);
  }

  final HomeRepository homeRepository;

  Future<void> _handleGetDataEvent(GetDataEvent event, Emitter<HomeState> emit) async {
    emit(LoadingState());
    ListViewModel? listViewModel = await homeRepository.getListViewData();
    if(listViewModel != null){
      emit(DataState(listViewModel));
    }
  }
}
