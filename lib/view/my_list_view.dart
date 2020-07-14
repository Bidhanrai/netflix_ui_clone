import 'package:flutter/material.dart';
import 'package:netflix_clone/constants.dart';
import 'package:netflix_clone/data.dart';
import 'package:netflix_clone/widget/menu.dart';

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        backgroundColor: Constants.backgroundColor,
        leading: Image.asset('assets/netflix.png', scale: 15,),
        title: Hero(
          tag: 'My List',
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){
                HelperFunctions().showOptionMenu(context, 3);
              },
              child: Wrap(
                spacing: 6,
                children: [
                  Text('My List',
                    style: TextStyle(color: Constants.textColorHighlight, fontWeight: FontWeight.w400,letterSpacing: 1.5, fontSize: 18),),
                  Icon(Icons.arrow_drop_down, color: Colors.white,),
                ],
              ),
            ),
          ),
        ),
      ),

      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8, childAspectRatio: 0.7),
        itemCount: MovieData.movieList.length,
        itemBuilder: (context, index){
          return Image.asset(MovieData.movieList[index].url,fit: BoxFit.cover,);
      },)
    );
  }
}
