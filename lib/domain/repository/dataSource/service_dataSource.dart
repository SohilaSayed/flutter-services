import 'dart:ffi';

import 'package:dartz/dartz.dart';

import '../../../data/api/baseError.dart';
import '../../entities/AgentServiceResponseEntity.dart';
import '../../entities/ServiceCategoryResponseEntity.dart';
import '../../entities/ServiceEntity.dart';
import '../../entities/ServiceProviderEntity.dart';
import '../../entities/agentCalenderEntity.dart';

abstract class ServiceRemoteDataSource{
  Future<Either<BaseError,ServiceCategoryEntity>>getAllServiceCategory();

  Future<Either<BaseError,ServiceResponseEntity>>getAllAgentService(String? id);

  Future<Either<BaseError,ServiceResponseEntity>>getAgentServiceById(String id);

  Future<Either<BaseError,ServiceProviderEntity>>getServiceProvider(String id);

  Future<Either<BaseError,ServiceEntity>>getAllServices(String id);

  Future<Either<BaseError,AgentCalenderEntity>>getAllAgentCalenders(String id);

}

