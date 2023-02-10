import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_3/bloc/main_bloc.dart';
import 'package:flutter_bloc_example_3/bloc/main_bloc_events.dart';
import 'package:flutter_bloc_example_3/bloc/main_bloc_states.dart';
import 'package:flutter_bloc_example_3/models/product_model.dart';

class AddProductWidget extends StatelessWidget {
  final Product? product;
  const AddProductWidget({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: 'Product name');
    return BlocBuilder<MainBloc, MainBlocStates>(builder: (context, states) {
      if (states is ShowEditingProduct) {
        nameController.text = states.product.name!;
      }
      return Column(children: [
        Row(children: [
          Expanded(
              child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: TextField(
                      controller: nameController,
                      decoration:
                          const InputDecoration(border: InputBorder.none)))),
          ElevatedButton(
              onPressed: () {
                if (states is ShowProductAddWidget) {
                  context.read<MainBloc>().add(AddProduct(
                      product: Product(name: nameController.text, id: number()),
                      context: context));
                } else if (states is ShowEditingProduct) {
                  context.read<MainBloc>().add(EditProductEvent(
                      context: context,
                      newName: nameController.text,
                      product: states.product));
                }
              },
              child: Text(
                  states is ShowProductAddWidget ? 'Добавить товар' : 'Изменить товар',
                  style: const TextStyle(fontSize: 12))),
        ]),
        const SizedBox(height: 10)
      ]);
    });
  }

  int number() {
    var rnd = Random();
    return rnd.nextInt(10 * 100);
  }
}
