import 'package:manager_state/core/config/call_api/dio_client.dart';

class RestAPI {
  DioClient dioClient = DioClient();

  Future<dynamic> get<T>(String url) async {
    try {
      final response = await dioClient.getDio.get(url);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  Future<T> post<T>(String url, Object body) async {
    try {
      final response = await dioClient.getDio.post(url, data: body);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  Future<T> postMsg<T>(String url) async {
    try {
      final response = await dioClient.getDio.post(url);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  Future<T> put<T>(String url) async {
    try {
      final response = await dioClient.getDio.put(url);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  Future<T> putObj<T>(String url, Object body) async {
    try {
      final response = await dioClient.getDio.put(url, data: body);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }
}
