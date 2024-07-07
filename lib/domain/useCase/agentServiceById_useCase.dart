
import 'package:dartz/dartz.dart';
import 'package:flutter_home_screen/data/api/baseError.dart';
import '../../data/api/api_manager.dart';
import '../../data/api/baseError.dart';
import '../../data/repository/dataSource/service_dataSource.dart';
import '../../data/repository/repository/service_repo.dart';
import '../entities/AgentServiceResponseEntity.dart';
import '../repository/dataSource/service_dataSource.dart';
import '../repository/repository/service_repo.dart';

class SpecificAgentServiceUseCase{

  ServiceRepoContract repoContract;
  SpecificAgentServiceUseCase({required this.repoContract});

  Future<Either<BaseError, ServiceResponseEntity>> invoke(String id){
    return repoContract.getAgentServiceById(id);
  }

}
SpecificAgentServiceUseCase injectSpecificAgentServiceUseCase(){
  return SpecificAgentServiceUseCase(repoContract: injectAgentServiceByIdeRepoContract());
}

ServiceRepoContract injectAgentServiceByIdeRepoContract(){
  return ServiceRepoImpl(remoteDataSource: injectAgentServiceByIdDatasource());
}

ServiceRemoteDataSource injectAgentServiceByIdDatasource(){
  return ServiceRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}