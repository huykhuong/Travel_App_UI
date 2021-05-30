import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/components/DestinationCarousel.dart';
import 'package:flutter_travel_ui_starter/components/HotelCarousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_travel_ui_starter/components/catalogueCircle.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentIndex = 0;

  List<IconData> icons = [
    FontAwesomeIcons.bed,
    FontAwesomeIcons.plane,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  //Function to build the catalogue Circles
  List<Widget> buildCatalogueCircles() {
    List<CatalougeCircle> catalogueList = [];
    for (int i = 0; i < icons.length; i++) {
      catalogueList.add(
        CatalougeCircle(
          icons[i],
          () {
            setState(() {
              _selectedIndex = i;
            });
          },
          _selectedIndex == i
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      );
    }
    return catalogueList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 100.0),
                child: Text(
                  'What would you like to find?',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: buildCatalogueCircles(),
              ),
              SizedBox(
                height: 20.0,
              ),
              DestinationCarousel(),
              SizedBox(
                height: 10.0,
              ),
              HotelCarousel(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_city,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: NetworkImage('https://ziclife.com/wp-content/uploads/2020/08/best-cute-avata-picture.jpg'),
            ),
            title: SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
