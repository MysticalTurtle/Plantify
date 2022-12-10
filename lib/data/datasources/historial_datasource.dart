import 'package:recog_plantify/data/models/request/add_record_request.dart';
import 'package:recog_plantify/data/models/response/add_record_response.dart';
import 'package:recog_plantify/data/models/response/delete_record_response.dart';
import 'package:recog_plantify/data/models/response/historial_response.dart';
import 'package:dio/dio.dart';

abstract class HistorialDataSource {
  Future<HistorialResponse> getHistorial(String token);
  Future<AddRecordResponse> addRecord(
      String token, AddRecordRequest plantRecord);
  Future<DeleteRecordResponse> deleteRecord(String token, String id);
}

class HistorialDataSourceImpl extends HistorialDataSource {
  HistorialDataSourceImpl();

  final baseURL = 'http://192.168.3.9:3030/api/';

  @override
  Future<HistorialResponse> getHistorial(String token) async {
    String url = '${baseURL}history';
    var dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    var response = await dio.get(url);

    return HistorialResponse.fromJson(response.data);
  }

  @override
  Future<AddRecordResponse> addRecord(
      String token, AddRecordRequest plantRecord) async {
    String url = '${baseURL}history/';
    var dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    var response = await dio.post(url, data: plantRecord.toJson());
    return AddRecordResponse.fromJson(response.data);
  }

  @override
  Future<DeleteRecordResponse> deleteRecord(String token, String id) async {
    String url = '${baseURL}history/$id';
    var dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    var response = await dio.delete(url);
    return DeleteRecordResponse.fromJson(response.data);
  }
}
