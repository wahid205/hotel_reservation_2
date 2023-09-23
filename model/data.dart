import 'package:flutter/cupertino.dart';
  import 'dart:convert';
import 'package:http/http.dart' as http;

class HotelData extends ChangeNotifier {
  String? hotelName;
  String? hotelImage;
  String? hotelBrief;
  String? details;
  String? roomName;
  int? price = 100;
  double singleRooms = 0;
  double doubleRooms = 0;
  double totalRooms = 0;
  double totalPrice = 0;
  List? rooms = [1,2,3,4,5,6,7];
  HotelData({
    this.hotelBrief,
    this.hotelImage,
    this.hotelName,
    this.details,
    this.roomName,
    this.price,
    this.rooms,
  });
  List<HotelData> hotels = [
    HotelData(
      hotelBrief: 'hotelBrief',
      hotelImage:
          'https://th.bing.com/th/id/OIP.EY_ZEoRXJ7jq1M-0-CyTewHaE7?pid=ImgDet&rs=1',
      hotelName: 'hotelName',
      details: 'details',
      price: 77,
      roomName: 'room name',
      rooms: [1,2,3,4,5,6,7,8,9],
    ),
    HotelData(
      hotelBrief: 'hotelBrief',
      hotelImage:
          'https://th.bing.com/th/id/OIP.B-aNkpY6QYijy_-Fqqx_5wHaE-?pid=ImgDet&rs=1',
      hotelName: 'hotelName',
      details: 'mmmmmmmmmmmm',
      price: 88,
      roomName: 'mmmmmmmmmmm',
      rooms: [1,2,3,4,5,6,],
    ),
  ];
  low() {
    price = price! - 100;
    notifyListeners();
  }

  high() {
    price = price! - 100;
    notifyListeners();
  }


Future<List<HotelData>> fetchHotels() async {
  final response = await http.get(Uri.parse('https://api.makcorps.com/free/london'));
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => HotelData(
      hotelName: json['name'],
      hotelBrief: json['description'],
        hotelImage: json['image_url'],
    )).toList();
  } else {
    throw Exception('Failed to fetch hotels');
  }
}
}
