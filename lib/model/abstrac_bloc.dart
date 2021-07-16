
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_springboot/views/ui/utils/platforms_utils.dart';

abstract class AbstractBloc<AbstractBlocEvent, AbstractBlocState>
    extends Bloc<AbstractBlocEvent, AbstractBlocState> {
  AbstractBloc(AbstractBlocState initialState) : super(initialState);

  Future<bool> hasConnectivity() async {
    return await PlatformUtils.hasConnectivity() == true;
  }
}
