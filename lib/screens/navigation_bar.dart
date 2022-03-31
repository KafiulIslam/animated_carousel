import 'package:flutter/material.dart';
import 'package:flutter_animation/constant/constant_page.dart';
import 'package:flutter_animation/constant/number_ratio.dart';
import 'package:flutter_animation/screens/home_page.dart';


class NavigationBoard extends StatefulWidget {
  const NavigationBoard({Key? key}) : super(key: key);

  @override
  _NavigationBoardState createState() => _NavigationBoardState();
}

class _NavigationBoardState extends State<NavigationBoard> {


  int _selectedIndex = 0 ;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  List<Widget> navigationItem = const [

    MyHomePage(),
    MyHomePage(),
    MyHomePage(),

  ];

  @override
  Widget build(BuildContext context) {


    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;


    return SafeArea(
      child: Scaffold(

        body: navigationItem.elementAt(_selectedIndex),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: white,
          elevation: 0,
          items:   <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                  height:  height/fiftyPixelRatioH,
                  width: width/fiftyPixelRatioW ,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: _selectedIndex == 0 ? blackColor : Colors.transparent,
                  ),
                  child: const Icon(Icons.home)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  height:  height/fiftyPixelRatioH,
                  width: width/fiftyPixelRatioW ,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: _selectedIndex == 1 ? blackColor : Colors.transparent,
                  ),
                  child: const Icon(Icons.business)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  height:  height/fiftyPixelRatioH,
                  width: width/fiftyPixelRatioW ,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: _selectedIndex == 2 ? blackColor : Colors.transparent,
                  ),
                  child: const Icon(Icons.music_note)),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: white,
          unselectedItemColor: blackColor,
          onTap: _onItemTapped,
        ),
      )
      );

  }
}
