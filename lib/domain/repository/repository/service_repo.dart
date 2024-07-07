import 'dart:ffi';


import 'package:dartz/dartz.dart';
import 'package:flutter_home_screen/domain/entities/agentCalenderEntity.dart';
import '../../../data/api/baseError.dart';
import '../../entities/AgentServiceResponseEntity.dart';
import '../../entities/ServiceCategoryResponseEntity.dart';
import '../../entities/ServiceEntity.dart';
import '../../entities/ServiceProviderEntity.dart';

abstract class ServiceRepoContract{
  Future<Either<BaseError,ServiceCategoryEntity>>getAllServiceCategory();

  Future<Either<BaseError,ServiceResponseEntity>>getAllAgentService(String? id);

  Future<Either<BaseError,ServiceResponseEntity>>getAgentServiceById(String id);

  Future<Either<BaseError,ServiceProviderEntity>>getServiceProvider(String id);

  Future<Either<BaseError,ServiceEntity>>getAllServices(String id);

  Future<Either<BaseError,AgentCalenderEntity>>getAllAgentCalenders(String id);

}