import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:practical_demo/model/data_model.dart';

Future<List<DataModel>> fetchData() async {
  try {
    String jsonData = await rootBundle.loadString('assets/json/data.json');
    final jsonMap = json.decode(jsonData);
    final List<dynamic> dataList = jsonMap['poPending'];
    return dataList.map((json) => DataModel.fromJson(json)).toList();
  } catch (e) {
    print('Error while fetching JSON data: $e');
    return [];
  }
}
