import 'package:flutter/material.dart';
import 'package:netflix_clone/constants.dart';
import 'package:netflix_clone/data.dart';
import 'package:netflix_clone/view/more_view.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  FocusNode searchTextFocus = new FocusNode();

  double marginValue = 0;
  double heightContainer = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          height: heightContainer,
          margin: EdgeInsets.all(marginValue),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Constants.lightGrey
          ),
          duration: Duration(milliseconds: 200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(Icons.search, color: Colors.white38,),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for a show, movie, genre,...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white24),
                  ),
                  focusNode: searchTextFocus,
                  onTap: (){
                    setState(() {
                      if(searchTextFocus.hasFocus){
                        FocusScope.of(context).unfocus();
                        marginValue = 6;
                        heightContainer = 46;
                      }else{
                        marginValue=0;
                        heightContainer = 50;
                      }

                    });
                  },
                  cursorColor: Colors.white,
                ),
              ),
              IconButton(
                icon: Icon(Icons.mic, color: Colors.white38),
                onPressed: (){},
              )

            ],
          ),
        ),
        
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverList(delegate: SliverChildListDelegate(<Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
                  child: Text('Popular Searches',
                    style: TextStyle(color: Constants.textColorHighlight, fontWeight: FontWeight.bold, fontSize: 18),),
                ),
              ],),),

              SliverList(delegate: SliverChildBuilderDelegate((context, index){
                return Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  color: Colors.grey[900],
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: Image.asset(MovieData.movieList[index].url, width: 100,fit: BoxFit.cover,),
                    title: Text(MovieData.movieList[index].movie, style: TextStyle(color: Constants.textColorHighlight),),
                    trailing: IconButton(icon: Icon(Icons.play_arrow, color: Constants.textColorHighlight,),),
                  ),
                );
              },childCount: MovieData.movieList.length),)
            ],
          ),
        )
      ],
    );
  }
}
