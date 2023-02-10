import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_3/bloc/main_bloc_events.dart';
import 'package:flutter_bloc_example_3/bloc/main_bloc_states.dart';
import 'package:collection/collection.dart';

class MainBloc extends Bloc<MainBlocEvents, MainBlocStates> {
  MainBloc() : super(InitialState([], [])) {
    on<ShowAddingProduct>((event, emit) {
      emit(ShowProductAddWidget.fromState(
          state.assortmentList ?? [], state.productList ?? []));
    });

    on<AddProduct>((event, emit) {
      if ((event.product.name ?? '').isEmpty) {
        ScaffoldMessenger.of(event.context)
            .showSnackBar(const SnackBar(content: Text('Ошибка товара')));
        return;
      }
      var getItems = state.productList;

      getItems?.add(event.product);

      emit(InitialState.fromState(state.assortmentList ?? [], getItems ?? []));
    });

    on<ShowAddingAssortment>((event, emit) {
      emit(ShowAssortmentAddWidget.fromState(
          state.assortmentList ?? [], state.productList ?? []));
    });

    on<AddToAssortment>((event, emit) {
      if ((event.assortment.name ?? '').isEmpty) {
        ScaffoldMessenger.of(event.context)
            .showSnackBar(const SnackBar(content: Text('Ошибка аасортимента')));
        return;
      }
      var getItems = state.assortmentList;

      getItems?.add(event.assortment);

      emit(InitialState.fromState(getItems ?? [], state.productList ?? []));
    });

    on<ShowEditingProductEvent>((event, emit) {
      emit(ShowEditingProduct(
          state.productList, state.assortmentList, event.product));
    });

    on<EditProductEvent>((event, emit) {
      var getCurrentState = state;

      getCurrentState.productList
          ?.firstWhereOrNull((element) => element.id == event.product.id)
          ?.name = event.newName;

      ScaffoldMessenger.of(event.context)
          .showSnackBar(const SnackBar(content: Text('Успешно изменен')));
      emit(InitialState(
          getCurrentState.productList, getCurrentState.assortmentList));
    });
  }
}
