import 'package:flutter/material.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../services/rides_service.dart';

class RidesScreen extends StatefulWidget {
  final RidePref initialRidePref;

  const RidesScreen({super.key, required this.initialRidePref});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  @override
  Widget build(BuildContext context) {
    // This calls the filtering logic i built in BLA-001
    final List<Ride> matchingRides = RidesService.filterBy(
      departure: widget.initialRidePref.departure,
      arrival: widget.initialRidePref.arrival,
      seatRequested: widget.initialRidePref.requestedSeats,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.initialRidePref.departure.name} → ${widget.initialRidePref.arrival.name}",
        ),
      ),
      body: matchingRides.isEmpty
          ? const Center(child: Text("No rides found."))
          : ListView.builder(
              itemCount: matchingRides.length,
              itemBuilder: (ctx, index) => ListTile(
                title: Text("Driver: ${matchingRides[index].driver.firstName}"),
                subtitle: Text("Price: ${matchingRides[index].pricePerSeat}\$"),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
    );
  }
}
