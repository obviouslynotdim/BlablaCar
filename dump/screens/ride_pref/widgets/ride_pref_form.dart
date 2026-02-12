import '../../../theme/theme.dart';
import '../../../widgets/bla_button.dart';
import '../../../widgets/inputs/bla_input_row.dart';
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

  // Handle Switch
  void onSwitchLocations() {
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  void onDeparturePressed() {
    print("Open Location Picker for Departure");
  }

  void onArrivalPressed() {
    print("Open Location Picker for Arrival");
  }

  void onDatePressed() {
    print("Open Date Picker");
  }

  void onSeatsPressed() {
    print("Open Seat");
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  String get dateLabel {
    DateTime now = DateTime.now();
    bool isToday =
        departureDate.day == now.day &&
        departureDate.month == now.month &&
        departureDate.year == now.year;

    return isToday
        ? "Today"
        : "${departureDate.day}/${departureDate.month}/${departureDate.year}";
  }

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            color: BlaColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Departure Row n Switch Button
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  BlaInputRow(
                    icon: Icons.radio_button_unchecked,
                    label: departure?.name ?? "Leaving from",
                    onTap: onDeparturePressed,
                    isPlaceholder: departure == null,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: BlaSpacings.m),
                    child: IconButton(
                      onPressed: onSwitchLocations,
                      icon: Icon(
                        Icons.swap_vert,
                        color: BlaColors.primary,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),

              const Divider(height: 1, indent: 20, endIndent: 20),

              // Arrival Row
              BlaInputRow(
                icon: Icons.radio_button_unchecked,
                label: arrival?.name ?? "Going to",
                onTap: onArrivalPressed,
                isPlaceholder: arrival == null,
              ),

              const Divider(height: 1, indent: 20, endIndent: 20),

              // Date Row
              BlaInputRow(
                icon: Icons.calendar_month_outlined,
                label: dateLabel,
                onTap: onDatePressed,
              ),

              const Divider(height: 1, indent: 20, endIndent: 20),

              // Seats Row
              BlaInputRow(
                icon: Icons.person_outline,
                label: requestedSeats.toString(),
                onTap: onSeatsPressed,
              ),
            ],
          ),
        ),

        BlaButton(
          label: "Search",
          type: BlaButtonType.primary,
          onPressed: () {
            if (departure != null && arrival != null) {
              print("Searching from ${departure!.name} to ${arrival!.name}");
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please select both locations")),
              );
            }
          },
        ),
      ],
    );
  }
}
