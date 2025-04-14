// lib/providers/vision_board_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionary_project/models/vision_item.dart';
import 'package:visionary_project/notifiers/vision_notifier.dart';
import 'package:visionary_project/services/vision_board_service.dart';

/// Provider for the vision board service
final visionBoardServiceProvider = Provider<VisionBoardService>((ref) {
  return VisionBoardService();
});

/// Provides a notifier for vision items
final visionItemsNotifierProvider =
    StateNotifierProvider<VisionItemsNotifier, List<VisionItem>>((ref) {
  // The ref parameter is an instance of ProviderRef, which is used to read other providers
  final visionBoardService = ref.watch(visionBoardServiceProvider);
  return VisionItemsNotifier(visionBoardService);
});

/// Provides a stream of vision items
final visionItemsProvider = StreamProvider<List<VisionItem>>((ref) {
  final visionBoardService = ref.watch(visionBoardServiceProvider);
  return visionBoardService.visionItemsStream;
});
