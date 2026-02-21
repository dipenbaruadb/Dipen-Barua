import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/app_providers.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/goals/goals_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/transactions/add_transaction_screen.dart';
import '../screens/transactions/transactions_screen.dart';

class TakaManagerApp extends ConsumerStatefulWidget {
  const TakaManagerApp({super.key});

  @override
  ConsumerState<TakaManagerApp> createState() => _TakaManagerAppState();
}

class _TakaManagerAppState extends ConsumerState<TakaManagerApp> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    ref.read(syncEngineProvider).start();
  }

  @override
  Widget build(BuildContext context) {
    final screens = const [
      DashboardScreen(),
      TransactionsScreen(),
      AddTransactionScreen(),
      GoalsScreen(),
      SettingsScreen(),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taka Manager',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('bn'), Locale('en')],
      locale: const Locale('bn'),
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      home: Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (v) => setState(() => index = v),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.dashboard), label: 'ড্যাশবোর্ড'),
            NavigationDestination(icon: Icon(Icons.list_alt), label: 'লেনদেন'),
            NavigationDestination(icon: Icon(Icons.add_circle), label: 'যোগ'),
            NavigationDestination(icon: Icon(Icons.savings), label: 'গোল'),
            NavigationDestination(icon: Icon(Icons.settings), label: 'সেটিংস'),
          ],
        ),
      ),
    );
  }
}
