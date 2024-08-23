import 'package:json_annotation/json_annotation.dart';

part 'image_data_model.g.dart';

@JsonSerializable()
class ImageDataModel {
  final String id;

  final String title;

  final String description;

  final String imageBase64;

  const ImageDataModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageBase64,
  });

  factory ImageDataModel.fromJson(Map<String, dynamic> json) => _$ImageDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDataModelToJson(this);
}
