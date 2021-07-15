
import 'package:flutter_springboot/model/abstrac_bloc.dart';
import 'package:flutter_springboot/model/bloc_event.dart';
import 'package:flutter_springboot/model/bloc_state.dart';
import 'package:flutter_springboot/model/repository/employee_list_repository.dart';


class EmployeeListBloc
    extends AbstractBloc<AbstractBlocEvent, AbstractBlocState> {
  EmployeeListBloc() : super(EmptyInitialState());

  @override
  Stream<AbstractBlocState> mapEventToState(AbstractBlocEvent event) async* {
    try {
      if (await hasConnectivity()) {
        // if (event is DeleteEmployeeBlocEvent) {
        //   yield LoadingState();

        //   var repository = EmployeeListRepository();
        //   await repository.delete(event.id);
        //   yield OnSuccessState(OnSuccessState.EMPLOYEE_DELETE, true);
        // }

        if (event is RetrieveEmployeeListBlocEvent) {
          yield LoadingState();

          var repository = EmployeeListRepository();
          var response = await repository.getData(15, 0);
          yield OnSuccessState(OnSuccessState.EMPLOYEE_LIST, response);
        }
      } else {
        yield NoConnectivityState();
      }
    } catch (_) {
      print("generic error"); 

      yield OnErrorState(
          OnErrorState.GENERIC_ERROR_CODE, OnErrorState.GENERIC_ERROR_MESSAGE);
    }
  }
}

class RetrieveEmployeeListBlocEvent extends AbstractBlocEvent {
  @override
  List<Object> get props => [];
}

class DeleteEmployeeBlocEvent extends AbstractBlocEvent {
  final int id;

  DeleteEmployeeBlocEvent(this.id);

  @override
  List<Object> get props => [id];
}
