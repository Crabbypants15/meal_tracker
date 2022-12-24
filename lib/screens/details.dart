import 'package:flutter/material.dart';

//Making a details screen under the Settings screen to help
//streamline the app

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text('Version'),
              subtitle: Text('v1.0.0'),
              leading: Icon(Icons.info_outline),
            ),
            ListTile(
                title: const Text('Show Licenses'),
                leading: const Icon(Icons.copyright),
                onTap: () {
                  showLicensePage(context: context);
                }),
            ListTile(
              title: Text('Contact info:'),
              subtitle: Text('crabbypants15@gmail.com'),
              leading: Icon(Icons.contact_support),
            )
          ],
        ));
  }
}
