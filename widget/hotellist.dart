import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../model/data.dart';
import 'details.dart';

// ignore: must_be_immutable
class HotelList extends StatefulWidget {
  HotelList({super.key});
  @override
  State<HotelList> createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  HotelData hotelsData = HotelData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.grey)),
          child:  ListView.builder(
        itemCount: hotelsData.hotels.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: ClipRect(
                child: Stack(children: [
                  Image.network(
                    '${hotelsData.hotels[index].hotelImage}',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                  Positioned(
                    bottom: 30,
                    right: 20,
                    child: Text(
                      hotelsData.hotels[index].hotelName!,
                      style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Text(
                      hotelsData.hotels[index].hotelBrief!,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.favorite)),
                  )
                ]),
              ),
            ),
          );
        }),
      ),
    )),);
  }
}
