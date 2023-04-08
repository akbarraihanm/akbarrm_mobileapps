class FoodData {
  String? foodCode;
  String? name;
  String? picture;
  String? price;
  String? pictureOri;
  String? createdAt;
  int? qty;
  int? id;

  FoodData.fromJsonMap(Map<String, dynamic> map) {
    foodCode = map['food_code'];
    name = map['name'];
    picture = map['picture'];
    price = map['price'];
    pictureOri = map['picture_ori'];
    createdAt = map['created_at'];
    id = map['id'];
    qty = 0;
  }

  Map<String, dynamic> toJson() => {
    'food_code': foodCode,
    'name': name,
    'picture': picture,
    'price': price,
    'picture_ori': pictureOri,
    'created_at': createdAt,
    'id': id,
  };
}