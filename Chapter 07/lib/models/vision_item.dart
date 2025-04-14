// lib/models/vision_item.dart
class VisionItem {
  final String id; // Unique identifier for Firestore document
  final String itemText; // The name of the item
  final String imageUrl; // The URL of the image

  VisionItem({
    required this.id,
    required this.itemText,
    required this.imageUrl,
  });
}
