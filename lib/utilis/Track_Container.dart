import 'package:flutter/material.dart';
import 'package:relu_inter/Screens/detailed_Track.dart';


class track_Contanier extends StatelessWidget {

  final String track_name;
  final String artist_name;
  final String track_album_name;
  final int track_id;

  track_Contanier({
    required this.artist_name,
    required this.track_name,
    required this.track_album_name,
    required this.track_id
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailedTrack(Trackid:track_id ,)));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.maxFinite,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(80),
              bottomLeft: Radius.circular(80))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.library_music_sharp,size: 35,),
            // Music Name and album
            Container(
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${track_name}",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25
                    ),
                    maxLines: 1,
                  ),
                  Row(
                    children: [
                      Container(
                        width:120,
                          child: Text('\n ${track_album_name}',overflow: TextOverflow.ellipsis,maxLines: 2,)
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Singer Name
            Flexible(
                child: Container(
                    width: 50,
                    child: Text("${artist_name}",
                      maxLines: 3,overflow: TextOverflow.ellipsis,))),
            Icon(Icons.arrow_forward_ios_rounded,size: 20,)

          ],
        ),
      ),
    );
  }
}