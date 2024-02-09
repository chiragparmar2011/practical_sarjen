import 'package:flutter/material.dart';
import 'package:practical_demo/model/data_model.dart';

class CustomDialog {
  static Future vendorStatusDialog({
    required BuildContext context,
    required String title,
    required List<DataModel> vendors,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  vendors.map((vendor) => Text(vendor.dealerName)).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
