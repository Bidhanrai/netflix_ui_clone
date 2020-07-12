import 'package:flutter/material.dart';
import 'package:netflix_clone/constants.dart';
import 'package:netflix_clone/view/coming_soon_view.dart';
import 'package:netflix_clone/view/download_view.dart';
import 'package:netflix_clone/view/home_view.dart';
import 'package:netflix_clone/view/more_view.dart';
import 'package:netflix_clone/view/search_view.dart';

class BottomNavigationView extends StatefulWidget {
  @override
  _BottomNavigationViewState createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {

  int _currentPage = 0;
  final _pages =[
    HomeView(),
    SearchView(),
    ComingSoonView(),
    DownloadView(),
    MoreView()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: _pages[_currentPage],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.black87,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: bottomNavigationItem('Home', Icons.home, 0)),
            Expanded(child: bottomNavigationItem('Search', Icons.search, 1)),
            Expanded(child: bottomNavigationItem('Coming Soon', Icons.video_library, 2)),
            Expanded(child: bottomNavigationItem('Download', Icons.file_download, 3)),
            Expanded(child: bottomNavigationItem('More', Icons.menu, 4)),
          ],
        ),
      ),
    );
  }

  Widget bottomNavigationItem(String label, IconData icon, int _selectedPage){
    return InkWell(
      onTap: (){
        if(_currentPage!=_selectedPage){
          setState(() {
            _currentPage = _selectedPage;
          });
        }

      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: _currentPage==_selectedPage?Constants.textColorHighlight:Constants.textColor,),
          SizedBox(height: 2,),
          Text(label,
            style: TextStyle(fontSize: 10, color: _currentPage==_selectedPage?Constants.textColorHighlight:Constants.textColor, fontWeight: FontWeight.w300),)
        ],
      ),
    );
  }
}
