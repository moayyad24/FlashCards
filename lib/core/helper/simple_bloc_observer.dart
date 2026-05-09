import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cardy/core/helper/dependency_injection.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    logger.i('''
    🔄 BLOC STATE CHANGE
    Bloc: ${bloc.runtimeType}
    Current State: ${change.currentState.runtimeType}
    Next State: ${change.nextState.runtimeType}''');
  }

  @override
  void onClose(BlocBase bloc) {
    logger.w('''
    ⛔ BLOC CLOSED
    Bloc: ${bloc.runtimeType}''');
  }

  @override
  void onCreate(BlocBase bloc) {
    logger.i('''
    🆕 BLOC CREATED
    Bloc: ${bloc.runtimeType}
    Initial State: ${bloc.state.runtimeType}''');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.e(
      '''
    ❌ BLOC ERROR
    Bloc: ${bloc.runtimeType}
    Error: $error''',
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    logger.d('''
    🎫 BLOC EVENT
    Bloc: ${bloc.runtimeType}
    Event: ${event.runtimeType}
    $event''');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger.t('''
    🔄 BLOC TRANSITION
    Bloc: ${bloc.runtimeType}
    Event: ${transition.event.runtimeType}
    Current State: ${transition.currentState.runtimeType}
    Next State: ${transition.nextState.runtimeType}''');
  }

  @override
  void onDone(
    Bloc bloc,
    Object? event, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    logger.t('''
    ✅ BLOC DONE
    Bloc: ${bloc.runtimeType}
    Event: ${event?.runtimeType}
    Error: ${error?.toString() ?? 'None'}
    StackTrace: ${stackTrace ?? 'None'}''');
  }
}
