// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDataModel _$ImageDataModelFromJson(Map<String, dynamic> json) =>
    ImageDataModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageBase64: json['imageBase64'] as String,
    );

Map<String, dynamic> _$ImageDataModelToJson(ImageDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageBase64': instance.imageBase64,
    };
