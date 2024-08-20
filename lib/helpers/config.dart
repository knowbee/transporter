import 'package:flutter/foundation.dart';
import 'package:transporter/data/models/config/config_override.dart';

ConfigOverride? _override;

dynamic _getValue(dynamic overrideValue, dynamic environmentValue) {
  return kDebugMode ? overrideValue ?? environmentValue : environmentValue;
}

abstract class Config {
  static const _googleApiKey =
      String.fromEnvironment('DEFINE_GOOGLE_MAPS_API_KEY');

  static String? get googleApiKeyOverride => _getValue(
        _override?.DEFINE_GOOGLE_MAPS_API_KEY,
        _googleApiKey,
      ) as String?;
  // SET OVERRIDE
  static ConfigOverride? setOverride(ConfigOverride? value) =>
      _override = value;
}
