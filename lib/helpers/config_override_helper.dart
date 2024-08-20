import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:transporter/data/models/config/config_override.dart';
import 'package:transporter/helpers/config.dart';

abstract class ConfigOverrideHelper {
  static String overrideConfigPath = 'assets/data/config-override.json';

  static Future<void> init() async {
    // Find if there is a config override json
    final configOverride = await _loadFile();

    // Set the config override if there is one
    if (configOverride != null) {
      Config.setOverride(configOverride);
      if (kDebugMode) {
        print('Using override file: $overrideConfigPath');
      }
    } else {
      if (kDebugMode) {
        print('Override file not loaded');
      }
    }
  }

  static Future<ConfigOverride?> _loadFile() async {
    try {
      var response = await rootBundle.loadString(overrideConfigPath);

      // Remove comments from file
      response = response.replaceAll(RegExp(' +// .+\n'), '');
      // Remove the last trailing comma
      response = response.replaceAll(RegExp(',\n}'), '\n}');

      return ConfigOverride.fromJson(
        json.decode(response) as Map<String, dynamic>,
      );
    } catch (e) {
      return null;
    }
  }
}
