import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    print('BLOC OBSERVER $bloc');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print('ON CHANGE BLOC OBSERV $bloc $change');
    super.onChange(bloc, change);
  }
}
