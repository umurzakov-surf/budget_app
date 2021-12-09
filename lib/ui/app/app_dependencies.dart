import 'package:budget_app/service/repository/shared_preferences_helper.dart';
import 'package:budget_app/service/repository/transaction_repository.dart';
import 'package:budget_app/ui/app/budget_app.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDependencies extends StatefulWidget {
  final BudgetApp app;

  const AppDependencies({Key? key, required this.app}) : super(key: key);

  @override
  _AppDependenciesState createState() => _AppDependenciesState();
}

class _AppDependenciesState extends State<AppDependencies> {
  final Future<SharedPreferences> sharedPreferencesFuture =
      SharedPreferences.getInstance();
  late SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SharedPreferencesHelper>(
          create: (_) => SharedPreferencesHelper(),
        ),
        Provider<TransactionRepository>(
          create: (_) => TransactionRepository(SharedPreferencesHelper()),
        ),
      ],
      child: widget.app,
    );
  }
}
