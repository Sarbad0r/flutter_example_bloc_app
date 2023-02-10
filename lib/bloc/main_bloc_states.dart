import 'package:flutter_bloc_example_3/models/assortment_model.dart';
import 'package:flutter_bloc_example_3/models/product_model.dart';

abstract class MainBlocStates {
  List<Assortment>? assortmentList;
  List<Product>? productList;

  MainBlocStates({this.assortmentList, this.productList});

}

class InitialState extends MainBlocStates {
  InitialState(List<Product>? productList, List<Assortment>? assortmentList)
      : super(productList: productList, assortmentList: assortmentList);

  factory InitialState.fromState(
      List<Assortment> assortmentList, List<Product> productList) {
    return InitialState(productList, assortmentList);
  }
}

class ShowProductAddWidget extends MainBlocStates {
  ShowProductAddWidget(
      List<Product>? productList, List<Assortment>? assortmentList)
      : super(productList: productList, assortmentList: assortmentList);

  factory ShowProductAddWidget.fromState(
      List<Assortment> assortmentList, List<Product> productList) {
    return ShowProductAddWidget(productList, assortmentList);
  }
}

class ShowAssortmentAddWidget extends MainBlocStates {
  ShowAssortmentAddWidget(
      List<Product>? productList, List<Assortment>? assortmentList)
      : super(productList: productList, assortmentList: assortmentList);

  factory ShowAssortmentAddWidget.fromState(
      List<Assortment> assortmentList, List<Product> productList) {
    return ShowAssortmentAddWidget(productList, assortmentList);
  }
}

class ShowEditingProduct extends MainBlocStates {
  Product product;
  ShowEditingProduct(List<Product>? listProduct,
      List<Assortment>? assortmentList, this.product)
      : super(productList: listProduct, assortmentList: assortmentList);

  factory ShowEditingProduct.fromState(List<Assortment> assortmentList,
      List<Product> productList, Product product) {
    return ShowEditingProduct(productList, assortmentList, product);
  }
}
