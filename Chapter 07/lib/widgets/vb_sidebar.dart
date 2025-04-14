import 'package:flutter/material.dart';
import 'package:visionary_project/core/constants.dart';

/// A drawer widget for the Visionary app
class VisionDrawer extends StatelessWidget {
  /// The background color of the drawer
  final Color color;

  /// Callback functions to handle sign out and add item
  final VoidCallback signOut;
  final VoidCallback addItem;

  /// Constructor for VisionDrawer
  const VisionDrawer({
    super.key,
    required this.color,
    required this.signOut,
    required this.addItem,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      elevation: 2,
      backgroundColor: color,
      child: Column(
        children: [
          buildDrawerHeader(),
          buildListTile(
            icon: Icons.add_box,
            text: 'A D D   I T E M',
            onTap: addItem,
          ),
          buildListTile(
            icon: Icons.logout,
            text: 'L O G O U T',
            onTap: signOut,
          ),
        ],
      ),
    );
  }

  Widget buildDrawerHeader() {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          children: [
            const FlutterLogo(size: 100),
            Text(Constants.sidebarTitle),
          ],
        ),
      ),
    );
  }

  Widget buildListTile({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      hoverColor: Colors.white,
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }
}
