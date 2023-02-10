import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_3/bloc/main_bloc.dart';
import 'package:flutter_bloc_example_3/bloc/main_bloc_events.dart';
import 'package:flutter_bloc_example_3/bloc/main_bloc_states.dart';
import 'package:flutter_bloc_example_3/widgets/add_assortment_widget.dart';
import 'package:flutter_bloc_example_3/widgets/add_product_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.amber, title: const Text('Bloc example')),
        body: BlocConsumer<MainBloc, MainBlocStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(children: [
                const SizedBox(height: 10),
                if (state is ShowProductAddWidget)
                  const AddProductWidget()
                else if (state is ShowAssortmentAddWidget)
                  const AddAssortmentWidget()
                else if (state is ShowEditingProduct)
                  const AddProductWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () =>
                              context.read<MainBloc>().add(ShowAddingProduct()),
                          child: const Text('Добавить продукт')),
                      ElevatedButton(
                          onPressed: () => context
                              .read<MainBloc>()
                              .add(ShowAddingAssortment()),
                          child: const Text('Добавить ассортимент'))
                    ]),
                const SizedBox(height: 10),
                listOfStates(state)
              ]);
            }));
  }

  Widget listOfStates(MainBlocStates state) {
    return Expanded(
      child: Row(children: [
        Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: state.productList?.length ?? 0,
                itemBuilder: (context, index) {
                  return Row(children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => context.read<MainBloc>().add(
                            ShowEditingProductEvent(
                                product: state.productList![index])),
                        child: Text(
                            '${state.productList?[index].id}: ${state.productList?[index].name}'),
                      ),
                    )
                  ]);
                })),
        Expanded(
            child: ListView.builder(
                itemCount: state.assortmentList?.length,
                itemBuilder: (context, index) {
                  return Row(children: [
                    Text('${index + 1}: ${state.assortmentList?[index].name}')
                  ]);
                })),
      ]),
    );
  }
}
