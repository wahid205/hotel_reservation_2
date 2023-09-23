import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/data.dart';

class HotelWidget extends StatelessWidget {
  final HotelData hotel;

  HotelWidget({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(hotel.hotelImage!),
      title: Text(hotel.hotelName!),
      subtitle: Text(hotel.hotelBrief!),
    );
  }
}