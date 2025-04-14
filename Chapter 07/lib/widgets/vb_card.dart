import 'package:flutter/material.dart';
import 'package:visionary_project/core/constants.dart';
import 'package:visionary_project/models/vision_item.dart';

/// A card widget that displays a vision item
class VisionItemCard extends StatelessWidget {
  /// The vision item to display
  final VisionItem visionItem;

  /// Callback function to handle edit action
  final VoidCallback onEdit;

  /// Callback function to handle delete action
  final VoidCallback onDelete;

  /// Constructor for VisionItemCard
  const VisionItemCard({
    super.key,
    required this.visionItem,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    const double height = 600;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Stack(
        children: [visionImage(height), bottomText(context), actionButton()],
      ),
    );
  }

  /// Builds the bottom text section of the card
  Widget bottomText(context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        color: Colors.white.withValues(alpha: 0.9), // 90% opacity
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(visionItem.itemText),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the image section of the card
  Widget visionImage(double height) {
    return FadeInImage.assetNetwork(
      placeholder: Constants.placeholderImage,
      image: visionItem.imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: height,
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset(
          Constants.placeholderImage,
          fit: BoxFit.cover,
          width: double.infinity,
          height: height,
        );
      },
    );
  }

  /// Builds the action buttons (edit and delete) for the card
  Widget actionButton() {
    return Positioned(
      width: 100,
      right: 10,
      top: 10,
      child: OverflowBar(
        alignment: MainAxisAlignment.end,
        overflowSpacing: 10,
        children: [
          IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: onEdit,
              tooltip: Constants.editVisionItem),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete, color: Colors.red),
            tooltip: Constants.deleteVisionItem,
          ),
        ],
      ),
    );
  }
}
