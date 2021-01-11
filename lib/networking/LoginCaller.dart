

import 'package:sample_app_1/models/user_data.dart';
import 'package:sample_app_1/networking/Apis.dart';
import 'package:sample_app_1/utils/Resource.dart';
import 'package:sample_app_1/utils/Status.dart';

import 'BaseCaller.dart';

class LoginCaller extends BaseCaller{

  Stream<Resource<User>> login(String email, String password) async*{

    yield Resource.loadingEmpty();

    var response = await hitApiPost(LOGIN);
    if(response.status == Status.SUCCESS){
      var user = User.fromJson(response.data.data);
      yield Resource(response.status, user, response.message);
    }else{
      yield Resource(response.status, null, response.message);
    }
  }

}