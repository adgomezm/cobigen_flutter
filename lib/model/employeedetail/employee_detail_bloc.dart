
import 'package:dio/dio.dart';
import 'package:flutter_springboot/model/abstrac_bloc.dart';
import 'package:flutter_springboot/model/bloc_event.dart';
import 'package:flutter_springboot/model/bloc_state.dart';
import 'package:flutter_springboot/model/repository/employee_list_repository.dart';
import 'package:flutter_springboot/network/list/utils/safeprint.dart';

class EmployeeDetailBloc
    extends AbstractBloc<AbstractBlocEvent, AbstractBlocState> {
  EmployeeDetailBloc() : super(EmptyInitialState());

  @override
  Stream<AbstractBlocState> mapEventToState(AbstractBlocEvent event) async* {
    try {
      if (await hasConnectivity()) {
        if (event is RetrieveEmployeeDetailBlocEvent) {
          yield LoadingState();

          var repository = EmployeeRepository();
          var response = await repository.getDetail(event.id);
          yield OnSuccessState(OnSuccessState.EMPLOYEE_DETAIL, response);
        }
        // if (event is DeleteEmployeeBlocEvent) {
        //   yield LoadingState();

        //   var repository = EmployeeRepository();
        //   var response = await repository.delete(event.id);
        //   yield OnSuccessState(OnSuccessState.EMPLOYEE_DELETE, response);
        // }
      } else {
        yield NoConnectivityState();
      }
    } catch (e) {
      safePrint(e);
      if (e is DioError) {
        var statusCode = e.response!.statusCode;
        var statusMessage = e.response!.statusMessage;
        safePrint('$statusCode - $statusMessage');
      }

      yield OnErrorState(
          OnErrorState.GENERIC_ERROR_CODE, OnErrorState.GENERIC_ERROR_MESSAGE);
    }
  }
}

class RetrieveEmployeeDetailBlocEvent extends AbstractBlocEvent {
  final int id;

  RetrieveEmployeeDetailBlocEvent(this.id);

  @override
  List<Object> get props => [id];
}

class DeleteEmployeeBlocEvent extends AbstractBlocEvent {
  final int id;

  DeleteEmployeeBlocEvent(this.id);

  @override
  List<Object> get props => [id];
}
