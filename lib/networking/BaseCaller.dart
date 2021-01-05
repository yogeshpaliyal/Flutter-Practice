import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample_app_1/models/BaseApiModel.dart';
import 'package:sample_app_1/utils/Resource.dart';

class BaseCaller{
  Map<String, String> headers = Map();
  Map<String, String> params = Map();
  Future<Resource<BaseApiModel>> hitApiPost(String api, ) async {
    final response = await http.post(api, headers: headers, body: params);
    if(response.statusCode == 200){ // server response code
      // api response success
      BaseApiModel apiResponse = BaseApiModel.fromJson(jsonDecode(response.body));
      if(apiResponse.statusCode == 200){ // api resposne code
       return Resource.success(apiResponse, apiResponse.message);
      }else{
       return Resource.error(apiResponse, apiResponse.message);
      }
    }else{
     return Resource.error(null, "Some error occurred");
    }
  }
}