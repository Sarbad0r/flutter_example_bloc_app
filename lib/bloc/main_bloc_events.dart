import 'package:flutter/material.dart';
import 'package:flutter_bloc_example_3/models/assortment_model.dart';
import 'package:flutter_bloc_example_3/models/product_model.dart';

abstract class MainBlocEvents {}

class AddToAssortment extends MainBlocEvents {
  BuildContext context;
  Assortment assortment;
  AddToAssortment({required this.assortment, required this.context});
}

class ShowAddingProduct extends MainBlocEvents {}

class ShowAddingAssortment extends MainBlocEvents {}

class AddProduct extends MainBlocEvents {
  BuildContext context;
  Product product;
  AddProduct({required this.product, required this.context});
}

class ShowEditingProductEvent extends MainBlocEvents {
  Product product;
  ShowEditingProductEvent({required this.product});
}

class EditProductEvent extends MainBlocEvents {
  BuildContext context;
  Product product;
  String? newName;
  EditProductEvent(
      {required this.context, required this.product, required this.newName});
}
