// ignore_for_file: dead_code_on_catch_subtype
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:getx_mvvm/data/exception.dart';
import 'package:getx_mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:getx_mvvm/utils/utils.dart';
// .................................GET API

class NetworkApiResponse extends BaseApiServices {
  @override
  Future getApi(String url) async {
//..........................TESTING  URL WORK OR NOT
    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 3));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimoutException {
      throw RequestTimoutException("");
    }
    return responseJson;
  }

// .................................POST API

  @override
  Future postApi(String url, var data) async {
//..........................TESTING  URL AND DATA WORK OR NOT
    if (kDebugMode) {
      print(url);
      print(data);
    }
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 3));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimoutException {
      throw RequestTimoutException("");
    }
    if (kDebugMode) {
      print(responseJson);
      Utils.snackBar("Token", responseJson.toString());
    }
    return responseJson;
  }

// .................................STATUS CODES

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrlException;

      default:
        throw FetchDataException(
            "Error Occured while Comunicating with server ${response.statusCode}");
    }
  }
}
