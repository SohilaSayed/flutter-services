import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_home_screen/domain/entities/ServiceCategoryResponseEntity.dart';
import 'package:flutter_home_screen/domain/entities/ServiceEntity.dart';
import 'package:flutter_home_screen/domain/entities/ServiceProviderEntity.dart';
import 'package:flutter_home_screen/domain/entities/agentCalenderEntity.dart';

import '../../../data/api/baseError.dart';
import '../../../domain/entities/AgentServiceResponseEntity.dart';
import '../../../domain/repository/dataSource/service_dataSource.dart';
import '../../api/api_manager.dart';

class ServiceRemoteDataSourceImpl implements ServiceRemoteDataSource {
  ApiManager apiManager;

  ServiceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<BaseError, ServiceResponseEntity>> getAllAgentService(String? id) async {
    var either = await apiManager.getAgentService(id);
    return either.fold((l) {
      return Left(BaseError(errorMsg: l.errorMsg));
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<BaseError, ServiceResponseEntity>> getAgentServiceById(
      String id) async {
    var either = await apiManager.getAgentServicebyID(id);
    return either.fold((l) {
      return Left(BaseError(errorMsg: l.errorMsg));
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<BaseError, ServiceCategoryEntity>> getAllServiceCategory()async {
    var either = await apiManager.getAllServiceCategory();
    return either.fold((l) {
      return Left(BaseError(errorMsg: l.errorMsg));
    }, (response) {
      return Right(response);
    });
  }


  @override
  Future<Either<BaseError, ServiceProviderEntity>> getServiceProvider(String id)async {
    var either = await apiManager.getServiceProvider(id);
    return either.fold((l) {
      return Left(BaseError(errorMsg: l.errorMsg));
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<BaseError, ServiceEntity>> getAllServices(String id) async {
    var either = await apiManager.getAllService(id);
    return either.fold((l) {
      return Left(BaseError(errorMsg: l.errorMsg));
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<BaseError, AgentCalenderEntity>> getAllAgentCalenders(String id) async{
    var either = await apiManager.getAllAgentCalender(id);
    return either.fold((l) {
      return Left(BaseError(errorMsg: l.errorMsg));
    }, (response) {
      return Right(response);
    });
  }
}

