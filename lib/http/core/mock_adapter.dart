import 'package:f_bili/http/core/hi_net_adapter.dart';
import 'package:f_bili/http/request/base_request.dart';

class MockAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) {
    return Future<HiNetResponse>.delayed(Duration(milliseconds: 1000), () {
      return HiNetResponse(
          data: {"code": 0, "message": "get success"}, statusCode: 401);
    });
  }
}
