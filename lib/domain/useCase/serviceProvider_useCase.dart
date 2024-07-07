
import 'package:dartz/dartz.dart';
import 'package:flutter_home_screen/data/api/baseError.dart';
import '../../data/api/api_manager.dart';
import '../../data/api/baseError.dart';
import '../../data/repository/dataSource/service_dataSource.dart';
import '../../data/repository/repository/service_repo.dart';
import '../entities/AgentServiceResponseEntity.dart';
import '../entities/ServiceProviderEntity.dart';
import '../repository/dataSource/service_dataSource.dart';
import '../repository/repository/service_repo.dart';

class ServiceProviderUseCase{

  ServiceRepoContract repoContract;
  ServiceProviderUseCase({required this.repoContract});

  Future<Either<BaseError, ServiceProviderEntity>> invoke(String id){
    return repoContract.getServiceProvider(id);
  }

}
ServiceProviderUseCase injectServiceProviderUseCase(){
  return ServiceProviderUseCase(repoContract: injectServiceProviderRepoContract());
}

ServiceRepoContract injectServiceProviderRepoContract(){
  return ServiceRepoImpl(remoteDataSource: injectServiceProviderDatasource());
}

ServiceRemoteDataSource injectServiceProviderDatasource(){
  return ServiceRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}