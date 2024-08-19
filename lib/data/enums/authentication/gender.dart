import 'package:json_annotation/json_annotation.dart';
import 'package:transporter/generated/l10n.dart';

enum Gender {
  @JsonValue('Male')
  male,

  @JsonValue('Female')
  female,
}

extension StringFromTitle on Gender {
  String get getStringFromGender {
    switch (this) {
      case Gender.male:
        return Strings.current.gender_male;
      case Gender.female:
        return Strings.current.gender_female;
    }
  }
}
