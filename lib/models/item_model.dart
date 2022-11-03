
class ItemModel {
  int? id;
  String? name;
  String? barcode;
  int? sku;
  String? categoryId;
  int? inStock;
  int? price;
  int? camePrice;
  ItemModel({
    required this.barcode,
    required this.camePrice,
    required this.categoryId,
    this.id,
    required this.inStock,
    required this.name,
    required this.price,
    required this.sku,
  });
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
        barcode: json['barcode'],
        camePrice: json["camePrice"],
        categoryId: json["categoryId"],
        // id: json['id'],
        inStock: json['inStock'],
        name: json['name'],
        price: json['price'],
        sku: json['sku']);
  }
  Map<String, dynamic> toJson() => {
    "name":name,
        "barcode": barcode,
        "camePrice": camePrice,
        "categoryId": categoryId,
        "id": id,
        "inStock": inStock,
        "price": price,
        "sku": sku,
      };
}
