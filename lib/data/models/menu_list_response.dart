import '../../domain/entities/menu.dart';

class MenuListResponse {
  List<MenuModel>? menu;

  MenuListResponse({this.menu});

  MenuListResponse.fromJson(Map<String, dynamic> json) {
    if (json['menu'] != null) {
      menu = <MenuModel>[];
      json['menu'].forEach((v) {
        menu!.add(MenuModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (menu != null) {
      data['menu'] = menu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MenuModel {
  int? id;
  String? name;
  int? price;
  String? image;

  MenuModel({this.id, this.name, this.price, this.image});

  MenuModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    return data;
  }

  Menu toEntity() {
    return Menu(id: id!, name: name!, price: price!, image: image!);
  }
}
