import 'package:transporter/generated/l10n.dart';

enum ComplaintsTopics {
  vehicleArrivedLate,
  vehicleNotClean,
  vehicleHasMechanicalFault,
}

extension StringFromTitle on ComplaintsTopics {
  String get label {
    switch (this) {
      case ComplaintsTopics.vehicleArrivedLate:
        return Strings.current.complain_vehicle_arrived_late;
      case ComplaintsTopics.vehicleNotClean:
        return Strings.current.complain_vehicle_not_clean;
      case ComplaintsTopics.vehicleHasMechanicalFault:
        return Strings.current.complain_vehicle_has_mechanical_fault;
    }
  }
}
