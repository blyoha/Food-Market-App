import 'package:json_annotation/json_annotation.dart';

import '../../../../core/entities/dish_entity.dart';

part 'dish_model.g.dart';

@JsonSerializable()
class DishModel extends DishEntity {
  const DishModel({
    required id,
    required name,
    required price,
    required weight,
    required description,
    required imageUrl,
    required tags,
  }) : super(
          id: id,
          name: name,
          price: price,
          weight: weight,
          description: description,
          imageUrl: imageUrl,
          tags: tags,
        );

  factory DishModel.fromJson(Map<String, dynamic> json) =>
      _$DishModelFromJson(json);

  Map<String, dynamic> toJson() => _$DishModelToJson(this);
}
