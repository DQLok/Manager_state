import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manager_state/core/config/routes/routes.dart';
import 'package:manager_state/features/state/state_builder.dart';
import 'package:manager_state/features/state/state_manager.dart';
import 'package:manager_state/features/state/state_store.dart';
import 'package:manager_state/utils/app_theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final counterStore = StateStore<int>(0);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  StateManager().register('counter', counterStore);
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('vi', 'VN'), const Locale('en', 'US')],
      path: 'assets/translations',
      fallbackLocale: const Locale('vi', 'VI'),
      useOnlyLangCode: true,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manager State',
      debugShowCheckedModeBanner: false,
      initialRoute: RoutePaths.splashRoute,
      theme: getConfigTheme(),
      onGenerateRoute: RouteGenerator.getRoutes,
      navigatorKey: navigatorKey,
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  Future<int> fakeApiFetchCounter() async {
    await Future.delayed(const Duration(seconds: 3));
    return 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('State Management Demo')),
      body: Center(
        child: StateBuilder<int>(
          stateKey: 'counter',
          builder: (context, value) {
            return Text(
              'Counter: $value',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      bottomSheet: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              final store = StateManager().get<int>('counter');
              store.setAsync(fakeApiFetchCounter());
            },
            child: const Icon(Icons.plus_one),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final store = StateManager().get<int>('counter');
          store.set(store.value + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
