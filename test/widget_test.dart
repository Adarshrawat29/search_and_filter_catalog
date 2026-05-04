import 'package:flutter_test/flutter_test.dart';

import 'package:userstory_remote_data_fetching/features/item_catalog/data/datasources/item_local_data_source.dart';
import 'package:userstory_remote_data_fetching/features/item_catalog/data/repositories/item_repository_impl.dart';
import 'package:userstory_remote_data_fetching/features/item_catalog/domain/usecases/get_items_usecase.dart';
import 'package:userstory_remote_data_fetching/features/item_catalog/presentation/cubit/item_cubit.dart';
import 'package:userstory_remote_data_fetching/main.dart';

void main() {
  testWidgets('shows Catalog screen', (WidgetTester tester) async {
    final cubit = ItemCubit(
      GetItemsUseCase(ItemRepositoryImpl(ItemLocalDataSource())),
    );
    await tester.pumpWidget(ItemCatalogApp(cubit: cubit));
    await tester.pump();
    // ItemLocalDataSource simulates latency with Future.delayed(1s).
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Catalog'), findsOneWidget);
  });
}
