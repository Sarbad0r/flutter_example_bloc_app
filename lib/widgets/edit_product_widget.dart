import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_3/bloc/main_bloc.dart';
import 'package:flutter_bloc_example_3/bloc/main_bloc_events.dart';
import 'package:flutter_bloc_example_3/models/product_model.dart';

class EditProduct extends StatelessWidget {
  final Product product;
  const EditProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController editController =
        TextEditingController(text: product.name);
    return Column(children: [
      Row(children: [
        Expanded(
            child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextField(
                    controller: editController,
                    decoration:
                        const InputDecoration(border: InputBorder.none)))),
        ElevatedButton(
            onPressed: () => context.read<MainBloc>().add(EditProductEvent(
                product: product,
                newName: editController.text,
                context: context)),
            child:
                const Text('Изменить товар', style: TextStyle(fontSize: 12))),
      ]),
      const SizedBox(height: 10)
    ]);
    ;
  }
}
