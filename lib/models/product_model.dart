class Product {
  int? id;
  String? name;
  double? qty;

  Product({this.id, this.name, this.qty});

  factory Product.copyProduct(Product product, String newName) {
    return Product(id: product.id, qty: product.qty, name: newName);
  }
}
