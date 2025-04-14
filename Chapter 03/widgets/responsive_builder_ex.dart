import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveBuilderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ResponsiveBuilder Example'),
      ),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
            return Text('Mobile Screen');
          } else {
            return Text('Desktop Screen');
          }
        },
      ),
    );
  }
}
