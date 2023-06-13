// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishModel _$DishModelFromJson(Map<String, dynamic> json) => DishModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      weight: json['weight'] as int,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      tags: (json['tegs'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DishModelToJson(DishModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'weight': instance.weight,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'tags': instance.tags,
    };
