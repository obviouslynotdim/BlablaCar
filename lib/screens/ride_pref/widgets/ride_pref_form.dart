import 'package:blabla/theme/theme.dart';
import 'package:blabla/widgets/bla_button.dart';
import 'package:flutter/material.dart';

import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;



  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
    if (widget.initRidePref != null) {
      departure = widget.initRidePref!.departure;
      arrival = widget.initRidePref!.arrival;
      departureDate = widget.initRidePref!.departureDate;
      requestedSeats = widget.initRidePref!.requestedSeats;
    } else {
      // Default values if no preference exists
      departure = null;
      arrival = null;
      departureDate = DateTime.now();
      requestedSeats = 1;
    }
  }  

  // ----------------------------------
  // Handle events
  // ----------------------------------


  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------


  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      
        const SizedBox(height: BlaSpacings.m),
        BlaButton(
          label: "Search",
          type: BlaButtonType.primary,
          onPressed: () {
            if (departure != null && arrival != null) {
              print("Searching from ${departure!.name} to ${arrival!.name}");
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please select both departure and arrival locations.")),
              );
            }
          },
        ),
      ],
    );
  }
}
