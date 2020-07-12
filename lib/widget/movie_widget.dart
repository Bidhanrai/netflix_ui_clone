import 'package:flutter/material.dart';
import 'package:netflix_clone/constants.dart';
import 'package:netflix_clone/data.dart';

class MovieWidget extends StatelessWidget {
  final String title;
  MovieWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(title,
            style: TextStyle(color: Constants.textColorHighlight, fontWeight: FontWeight.bold, fontSize: 20),),
        ),
        SizedBox(height: 4,),
        SizedBox(
          height: 150,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 2),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: MovieData.movieList.length,
            itemBuilder: (context, index){
              return Container(
                margin: const EdgeInsets.only(right: 10),
                child: Image.asset(MovieData.movieList[index].url, width: 100,fit: BoxFit.cover,),
              );},
          ),
        ),
      ],
    );
  }
}
