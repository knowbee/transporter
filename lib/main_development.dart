import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:transporter/app/app.dart';
import 'package:transporter/bootstrap.dart';
import 'package:transporter/data/models/authentication/user.dart';
import 'package:transporter/data/models/complaint.dart';
import 'package:transporter/data/repositories/complain_repository.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/helpers/config.dart';
import 'package:transporter/values/constants.dart';

void main() async {
  const channel = MethodChannel(Constants.channelName);

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive
    ..registerAdapter(
      UserAdapter(),
    )
    ..registerAdapter(ComplaintAdapter());

  final userBox = await Hive.openBox<User>(Constants.userBox);
  final settingsBox = await Hive.openBox<String>(Constants.settingsBox);
  final complaintBox = await Hive.openBox<Complaint>(Constants.complaintsBox);

  final userRepository =
      UserRepository(userBox: userBox, settingsBox: settingsBox);
  final complaintRepository = ComplaintRepository(complaintBox: complaintBox);

  await bootstrap(
    () => App(
      userRepository: userRepository,
      complaintRepository: complaintRepository,
    ),
  );
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final apiKey = Config.googleApiKeyOverride;
    channel.invokeMethod('setApiKey', apiKey);
  });
}
