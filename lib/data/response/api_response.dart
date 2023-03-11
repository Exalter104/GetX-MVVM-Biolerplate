// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:getx_mvvm/data/response/status.dart';

class ApiResponse<D> {
  Status? status;
//dynamic data
  D? data;
  String? message;

//constructor of above code
  ApiResponse(
    this.status,
    this.data,
    this.message,
  );
//App status if App is running

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.comleted(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;
}
