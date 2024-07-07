import 'dart:convert';
import 'dart:io';
import 'package:flutter_home_screen/data/models/request/agentCalenderRequest.dart';
import 'package:flutter_home_screen/data/models/response/ServiceProviderResponse.dart';
import 'package:flutter_home_screen/data/models/response/agentCalenderResponse.dart';
import 'package:http/http.dart' as http;

import 'package:dartz/dartz.dart';
import 'package:flutter_home_screen/data/models/response/AgentServiceResponse.dart';

import '../models/request/GetById_Request.dart';
import '../models/request/ServiceRequest.dart';
import '../models/request/providerRequest.dart';
import '../models/request/serviceAgentRequest.dart';
import '../models/response/ServiceCategoryResponse.dart';
import '../models/response/ServiceResponse.dart';
import 'api_constants.dart';
import 'baseError.dart';

class ApiManager {
  String? userToken;

  String? serviceId;

  ApiManager._();

  static ApiManager? instance;

  static ApiManager getInstance() {
    instance ??= ApiManager._();
    return instance!;
  }


  Future<Either<BaseError, ServiceResponse>> getAgentService(String? id) async {

    // print(userToken);
    final result = await InternetAddress.lookup('youtube.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
      Uri url = Uri.http(ApiConstants.baseUrl, ApiConstants.getAllAgentService);


      Map<String, String> headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $userToken',
      };
      var requestBody = ServiceAgentRequest(
        serviceId : id,
      );
      print('Requested');

      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody.toJson()), // Ensure the request body is properly encoded as JSON
      );
      var AgentServiceResponse = ServiceResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {

        return Right(AgentServiceResponse);
      } else {
        return Left(ServerError(errorMsg: AgentServiceResponse.message));
      }
    } else {
      return Left(NetworkError(errorMsg: 'Please Check Internet Connection'));
    }
  }


  Future<Either<BaseError, AgentCalenderResponse>> getAllAgentCalender(String? id) async {

    // print(userToken);
    final result = await InternetAddress.lookup('youtube.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
      Uri url = Uri.http(ApiConstants.baseUrl, ApiConstants.getAgentCalender);


      Map<String, String> headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $userToken',
      };
      var requestBody = AgentCalenderRequest(
        serviceAgentId : id,
      );
      print('Requested');

      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody.toJson()), // Ensure the request body is properly encoded as JSON
      );
      var agentCalenderResponse = AgentCalenderResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {

        return Right(agentCalenderResponse);
      } else {
        return Left(ServerError(errorMsg: agentCalenderResponse.message));
      }
    } else {
      return Left(NetworkError(errorMsg: 'Please Check Internet Connection'));
    }
  }


  Future<Either<BaseError, ServiceCategoryResponse>> getAllServiceCategory() async {
    final result = await InternetAddress.lookup('youtube.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
      Uri url = Uri.http(ApiConstants.baseUrl, ApiConstants.getAllServiceCategory);
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $userToken',
      };

      var response = await http.get(
        url,
        headers: headers,
      );
      var ServiceCategory = ServiceCategoryResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {

        return Right(ServiceCategory);
      } else {
        return Left(ServerError(errorMsg: ServiceCategory.message));
      }
    } else {
      return Left(NetworkError(errorMsg: 'Please Check Internet Connection'));
    }
  }


  Future<Either<BaseError, ServiceResponse>> getAgentServicebyID(String? id) async {

    final result = await InternetAddress.lookup('youtube.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
      Uri url = Uri.http(ApiConstants.baseUrl, ApiConstants.getAgentServiceById);
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var requestBody = GetByIdRequest(
        id: id,
      );

      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody.toJson()), // Ensure the request body is properly encoded as JSON
      );
      var serviceResponse = ServiceResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(serviceResponse);
      } else {
        return Left(ServerError(errorMsg: serviceResponse.message));
      }
    } else {
      return Left(NetworkError(errorMsg: 'Please Check Internet Connection'));
    }
  }

  Future<Either<BaseError, ServiceProviderResponse>> getServiceProvider(String? id) async {

    final result = await InternetAddress.lookup('youtube.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
      Uri url = Uri.http(ApiConstants.baseUrl, ApiConstants.getAllServiceProvider);
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var requestBody = ProviderRequest(
          categoryId : id,
      );
      print('Requested');

      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody.toJson()), // Ensure the request body is properly encoded as JSON
      );
      print('POSTEDDDDDDDD');

      var serviceProviderResponse = ServiceProviderResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(serviceProviderResponse);
      } else {
        return Left(ServerError(errorMsg: serviceProviderResponse.message));
      }
    } else {
      return Left(NetworkError(errorMsg: 'Please Check Internet Connection'));
    }
  }


  Future<Either<BaseError, ServicesResponse>> getAllService(String? id) async {

    final result = await InternetAddress.lookup('youtube.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
      Uri url = Uri.http(ApiConstants.baseUrl, ApiConstants.getService);
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var requestBody = ServiceRequest(
        providerId : id,
      );
      print('Requested');

      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody.toJson()), // Ensure the request body is properly encoded as JSON
      );
      print('POSTEDDDDDDDD');

      var servicesResponse = ServicesResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(servicesResponse);
      } else {
        return Left(ServerError(errorMsg: servicesResponse.message));
      }
    } else {
      return Left(NetworkError(errorMsg: 'Please Check Internet Connection'));
    }
  }
}