import 'package:flutter/material.dart';
import 'package:netflix_clone/constants.dart';
import 'package:netflix_clone/data.dart';
import 'package:netflix_clone/view/movies_view.dart';
import 'package:netflix_clone/view/my_list_view.dart';
import 'package:netflix_clone/view/tv_shows_view.dart';
import 'package:netflix_clone/widget/bullet.dart';
import 'package:netflix_clone/widget/movie_widget.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.transparent,
          leading: Image.asset('assets/netflix.png', scale: 15,),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TvShowsView()));
                },
                child: navWidget('TV Shows'),
              ),
              InkWell(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>MoviesView())),
                child: navWidget('Movies'),
              ),
              InkWell(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>MyListView())),
                child: navWidget('My List'),
              ),
            ],
          ),
        ),

        SliverList(delegate: SliverChildListDelegate(<Widget>[
          Column(
            children: [
              SizedBox(height: Constants.height,),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/aquaman.jpg', height: MediaQuery.of(context).size.height*0.65,fit: BoxFit.contain,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.65,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black87],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        tileMode: TileMode.repeated
                      )
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    child: Column(
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10,
                          children: [
                            Text('Heartfelt', style: TextStyle(fontSize: 12, color: Constants.textColorHighlight),),
                            Bullet(color: Colors.pink,size: Size(4, 4),),
                            Text('Emotional', style: TextStyle(fontSize: 12, color: Constants.textColorHighlight),),
                            Bullet(color: Colors.pink,size: Size(4, 4),),
                            Text('Comedy', style: TextStyle(fontSize: 12, color: Constants.textColorHighlight),),
                            Bullet(color: Colors.pink,size: Size(4, 4),),
                            Text('Drama', style: TextStyle(fontSize: 12, color: Constants.textColorHighlight),),
                            Bullet(color: Colors.pink,size: Size(4, 4),),
                            Text('Breakup', style: TextStyle(fontSize: 12, color: Constants.textColorHighlight),),
                          ],
                        ),

                        SizedBox(height: Constants.height,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.add, color: Colors.white,),
                                Text('My List', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),)
                              ],
                            ),
                            SizedBox(width: 50,),
                            FlatButton.icon(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)
                              ),
                              color: Colors.white,
                              onPressed: (){},
                              icon: Icon(Icons.info_outline),
                              label: Text('Info', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                            ),
                            SizedBox(width: 50,),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.play_arrow, color: Colors.white,),
                                Text('Play', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),)
                              ],
                            ),

                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),

            ],
          )
        ],),),

        //movie preview
        SliverList(delegate: SliverChildListDelegate(<Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Constants.height,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Previews',
                  style: TextStyle(color: Constants.textColorHighlight, fontWeight: FontWeight.bold, fontSize: 20),),
              ),
              SizedBox(height: 4,),
              SizedBox(
                height: 104,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: MovieData.movieList.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Constants.textColor,
                        child: CircleAvatar(
                          radius: 48,
                          backgroundImage: AssetImage(MovieData.movieList[index].url,),
                        ),
                      ),
                    );},
                ),
              ),
            ],
          ),
        ]),),

        //movie lists
        SliverList(delegate: SliverChildListDelegate(<Widget>[
          SizedBox(height: Constants.height+10,),

          MovieWidget(title: 'Criminal Investigation TV Shows',),

          SizedBox(height: Constants.height,),

          MovieWidget(title: 'Trending Now',),

          SizedBox(height: Constants.height,),

          MovieWidget(title: 'Hindi-Language TV Shows',),

          SizedBox(height: Constants.height,),

          MovieWidget(title: 'popular on Netflix',),

          SizedBox(height: Constants.height,),

          MovieWidget(title: 'Romantic Movies',),

        ]),),
      ],
    );
  }

  Widget navWidget(String title) {
    return Hero(
      tag: title,
      child: Material(
        color: Colors.transparent,
        child: Text(title,
          style: TextStyle(color: Constants.textColorHighlight, fontWeight: FontWeight.w400,letterSpacing: 1.5, fontSize: 16),),
      ),
    );
  }
}
