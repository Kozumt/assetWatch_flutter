import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/student_reports_screen.dart';
import 'screens/create_report_screen.dart';
import 'screens/edit_report_screen.dart';
import 'screens/admin_reports_screen.dart';
import 'screens/admin_update_status_screen.dart';
import 'screens/admin_report_details_screen.dart';
import 'screens/admin_users_screen.dart';

void main() {
  runApp(const AssetWatchApp());
}

class AssetWatchApp extends StatelessWidget {
  const AssetWatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCC AssetWatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E88E5)),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/user_dashboard': (context) => const StudentReportsScreen(),
        '/student_reports': (context) => const StudentReportsScreen(),
        '/create_report': (context) => const CreateReportScreen(),
        '/edit_report': (context) => const EditReportScreen(),
        '/admin_reports': (context) => const AdminReportsScreen(),
        '/admin_update_status': (context) => const AdminUpdateStatusScreen(),
        '/admin_report_details': (context) => const AdminReportDetailsScreen(),
        '/admin_users': (context) => const AdminUsersScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      },
    );
  }
}