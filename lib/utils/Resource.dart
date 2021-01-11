

import 'package:sample_app_1/utils/Status.dart';

class Resource<T>{
  Status status;
  T data;
  String message = "";

  Resource(this.status, this.data, this.message);

  Resource.success(this.data,this.message){
   status = Status.SUCCESS;
  }

  Resource.error(this.data,this.message){
    status = Status.ERROR;
  }

  Resource.loading(this.data, this.message){
    status = Status.LOADING;
  }

  Resource.loadingEmpty(){
    status = Status.LOADING;
  }
}