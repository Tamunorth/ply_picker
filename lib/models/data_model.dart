import 'package:flutter/cupertino.dart';
import 'package:plypicker_interview/data.dart';

/// product_id : 6645131324512151
/// product_image : "https://images.unsplash.com/photo-1600566752355-35792bedcfea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmF0aHJvb218ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"
/// product_name : "Modular bathroom 1"
/// brand : "Cera"
/// original_price : 5000
/// discounted_price : 3500
/// discount_percentage : 20
/// rating : 4.1

class DataModel extends ChangeNotifier {
  DataModel({
    this.productId,
    this.productImage,
    this.productName,
    this.brand,
    this.originalPrice,
    this.discountedPrice,
    this.discountPercentage,
    this.rating,
    required this.isFavourite,
  });

  DataModel.fromJson(dynamic json) {
    productId = json['product_id'];
    productImage = json['product_image'];
    productName = json['product_name'];
    brand = json['brand'];
    originalPrice = json['original_price'];
    discountedPrice = json['discounted_price'];
    discountPercentage = json['discount_percentage'];
    rating = json['rating'];
  }
  int? productId;
  String? productImage;
  String? productName;
  String? brand;
  int? originalPrice;
  int? discountedPrice;
  int? discountPercentage;
  double? rating;
  bool isFavourite = false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['product_image'] = productImage;
    map['product_name'] = productName;
    map['brand'] = brand;
    map['original_price'] = originalPrice;
    map['discounted_price'] = discountedPrice;
    map['discount_percentage'] = discountPercentage;
    map['rating'] = rating;
    return map;
  }

  List<DataModel> items = [];
  // List<DataModel> fItems = [];

  List<DataModel> favourites = [];

  List<DataModel> initialData() {
    for (var element in localData) {
      items.add(DataModel.fromJson(element));
    }
    print(items[0].productId);
    return items;
  }

  // List<DataModel> favouriteData() {
  //   print('trigg');
  //   for (var element in items) {
  //     if (element.isFavourite == true) {
  //       fItems.add(element);
  //     }
  //   }
  //   print(items[0].productId);
  //   return fItems;
  // }
  //
  // void addFavourite(DataModel data) {}

  void toggleFavourite() {
    isFavourite = !isFavourite;

    notifyListeners();
  }
}
