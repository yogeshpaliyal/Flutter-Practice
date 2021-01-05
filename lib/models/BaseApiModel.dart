
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BaseApiModel{

  int statusCode;
  String message;

  Map<String,dynamic> data;


  BaseApiModel();

  factory  BaseApiModel.fromJson(Map<String, dynamic> json){
    var baseApiModel = BaseApiModel();
    baseApiModel.statusCode = json["status"] as int;
    baseApiModel.message = json["message"] as String;
    baseApiModel.data = json["data"] as Map<String, dynamic>;
    return baseApiModel;
  }

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'status': statusCode,
      'message': message,
      'data': data,
    };
  }

}