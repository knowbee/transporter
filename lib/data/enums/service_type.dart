import 'package:transporter/generated/l10n.dart';

enum ServiceType {
  transport,
  delivery,
}

extension StringFromTitle on ServiceType {
  String get getStringFromServiceType {
    switch (this) {
      case ServiceType.transport:
        return Strings.current.home_transport_button_heading;
      case ServiceType.delivery:
        return Strings.current.home_delivery_button_heading;
    }
  }
}
