import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relu_inter/Bloc/track/track_Bloc.dart';
import 'package:relu_inter/Bloc/track/track_event.dart';
import 'package:relu_inter/Bloc/track/track_states.dart';

import 'package:relu_inter/Services/Data.dart';
import 'package:equatable/equatable.dart';
import 'package:relu_inter/utilis/Track_Container.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Trending")),
      ),
      body: BlocConsumer<TrackBloc, TrackStates>(
        listener: (context, state) {
          if(state is InterneLostState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Check Network"),backgroundColor: Colors.red,),
            );
          }
          else if(state is InternetGainedState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Connected"),backgroundColor: Colors.green,),
            );

          }
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is InterneLostState){
            return Center(
              child: Text("Check Your Network "),
            );
          }
          if(state is TrackInitialState ){ // We are in initial state
            context.read<TrackBloc>().add(LoadingTrackData());

            return Center(child: CircularProgressIndicator());
          }
          // If the data is loading
          else if (state is TrackLoadingState ){
            return Center(child: CircularProgressIndicator());
          }
          else if (state is TrackLoadedState ){
            var data = state.ApiData;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: track_Contanier(
                              artist_name: data[index]['track']['artist_name'],
                              track_name:data[index]['track']['track_name'],
                              track_album_name:data[index]['track']['album_name'] ,
                              track_id :data[index]['track']['track_id']
                          ),
                        );
                      }),
                )
              ],
            );
          }
          else if( state is TrackErrorOccuredState){}
          return Text("Some Error Occured");
        },
      ),
    );
  }
}






