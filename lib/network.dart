import 'dart:convert';
import 'dart:io';

import 'package:flutter_banglore_test/reaction_model.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';


class Api {
  static Future<Reactions>  getApi() async {
    var formData = FormData.fromMap({
      "user_id": 3206161992,
      "feeling_date": "15-04-2022",
    });

    var response = await Dio().post(
        'https://www.qubehealth.com/qube_services/api/testservice/getListOfUserFeeling',
        data: {
          "user_id": "3206161992",
          "feeling_date": "15-04-2022",
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-Api-Key': 'f6d646a6c2f2df883ea0cccaa4097358ede98284',
        }));

    //print(response.data);

    var model = ReactionModel.fromJson(jsonDecode(response.data));
   

    return model.data!;
  }
}
