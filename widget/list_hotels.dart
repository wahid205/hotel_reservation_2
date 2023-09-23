import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/data.dart';

import 'hotel.dart';

class HotelListScreen extends StatefulWidget {
  @override
  _HotelListScreenState createState() => _HotelListScreenState();
}

class _HotelListScreenState extends State<HotelListScreen> {
  late Future<List<HotelData>> futureHotels;
  final HotelData hotel = HotelData();
  @override
  void initState() {
    super.initState();
    futureHotels = hotel.fetchHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel List'),
      ),
      body: FutureBuilder<List<HotelData>>(
        future: futureHotels,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final hotels = snapshot.data!;
            return ListView.builder(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                return HotelWidget(hotel: hotels[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
