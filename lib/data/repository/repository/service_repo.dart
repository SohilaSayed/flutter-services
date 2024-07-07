import 'dart:ffi';


import 'package:dartz/dartz.dart';
import 'package:flutter_home_screen/domain/entities/ServiceCategoryResponseEntity.dart';
import 'package:flutter_home_screen/domain/entities/ServiceEntity.dart';
import 'package:flutter_home_screen/domain/entities/ServiceProviderEntity.dart';
import 'package:flutter_home_screen/domain/entities/agentCalenderEntity.dart';

import '../../../data/api/baseError.dart';
import '../../../domain/entities/AgentServiceResponseEntity.dart';
import '../../../domain/repository/dataSource/service_dataSource.dart';
import '../../../domain/repository/repository/service_repo.dart';


class ServiceRepoImpl implements ServiceRepoContract {
  ServiceRemoteDataSource remoteDataSource;

  ServiceRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<BaseError, ServiceResponseEntity>> getAllAgentService(String? id) {
    return remoteDataSource.getAllAgentService(id);
  }

  @override
  Future<Either<BaseError, ServiceResponseEntity>> getAgentServiceById(
      String id) {
    return remoteDataSource.getAgentServiceById(id);
  }

  @override
  Future<Either<BaseError, ServiceCategoryEntity>> getAllServiceCategory() {
    return remoteDataSource.getAllServiceCategory();

  }

  @override
  Future<Either<BaseError, ServiceProviderEntity>> getServiceProvider(String id) {
    return remoteDataSource.getServiceProvider(id);

  }

  @override
  Future<Either<BaseError, ServiceEntity>> getAllServices(String id) {
    return remoteDataSource.getAllServices(id);
  }

  @override
  Future<Either<BaseError, AgentCalenderEntity>> getAllAgentCalenders(String id) {
    return remoteDataSource.getAllAgentCalenders(id);

  }
}