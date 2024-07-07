
import 'package:dartz/dartz.dart';
import 'package:flutter_home_screen/data/api/baseError.dart';
import '../../data/api/api_manager.dart';
import '../../data/api/baseError.dart';
import '../../data/repository/dataSource/service_dataSource.dart';
import '../../data/repository/repository/service_repo.dart';
import '../entities/AgentServiceResponseEntity.dart';
import '../entities/ServiceEntity.dart';
import '../entities/ServiceProviderEntity.dart';
import '../repository/dataSource/service_dataSource.dart';
import '../repository/repository/service_repo.dart';

class ServiceUseCase{

  ServiceRepoContract repoContract;
  ServiceUseCase({required this.repoContract});

  Future<Either<BaseError, ServiceEntity>> invoke(String id){
    return repoContract.getAllServices(id);
  }

}
ServiceUseCase injectServiceUseCase(){
  return ServiceUseCase(repoContract: injectServiceRepoContract());
}

ServiceRepoContract injectServiceRepoContract(){
  return ServiceRepoImpl(remoteDataSource: injectServiceDatasource());
}

ServiceRemoteDataSource injectServiceDatasource(){
  return ServiceRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}