import 'package:flutter/material.dart';
import 'package:relu_inter/Services/Data.dart';

class DetailedTrack extends StatefulWidget {

  final int Trackid;

  DetailedTrack({
    required this.Trackid
});
  @override
  _DetailedTrackState createState() => _DetailedTrackState();
}

class _DetailedTrackState extends State<DetailedTrack> {
    var ApiB;
    var ApiC;


  void Data () async{
    var DataApiB = await MusicTrackData().getDataB(widget.Trackid);
    var DataApiC = await MusicTrackData ().getDataC(widget.Trackid);
    setState(() {
      ApiC=DataApiC;
      ApiB=DataApiB;

    });
    print(ApiB['message']);
    // print(ApiC['message']['body']['lyrics']['lyrics_body']);
  }

  @override
  void initState() {
    // TODO: implement initState
    Data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body:ApiC==null?Center(child: CircularProgressIndicator()):  Container(
          padding: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Name",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  SizedBox(height: 2,),
                  Text("${ApiB['message']['body']['track']['album_name']}"),
                  SizedBox(height: 10,),
//Artist
                  Text("Artist",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  Text("${ApiB['message']['body']['track']['artist_name']}"),
                  SizedBox(height: 10,),
//Album Name
                  Text("Album Name",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  Text("${ApiB['message']['body']['track']['album_name']}"),
                  SizedBox(height: 10,),
//Explicit
                  Text("Explicit",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  Text("${ApiB['message']['body']['track']['explicit']}"),
                  SizedBox(height: 10,),
// Rating
                  Text("Rating",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  Text("${ApiB['message']['body']['track']['track_rating']}"),
                  SizedBox(height: 10,),

// Lyrics
                  Text("Lyrics",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10,),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Row(
                          children: [
                            Flexible(child:
                            Text("${ApiC['message']['body']['lyrics']['lyrics_body']}",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20
                              ),)),
                          ],
                        ),
                      ),
                    ),
                  )

                ]
            ),
          ),
        ));
  }
}






