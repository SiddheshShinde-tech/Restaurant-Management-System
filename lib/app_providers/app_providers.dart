import 'package:isdp/core_notifiers/authenticaiton_notifier.dart';
import 'package:isdp/core_notifiers/database_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => AuthNotifier()),
    // ChangeNotifierProvider(create: (_) => DatabaseNotifier())
  ];
}
