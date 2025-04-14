// lib/notifiers/vision_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionary_project/models/vision_item.dart';
import 'package:visionary_project/services/vision_board_service.dart';

class VisionItemsNotifier extends StateNotifier<List<VisionItem>> {
  final VisionBoardService visionBoardService;

  VisionItemsNotifier(this.visionBoardService) : super([]) {
    // Load the vision items when the notifier is created
    _loadVisionItems();
  }

  Future<void> _loadVisionItems() async {
    // Wait for the visionItemsStream to emit the first value
    final visionItems = await visionBoardService.visionItemsStream.first;
    // Update the state with the vision items
    state = visionItems;
  }

  Future<void> addOrUpdateItem(
    String itemText,
    String imageUrl,
    VisionItem? visionItem,
  ) async {
    // If the vision item is null, add a new item; otherwise, update the existing item
    if (visionItem == null) {
      await visionBoardService.addVisionItem(itemText, imageUrl);
    } else {
      await visionBoardService.updateVisionItem(
        visionItem.id,
        itemText,
        imageUrl,
      );
    }
    // reload the vision items
    _loadVisionItems();
  }

  Future<void> deleteItem(String id) async {
    // Delete the vision item
    await visionBoardService.deleteVisionItem(id);
    // Remove the item from the state
    state = state.where((item) => item.id != id).toList();
  }
}
