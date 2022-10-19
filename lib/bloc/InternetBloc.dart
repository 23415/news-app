import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/event.dart';
import 'package:news_app/bloc/state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  late StreamSubscription? connectivitySubscription;
  InternetBloc() : super(InitialState()) {
    on<InternetLostEvent>((event, emit) {
      emit(InternetLostState());
    });
    on<InternetGetEvent>((event, emit) {
      emit(InternetGainedState());
    });

    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGetEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
