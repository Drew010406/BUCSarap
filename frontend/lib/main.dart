import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/screens/stall_holder/add_category_screen.dart';
import 'package:frontend/screens/stall_holder/stall_category_screen.dart';
import 'package:frontend/screens/stall_holder/stall_product_screen.dart';
import 'package:frontend/screens/student/add_name_modal.dart';
import 'package:frontend/screens/student/cart_screen.dart';
import 'package:frontend/screens/student/category_screen.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/student/menu_screen.dart';
import 'package:frontend/screens/student/order_successful_screen.dart';
import 'package:frontend/screens/stall_holder/add_product_screen.dart';
import 'package:frontend/screens/stall_holder/analytics_screen.dart';
import 'package:frontend/screens/stall_holder/queue_screen.dart';
import 'package:frontend/screens/stall_holder/stall_holder_screen.dart';
import 'package:frontend/screens/stall_holder/transaction_history_screen.dart';
import 'package:frontend/screens/student/stall_selection_screen.dart';
import 'package:frontend/screens/welcome_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  String? url = dotenv.env['SUPABASE_URL'];
  String? anonKey = dotenv.env['ANON_KEY'];
  await Supabase.initialize(url: url!, anonKey: anonKey!);

  runApp(const ProviderScope(child: Main()));
}

class Main extends StatelessWidget {
  const Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFEFE2D3)),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/stall_selection': (context) => StallSelectionScreen(),
        '/login': (context) => LoginScreen(),
        '/category_screen': (context) => CategoryScreen(),
        '/menu_screen': (context) => MenuScreen(),
        '/cart_screen': (context) => CartScreen(),
        '/add_name': (context) => AddNameModal(),
        // Stall Holders Screens
        '/stall_holder_screen': (context) =>StallHolderScreen(),
        '/add_product_screen': (context) => AddProductScreen(),
        '/queue_screen': (context) => QueueScreen(),
        '/analytics_screen': (context) => AnalyticsScreen(),
        '/history_screen': (context) => TransactionHistoryScreen(),
        '/order_successful': (context) => OrderSuccessfulScreen(),
        '/stall_category': (context) => StallCategoryScreen(),
        '/stall_product': (context) => StallProductScreen(),
        '/add_category': (context) => AddCategoryScreen(),
      },
    );
  }
}
