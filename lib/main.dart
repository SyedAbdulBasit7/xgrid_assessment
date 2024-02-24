
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/app_view.dart';
import 'app/multi_provider_list.dart';
import 'services/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    setupDI();
  return runApp(
     MultiProvider(
          providers: ProviderList().initList(),
          child: const MyApp(),
        ),
    );
}
