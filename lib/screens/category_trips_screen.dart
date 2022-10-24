import 'package:flutter/material.dart';
import 'package:travellingapp/app_data.dart';

import '../models/trip.dart';
import '../trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoryTripsScreen(
      {super.key, required this.categoryId, required this.categoryTitle});

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;

  @override
  void initState() {
    displayTrips =
        Trips_data.where((trip) => trip.categories.contains(widget.categoryId))
            .toList();
    // TODO: implement initState
    print('display trips count is + ${displayTrips.length}');

    super.initState();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
      print(
          'after removetrip the display trip count is + ${displayTrips.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            removeItem: _removeTrip,
          );
        },
        itemCount: displayTrips.length,
      ),
    );
  }
}
