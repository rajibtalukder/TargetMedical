import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'package:image_picker/image_picker.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/services/internet.dart';
import 'package:target_medical/utils/api_urls.dart' as urls;

class CoreService extends GetConnect {
  final _loadingController = GetControllers.instance.getLoadingController();

  Future<Response> getRequest({required String url}) async {
    String url0 = urls.baseUrl + url;
    debugPrint('GetRequest\nUrl : $url0');
    Response response = const Response();
    if (!await Internet.hasInternet()) return response;
    response = await get(url0);
    debugPrint("Response : ${jsonEncode(response.body)}");
    debugPrint("Response Code : ${response.status.code}");
    return response;
  }

  Future<Response> postRequest({
    required String url,
    required Map data,
  }) async {
    String url0 = urls.baseUrl + url;
    debugPrint('PostRequest\nUrl : $url0');
    debugPrint('PostRequest Data : $data');
    Response response = const Response();
    if (!await Internet.hasInternet()) return response;

    response = await post(
      url0,
      data,
    );

    debugPrint("Response : ${jsonEncode(response.body)}");
    debugPrint("Response Code : ${response.status.code}");
    return response;
  }

  Future<Response> postEditUserInfoRequest({
    required String url,
    required String name,
    required String email,
    required String dateOfBirth,
    required String password,
    required String imageUrl,
    XFile? imageFile,
  }) async {
    FormData formData = FormData({});

    try {
      if (imageFile == null) {
        formData = FormData({
          'name': name,
          'email': email,
          'date_of_birth': dateOfBirth,
          'password': password,
          'image': imageUrl
        });
      } else {
        final image = MultipartFile(
          await imageFile.readAsBytes(),
          filename: '${name.replaceAll(' ', '_').toLowerCase()}_profile_image',
          // contentType: "image/png"
        );

        formData = FormData({
          'name': name,
          'email': email,
          'date_of_birth': dateOfBirth,
          'password': password,
          'image': image
        });
      }
    } catch (error) {
      debugPrint("Core Error:- ${error.toString()}");
    }
    String url0 = urls.baseUrl + url;
    debugPrint('PostUserInfoRequest\nUrl : $url0');
    Response response = const Response();
    if (!await Internet.hasInternet()) return response;

    response = await post(
      url0,
      formData,
    );

    debugPrint("Response : ${jsonEncode(response.body)}");
    debugPrint("Response Code : ${response.status.code}");
    return response;
  }
}
