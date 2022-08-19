

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MusicTrackData {
  //Api A
 Future <dynamic> getDataA() async{
   try{
     var url = Uri.parse("https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");
     var res = await http.get(url);
     var data = jsonDecode(res.body);
     return data['message']['body']['track_list'] ;
   }
   catch (err){
     return err;
   }

  }
  // Api B
 Future <dynamic> getDataB(int  TRACK_ID) async{
   
   try{
     var url = Uri.parse("https://api.musixmatch.com/ws/1.1/track.get?track_id=${TRACK_ID}&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");
     var res = await http.get(url);
     var data = jsonDecode(res.body);
     return data;
   }
   catch(err){
     return null;
   }

   
 }
 // Api C
 Future <dynamic> getDataC(int TRACK_ID) async{
   try{
     var url = Uri.parse("https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=${TRACK_ID}&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");
      var res =await http.get(url);
      var data = jsonDecode(res.body);
      return data;
   }
   catch(err){
     return null;
   }
 }
}