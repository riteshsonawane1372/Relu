import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relu_inter/Bloc/track/track_event.dart';
import 'package:relu_inter/Bloc/track/track_states.dart';
import 'package:relu_inter/Services/Data.dart';

class TrackBloc extends Bloc<TrackEvents,TrackStates> {

  Connectivity _connectivity =Connectivity();

  TrackBloc() :super(TrackInitialState()){

    on<InternetLostEvent> ((event, emit) => InterneLostState());
    on<InternetGainedEvent> ((event, emit) => InternetGainedState());

    _connectivity.onConnectivityChanged.listen((event) {
      if(event==ConnectivityResult.wifi || event ==ConnectivityResult.mobile) add(InternetGainedEvent());
      else add(InternetLostEvent());
    });

    // ignore: void_checks
    on <TrackEvents> ((event, emit) async{
      if(event is LoadingTrackData){
        // Before calling the Api we need to emit the load state
        emit(TrackLoadingState());

        List data= await MusicTrackData().getDataA();

        if(data.isEmpty){
          Center(child: CircularProgressIndicator());
          emit(TrackErrorOccuredState());
        }
        else{ // Means Data is loaded
          emit (TrackLoadedState(ApiData: data));

        }
        CircularProgressIndicator();
      }
    });

  }
}

