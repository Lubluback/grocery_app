class ProductsModel {
  String img;
  String price;
  String productname;
  String id;

  int count;
  ProductsModel({
    required this.img,
    required this.price,
    required this.productname,
   required this.count ,
    required this.id,
  });

  ProductsModel copyWith({
    String? img,
    String? price,
    String? productname,
    String? id,
    int? count,
  }) {
    return ProductsModel(
      img: img ?? this.img,
      price: price ?? this.price,
      productname: productname ?? this.productname,
      count: count ?? this.count,
      id: id ?? this.id,
    );
  }

  @override
  String toString() {
    return '{img:$img,price:$price,productname:$productname,count:$count,id:$id}';
  }
}
