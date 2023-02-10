class Product {
  int? id;
  String? name;
  double? qty;

  Product({this.id, this.name, this.qty});

  factory Product.copyProduct(Product product, String newName) {
    return Product(id: product.id, qty: product.qty, name: newName);
  }

  static List<Product> prodInitList = <Product>[
    Product(id: 1, name: 'First Product'),
    Product(id: 2, name: 'Second Product'),
    Product(id: 3, name: 'First Product')
  ];
}
