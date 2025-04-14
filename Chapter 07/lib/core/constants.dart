// core/constants.dart

class Constants {
  // Firestore Collections
  static const String visionItemsCollection = 'vision_items';

  // Routes (for navigation)
  static const String boardScreen = '/board';
  static const String authScreen = '/auth';

  // UI Strings
  static const String appTitle = 'Visionary';
  static const String addVisionItem = 'Add/Edit your vision here!';
  static const String editVisionItem = 'Edit';
  static const String deleteVisionItem = 'Delete';
  static const String saveVisionItem = 'Save';
  static var itemText = 'Write your vision here';
  static var imageUrl = 'Enter an image URL';
  static const String emptyBoardMessage =
      'Your vision board is empty. Start adding your dreams!';

  // Firestore Fields
  static const String itemTextField = 'itemText';
  static const String imageUrlField = 'imageUrl';

  // Miscellaneous
  static const String googleSignInButtonText = 'Sign in with Google';

  // Image Placeholders
  static const String placeholderImage = "assets/images/default.jpg";

  static String sidebarTitle = 'Welcome to your Vision Board!';

  // todo: add more constants as needed
}
