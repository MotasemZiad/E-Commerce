class CategoryModel {
  String name, image;

  CategoryModel({this.name, this.image});

  CategoryModel.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
  }

  toJson() => {
        'name': name,
        'image': image,
      };
}
