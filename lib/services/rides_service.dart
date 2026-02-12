import '../data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../model/ride/ride.dart';

class RidesService {
  static List<Ride> availableRides = fakeRides; // TODO for now fake data
  //
  //  filter the rides starting from given departure location
  //
  // flexlible filter for RideScreen
  static List<Ride> filterByDeparture(Location departure) {
    
    return availableRides
        .where((ride) => ride.departureLocation == departure).toList();
  }

  //
  //  filter the rides starting for the given requested seat number
  //
  static List<Ride> filterBySeatRequested(int requestedSeat) {
    return availableRides
        .where((ride) => ride.remainingSeats >= requestedSeat).toList();
  }

  //
  //  filter the rides   with several optional criteria (flexible filter options)
  //
  static List<Ride> filterBy({
    Location? departure, 
    Location? arrival,
    int? seatRequested
  }) {
    List<Ride> filteredRides = availableRides;

    if (departure != null) {
      filteredRides = filteredRides
          .where((ride) => ride.departureLocation == departure).toList();
    }

    if (arrival != null) {
      // arrival filtering logic
      filteredRides = filteredRides
          .where((ride) => ride.arrivalLocation == arrival).toList();
    }

    if (seatRequested != null) {
      filteredRides = filteredRides
          .where((ride) => ride.remainingSeats >= seatRequested).toList();
    }

    return filteredRides;
  }
}
