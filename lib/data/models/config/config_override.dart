import 'package:json_annotation/json_annotation.dart';

part 'config_override.g.dart';

@JsonSerializable()
class ConfigOverride {
  ConfigOverride({
    this.DEFINE_GOOGLE_MAPS_API_KEY,
  });
  factory ConfigOverride.fromJson(Map<String, dynamic> json) =>
      _$ConfigOverrideFromJson(json);

  @JsonKey(name: 'DEFINE_GOOGLE_MAPS_API_KEY')
  final String? DEFINE_GOOGLE_MAPS_API_KEY;

  ConfigOverride copyWith({
    String? DEFINE_GOOGLE_MAPS_API_KEY,
  }) =>
      ConfigOverride(
        DEFINE_GOOGLE_MAPS_API_KEY:
            DEFINE_GOOGLE_MAPS_API_KEY ?? this.DEFINE_GOOGLE_MAPS_API_KEY,
      );
  Map<String, dynamic> toJson() => _$ConfigOverrideToJson(this);
}
