// lib/services/vision_board_service.dart
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:visionary_project/core/constants.dart';
import 'package:visionary_project/models/vision_item.dart';

/// Enum representing the result of a vision operation
enum VisionResult {
  success,
  failure,
}

/// Service class for handling vision board operations
class VisionBoardService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // a StreamController to manage the stream of vision items
  final StreamController<List<VisionItem>> _visionItemsController =
      StreamController.broadcast();

  /// Gets the collection reference for vision items
  CollectionReference get visionCollection =>
      _firestore.collection(Constants.visionItemsCollection);

  VisionBoardService() {
    // Listen for changes to the vision items collection
    _firestore
        .collection(Constants.visionItemsCollection)
        .snapshots()
        .listen((snapshot) {
      // Convert the snapshot to a list of VisionItem objects
      final visionItems = snapshot.docs.map((doc) {
        // Create a VisionItem object from the document
        return VisionItem(
          id: doc.id,
          itemText: doc[Constants.itemTextField],
          imageUrl: doc[Constants.imageUrlField],
        );
      }).toList();
      // Add the vision items to the stream
      _visionItemsController.add(visionItems);
    });
  }

  /// Adds a new vision item to the collection
  Future<VisionResult> addVisionItem(String itemText, String imageUrl) async {
    try {
      // Add the vision item to the collection in firebase
      await visionCollection.add({
        Constants.itemTextField: itemText,
        Constants.imageUrlField: imageUrl,
      });
      return VisionResult.success;
    } catch (e) {
      debugPrint("Error adding vision item: $e");
      return VisionResult.failure;
    }
  }

  /// Updates an existing vision item in the collection
  Future<VisionResult> updateVisionItem(
    String documentId,
    String itemText,
    String imageUrl,
  ) async {
    try {
      // Update the vision item in the collection in firebase
      await visionCollection.doc(documentId).update({
        Constants.itemTextField: itemText,
        Constants.imageUrlField: imageUrl,
      });
      return VisionResult.success;
    } catch (e) {
      debugPrint("Error updating vision item: $e");
      return VisionResult.failure;
    }
  }

  /// Deletes a vision item from the collection
  Future<VisionResult> deleteVisionItem(String documentId) async {
    try {
      // Delete the vision item from the collection in firebase
      await visionCollection.doc(documentId).delete();
      return VisionResult.success;
    } catch (e) {
      debugPrint("Error deleting vision item: $e");
      return VisionResult.failure;
    }
  }

  /// Gets a stream of vision items from the collection
  Stream<List<VisionItem>> get visionItemsStream =>
      _visionItemsController.stream;

  void dispose() {
    _visionItemsController.close();
  }
}
