import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('###### onEvent:::: ######-> ${bloc.runtimeType}, $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('###### onTransition::::: ######-> ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint(
        '###### onError:::######-> ${bloc.runtimeType}, $error, $stackTrace');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('###### onClose:::######-> , $bloc');
  }
}
