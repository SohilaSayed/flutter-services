
import 'package:dartz/dartz.dart';
import 'package:flutter_home_screen/data/repository/repository/service_repo.dart';
import '../../data/api/baseError.dart';
import '../../data/api/api_manager.dart';
import '../../data/repository/dataSource/service_dataSource.dart';
import '../entities/AgentServiceResponseEntity.dart';
import '../repository/dataSource/service_dataSource.dart';
import '../repository/repository/service_repo.dart';

class GetAllAgentServiceUseCase{

  ServiceRepoContract repoContract;
  GetAllAgentServiceUseCase({required this.repoContract});

  Future<Either<BaseError, ServiceResponseEntity>> invoke(String? id){
    return repoContract.getAllAgentService(id);
  }

}

GetAllAgentServiceUseCase injectAgentServiceUseCase(){
  return GetAllAgentServiceUseCase(repoContract: injectAgentServiceRepoContract());
}

ServiceRepoContract injectAgentServiceRepoContract(){
  return ServiceRepoImpl(remoteDataSource: injectAgentServiceDatasource());
}

ServiceRemoteDataSource injectAgentServiceDatasource(){
  return ServiceRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}