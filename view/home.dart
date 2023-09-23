import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widget/list_hotels.dart';

import '../model/data.dart';
import '../widget/details.dart';
import '../widget/hotellist.dart';

class Home extends StatelessWidget {
  Home({super.key});

  HotelData hotelsData = HotelData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Reservation'),
        backgroundColor: Colors.purple,
      ),
      body:HotelListScreen(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: Colors.white10,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: "Heart"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: "Person"),
        ],
      ),
    );
  }
}
