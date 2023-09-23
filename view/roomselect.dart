import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/reservationsummary.dart';

import 'package:provider/provider.dart';

import '../model/data.dart';
import '../model/datamanage.dart';

class RoomSelection extends StatefulWidget {
  RoomSelection({super.key, required this.index});
  int index;

  @override
  // ignore: library_private_types_in_public_api
  _RoomSelectionState createState() => _RoomSelectionState();
}

class _RoomSelectionState extends State<RoomSelection> {
  @override
  Widget build(BuildContext context) {
    final classInstancee = Provider.of<HotelData>(context);
    final dataManage = Provider.of<DataManagement>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Selection'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListTile(
                title: const Text('Single Rooms'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (classInstancee.singleRooms > 0) {
                            classInstancee.singleRooms--;
                            classInstancee.totalRooms--;
                            classInstancee.low();
                          }
                        });
                      },
                    ),
                    Text('${classInstancee.totalRooms}'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          classInstancee.singleRooms++;
                          classInstancee.totalRooms++;
                          classInstancee.high();
                        });
                      },
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text('Double Rooms'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (classInstancee.doubleRooms > 0) {
                            classInstancee.doubleRooms--;
                            classInstancee.totalRooms--;
                            classInstancee.low();
                          }
                        });
                      },
                    ),
                    Text('${classInstancee.totalRooms}'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          classInstancee.doubleRooms++;
                          classInstancee.totalRooms++;
                          classInstancee.high();
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Total Rooms: ${classInstancee.totalRooms}',
                style:
                    const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                child: const Text('Proceed'),
                onPressed: () {
                  dataManage.add(
                      classInstancee.hotels[widget.index].hotelName,
                      classInstancee.totalRooms,
                      classInstancee.totalPrice,
                      classInstancee.hotels[widget.index].hotelImage);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReserveSummary()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
