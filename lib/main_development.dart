import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:transporter/app/app.dart';
import 'package:transporter/bootstrap.dart';
import 'package:transporter/data/models/authentication/user.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/helpers/config.dart';
import 'package:transporter/values/constants.dart';

void main() async {
  const channel = MethodChannel(Constants.channelName);

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  final userBox = await Hive.openBox<User>(Constants.userBox);
  final settingsBox = await Hive.openBox<String>(Constants.settingsBox);

  final userRepository =
      UserRepository(userBox: userBox, settingsBox: settingsBox);

  await bootstrap(
    () => App(
      userRepository: userRepository,
    ),
  );
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final apiKey = Config.googleApiKeyOverride;
    channel.invokeMethod('setApiKey', apiKey);
  });
}
