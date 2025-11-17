import 'package:http/http.dart';
import 'package:it_mcq/services/api/http_helper.dart';
import 'package:it_mcq/services/api/url_const.dart';


class AuthApi {
  Future<Response?> loginUsingOtpApi(
      {required String type, required String value}) async {
    try {
      final res = await HttpHelper()
          .postData(UrlConst.loginUsingOtp, {"type": type, "value": value});
      return res;
    } catch (e) {
      // Optionally log or report the error
      print('Error fetching areas of interest: $e');
      return null;
    }
  }

  Future<Response?> getAreasOfInterest() async {
    try {
      final res = await HttpHelper().getData(UrlConst.getAreaOfInterest);
      return res;
    } catch (e) {
      // Optionally log or report the error
      print('Error fetching areas of interest: $e');
      return null;
    }
  }
}