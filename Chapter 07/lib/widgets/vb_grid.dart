// lib/widgets/vb_grid.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionary_project/core/constants.dart';
import 'package:visionary_project/models/vision_item.dart';
import 'package:visionary_project/notifiers/vision_notifier.dart';
import 'package:visionary_project/providers/vision_provider.dart';
import 'package:visionary_project/widgets/vb_card.dart';
import 'package:visionary_project/widgets/vb_form.dart';

class VisionGrid extends ConsumerWidget {
  const VisionGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visionItemsAsyncValue = ref.watch(visionItemsProvider);
    final visionItemsNotifier = ref.read(visionItemsNotifierProvider.notifier);

    return visionItemsAsyncValue.when(
      data: (visionItems) =>
          buildGrid(context, visionItems, visionItemsNotifier),
      loading: () => buildLoading(),
      error: (error, stackTrace) => buildError(error),
    );
  }

  Widget buildGrid(
    BuildContext context,
    List<VisionItem> visionItems,
    VisionItemsNotifier visionItemsNotifier,
  ) {
    if (visionItems.isEmpty) {
      return buildEmptyMessage();
    } else {
      return GridView.builder(
        padding: const EdgeInsets.all(30),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 600,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
        ),
        itemCount: visionItems.length,
        itemBuilder: (context, index) {
          final visionItem = visionItems[index];
          return VisionItemCard(
            visionItem: visionItem,
            onEdit: () => showModalBottomSheet(
              context: context,
              builder: (context) => AddItemForm(
                initialImageUrl: visionItem.imageUrl,
                initialItemText: visionItem.itemText,
                onSubmit: (itemText, imageUrl) async {
                  Navigator.pop(context);
                  await visionItemsNotifier.addOrUpdateItem(
                    itemText,
                    imageUrl,
                    visionItem,
                  );
                },
              ),
            ),
            onDelete: () async => await visionItemsNotifier.deleteItem(
              visionItem.id,
            ),
          );
        },
      );
    }
  }

  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildError(Object error) {
    return Center(child: Text('Error: $error'));
  }

  Widget buildEmptyMessage() {
    return const Center(
      child: Text(
        Constants.emptyBoardMessage,
        style: TextStyle(
          fontSize: 32,
          color: Colors.white,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
