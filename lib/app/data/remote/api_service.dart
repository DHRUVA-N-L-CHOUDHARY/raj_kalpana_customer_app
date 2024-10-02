import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../service/dialog_helper.dart';
import 'api_interface.dart';
import 'endpoints.dart';

class ApiService extends ApiInterface {
  @override
  Future deleteApi(
      {String? url, Map<String, String>? headers, Map? data}) async {
    var client = http.Client();
    final response = await client.delete(
      Uri.parse(url!),
      headers: <String, String>{
        'accept': 'application/json',
        'content-type': 'application/json',
        // 'authorization': ApiInterface.auth!
      },
    );
    return response;
  }

  @override
  Future getApi({
    String? url,
    Map<String, String>? headers,
  }) async {
    var client = http.Client();
    print(url);
    final response = await client.get(Uri.parse(url!),
        headers: headers ??
            <String, String>{
              'accept': 'application/json',
              'content-type': 'application/json',
              // 'authorization': ApiInterface.auth!
            });
    return response;
  }

  @override
  Future postApi({String? url, Map<String, String>? headers, Map? data}) async {
    var client = http.Client();
    print("======================Post=======================");
    print(data);
    http.Response res = await client.post(Uri.parse(url!),
        headers: headers ??
            <String, String>{
              'content-type': 'application/json',
              // 'authorization': ApiInterface.auth!
            },
        body: jsonEncode(data));
    print(res.body);
    print("======================Post=======================");

    return res;
  }

  @override
  Future putApi({String? url, Map<String, String>? headers, Map? data}) async {
    var client = http.Client();
    final response = await client.put(Uri.parse(url!),
        headers: headers ??
            <String, String>{
              'accept': 'application/json',
              'content-type': 'application/json',
              // 'authorization': ApiInterface.auth!
            },
        body: jsonEncode(data));
    return response;
  }

  Map<String, dynamic>? _parseBaseResponse(http.Response res) {
    print("--------------------------------------");
    Map<String, dynamic> response = jsonDecode(res.body);
    print(response);
    if (response.containsKey("error")) {
      try {
        List entryList = response['error'].entries.toList();
        List<dynamic> errorList = [];
        for (var element in entryList) {
          errorList.add(element.value.first);
        }
        DialogHelper.showErrorDialog("Error", errorList.join("\n"));
      } catch (e) {
        DialogHelper.showErrorDialog("Error", response['error']);
      }
      return null;
    } else {
      return response;
    }
  }

  Future<http.Response> createUserAccount(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.registerUser, data: data);
    return res;
  }

  Future<http.Response> getUserDetails(String userID) async {
    http.Response res = await getApi(
        url: "${ApiInterface.baseUrl}${Endpoints.getDetailsUserID}/$userID");
    print(jsonDecode(res.body));
    return res;
  }

  Future<Map> addRecord(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.addRecord, data: data);
    return _parseBaseResponse(res) ?? {};
  }

  Future<http.Response> getRecords(String userID) async {
    http.Response res = await getApi(
        url: "${ApiInterface.baseUrl}${Endpoints.getRecordsByUserID}/$userID");
    print(jsonDecode(res.body));
    return res;
  }

  Future<http.Response> updateUserDetails(Map<String, dynamic> data) async {
    http.Response res = await putApi(
        url: ApiInterface.baseUrl + Endpoints.editProfile, data: data);
    print(jsonDecode(res.body));
    return res;
  }
  Future<http.Response> markAsPaid(Map<String, dynamic> data) async {
    http.Response res = await putApi(
        url: ApiInterface.baseUrl + Endpoints.markAsPaid, data: data);
    print(jsonDecode(res.body));
    return res;
  }
  Future<http.Response> deleteRecord(Map<String, dynamic> data) async {
    http.Response res = await putApi(
        url: ApiInterface.baseUrl + Endpoints.deleteRecord, data: data);
    print(jsonDecode(res.body));
    return res;
  }
}
