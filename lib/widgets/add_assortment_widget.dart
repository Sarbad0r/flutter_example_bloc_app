import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_3/bloc/main_bloc.dart';
import 'package:flutter_bloc_example_3/bloc/main_bloc_events.dart';
import 'package:flutter_bloc_example_3/models/assortment_model.dart';
import 'package:flutter_bloc_example_3/models/product_model.dart';

class AddAssortmentWidget extends StatelessWidget {
  const AddAssortmentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController(text: 'Assortment Name');
    return Column(children: [
      Row(children: [
        Expanded(
            child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextField(
                    controller: name,
                    decoration: const InputDecoration(border: InputBorder.none)))),
        ElevatedButton(
            onPressed: () => context.read<MainBloc>().add(AddToAssortment(
                assortment: Assortment(name: name.text), context: context)),
            child: const Text('Добавить ассортимент', style: TextStyle(fontSize: 12))),
      ]),
      const SizedBox(height: 10)
    ]);
  }
}
