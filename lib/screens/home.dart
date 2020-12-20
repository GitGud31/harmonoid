import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:animations/animations.dart';

import 'package:harmonoid/screens/collection/collectionmusic.dart';
import 'package:harmonoid/screens/nowplaying.dart';
import 'package:harmonoid/constants/constants.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key : key);
  HomeState createState() => HomeState();
}


class HomeState extends State<Home> with TickerProviderStateMixin {
  int _index = 1;

  @override
  Widget build(BuildContext context) {

    final List<Widget> screens = <Widget>[
      Center(
        child: Text('Coming Soon...')
      ),
      Navigator(
        initialRoute: 'collectionMusic',
        onGenerateRoute: (RouteSettings routeSettings) {
          Route<dynamic> route;
          if (routeSettings.name == 'collectionMusic') {
            route = new MaterialPageRoute(builder: (BuildContext context) => CollectionMusic());
          }
          if (routeSettings.name == 'collectionMusicSearch') {
            route = new PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 400),
              reverseTransitionDuration: Duration(milliseconds: 400),
              transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              ),
              pageBuilder: (context, animation, secondaryAnimation) => CollectionMusicSearch(),
            );
          }
          return route;
        },
      ),
    ];

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: screens[this._index],
          ),
          NowPlaying(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._index,
        onTap: (int index) => this.setState(() => this._index = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.image_search),
            label: Constants.STRING_DISCOVER,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: Constants.STRING_COLLECTION,
          ),
        ],
      ),
    );
  }
}