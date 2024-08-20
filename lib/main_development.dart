import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transporter/app/app.dart';
import 'package:transporter/bootstrap.dart';
import 'package:transporter/helpers/config.dart';

void main() {
  const channel = MethodChannel('com.knowbee.transporter/environment');

  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final apiKey = Config.googleApiKeyOverride;
    channel.invokeMethod('setApiKey', apiKey);
  });
}
