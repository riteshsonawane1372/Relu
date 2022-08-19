
 abstract class TrackStates{}

 class TrackInitialState extends TrackStates{}

 class TrackLoadingState extends TrackStates {}

 class TrackLoadedState extends TrackStates{
  // Loaded state will have some data
   final List ApiData;
   TrackLoadedState({
     required this.ApiData
 });
 }

 // Error Handling

 class TrackErrorOccuredState extends TrackStates {}


 // Internet State

 class InternetGainedState extends TrackStates{}

 class InterneLostState extends TrackStates{}