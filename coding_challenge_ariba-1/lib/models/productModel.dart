class ProductModel {
  String? id;
  String? productName;
  String? productPrice;
  String? productCategory;

  ProductModel(
      {this.id, this.productName, this.productPrice, this.productCategory});

  factory ProductModel.fromMap(map) {
    return ProductModel(
      id: map['id'],
      productName: map['productName'],
      productPrice: map['productPrice'],
      productCategory: map['productCategory'],
    );
  }
}
