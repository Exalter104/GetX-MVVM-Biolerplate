import 'package:getx_mvvm/data/network/network_base_api_services.dart';
import 'package:getx_mvvm/res/app_urls/app_urls.dart';

class LoginRepository {
  final _apiServices = NetworkApiResponse();
  Future<dynamic> loginApi(var data) async {
    dynamic response = _apiServices.postApi(AppUrls.loginUrl, data);
    return response;
  }
}
