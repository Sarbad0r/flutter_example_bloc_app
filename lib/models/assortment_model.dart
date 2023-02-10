// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc_example_3/models/product_model.dart';

class Assortment {
  List<Product>? assortment_products;
  String? name;
  int? id;

  Assortment({this.assortment_products, this.name, this.id});
}
