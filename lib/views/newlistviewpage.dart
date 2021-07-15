
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_springboot/model/bloc_state.dart';
import 'package:flutter_springboot/model/employeelist/employee_list_bloc.dart';
import 'package:flutter_springboot/network/list/employee_list_content_response_dto.dart';
import 'package:flutter_springboot/network/list/employee_list_response_dto.dart';

import 'package:flutter_springboot/model/abstract_state.dart';
import 'package:flutter_springboot/views/ui/ui_helper.dart';
import 'package:provider/provider.dart';

class EmployeeListNormalView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScreenState();
}

class _ScreenState
    extends AbstractState<EmployeeListBloc, EmployeeListNormalView> {
  List<EmployeeListContentResponseDto>? _list;

  @override
  void initState() {
    super.initState();
    getBloc!.add(RetrieveEmployeeListBlocEvent());
  }

  @override
  EmployeeListBloc provideBloc() {
    return EmployeeListBloc();
  }

  @override
  Widget buildWidget(BuildContext context, AbstractBlocState state) {
    var body;
    if (state is OnSuccessState<EmployeeListResponseDto>) {
      if (state.id == OnSuccessState.EMPLOYEE_LIST) {
        _list = state.data.content;

        body = ListView.builder(
            itemCount: state.data.content.length,
            itemBuilder: (context, index) {
              final item = state.data.content[index];
              return Dismissible(
                // Each Dismissible must contain a Key. Keys allow Flutter to
                // uniquely identify widgets.
                key: Key(item.employeeId.toString()),
                // Provide a function that tells the app
                // what to do after an item has been swiped away.
                onDismissed: (direction) {
                  // Remove the item from the data source.
                  setState(() {
                    _list!.removeAt(index);
                  });

                  getBloc!.add(DeleteEmployeeBlocEvent(item.id));
                  // Then show a snackbar.
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("$item dismissed")));
                },

                // Show a red background as the item is swiped away.
                background: Container(
                    color: Colors.white70),
                child: _listViewItem(item),
              );
            });
      }
    } else {
      body = Container();
    }

    return PlatformScaffold(
        material: (_, __) => MaterialScaffoldData(
            resizeToAvoidBottomInset: false,
            floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  var results = await Navigator.pushNamed(
                      context, "/employeeInsertScreen");
                  if (results != null) {
                    getBloc!.add(RetrieveEmployeeListBlocEvent());
                  }
                },
                child: const Icon(Icons.add),
                backgroundColor:
                    Colors.blue)),
        cupertino: (_, __) => CupertinoPageScaffoldData(
                navigationBar: CupertinoNavigationBar(
              trailing: Icon(CupertinoIcons.add),
            )),
        backgroundColor: Colors.white,
        appBar: PlatformAppBar(
          title: Text("Employee List"),
          backgroundColor: Colors.blue,
        ),
        body: body);
  }

  Widget _listViewItem(EmployeeListContentResponseDto item) {
    return  Card(
        child: ListTile(
          leading: InkWell(
            child: Icon(Icons.account_circle_outlined),
            onTap: () => {
              Navigator.pushNamed(context, "/employeeDetailScreen",
                  arguments: item)
            },
          ),
          trailing: InkWell(
            child: Icon(Icons.border_color_outlined),
            onTap: () => {
              Navigator.pushNamed(context, "/employeeUpdateScreen",
                  arguments: item),
            
            },
          ),
          title: Text("${item.surname} ${item.name}",
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle:
              Text("${item.email}", style: TextStyle(fontSize: 10)),
        ),
      
    );
  }

  @override
  BlocWidgetListener<AbstractBlocState> provideBlocListener(
      BuildContext context) {
    return (context, state) {
      if (state is LoadingState) {
        showDialog(
            context: context, builder: UiDialogHelper.loadingDialog(context));
      }

      if (state is OnSuccessState) {
        Navigator.pop(context);

        if (state.id == OnSuccessState.EMPLOYEE_DELETE) {
          getBloc!.add(RetrieveEmployeeListBlocEvent());
        }
      }

      if (state is OnErrorState) {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: UiDialogHelper.errorAlertDialog(context, state.message));
      }
    };
  }
}