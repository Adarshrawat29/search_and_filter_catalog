import 'package:flutter/material.dart';

import 'features/item_catalog/data/datasources/item_local_data_source.dart';
import 'features/item_catalog/data/repositories/item_repository_impl.dart';
import 'features/item_catalog/domain/usecases/get_items_usecase.dart';
import 'features/item_catalog/presentation/cubit/item_cubit.dart';
import 'features/item_catalog/presentation/pages/item_catalog_page.dart';

void main() {
  final dataSource = ItemLocalDataSource();
  final repository = ItemRepositoryImpl(dataSource);
  final useCase = GetItemsUseCase(repository);
  final cubit = ItemCubit(useCase);

  runApp(ItemCatalogApp(cubit: cubit));
}

class ItemCatalogApp extends StatelessWidget {
  final ItemCubit cubit;

  const ItemCatalogApp({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Item Catalog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 113, 112, 116)),
        useMaterial3: true,
      ),
      home: ItemPage(cubit: cubit),
    );
  }
}
