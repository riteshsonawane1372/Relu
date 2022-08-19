import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relu_inter/Bloc/track/track_Bloc.dart';
import 'package:relu_inter/Screens/HomeScreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>TrackBloc())
        ],
        child: MaterialApp(
          home: HomeScreen(),
        )
    );
  }
}



// BlocProvider(
// create: (context) => TrackBloc(),
// child: MaterialApp(
// debugShowCheckedModeBanner: false,
// home: HomeScreen(),
// ),
// )
