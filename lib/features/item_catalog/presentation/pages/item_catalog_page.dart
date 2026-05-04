import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/item_cubit.dart';
import '../cubit/item_state.dart';

class ItemPage extends StatefulWidget {
  final ItemCubit cubit;

  const ItemPage({super.key, required this.cubit});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  late final ItemCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = widget.cubit;
    cubit.loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalog')),
      body: Column(
        children: [
          _buildSearchField(),
          _buildFilterDropdown(),
          Expanded(child: _buildList()),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Search',
          border: OutlineInputBorder(),
        ),
        onChanged: cubit.search,
      ),
    );
  }

  Widget _buildFilterDropdown() {
    return DropdownButton<String>(
      hint: const Text('Filter'),
      items: const ['Education', 'Service', 'Health']
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (value) => cubit.filter(value ?? ''),
    );
  }

  Widget _buildList() {
    return BlocBuilder<ItemCubit, ItemState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is Loaded) {
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (_, i) {
              final item = state.items[i];
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.category),
              );
            },
          );
        }

        if (state is Empty) {
          return const Center(child: Text("No results found"));
        }

        if (state is Error) {
          return Center(
            child: ElevatedButton(
              onPressed: cubit.loadItems,
              child: const Text('Retry'),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
} 