import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/screens/stall_holder/order_info_modal.dart';
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

void main() {
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
      initialRoute: '/add_name',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/stall_selection': (context) => StallSelectionScreen(),
        '/login': (context) => LoginScreen(),
        '/category_screen': (context) => CategoryScreen(),
        '/menu_screen': (context) => MenuScreen(),
        '/cart_screen': (context) => CartScreen(),
        '/stall_holder_screen': (context) =>StallHolderScreen(),
        '/add_product_screen': (context) => AddProductScreen(),
        '/queue_screen': (context) => QueueScreen(),
        '/analytics_screen': (context) => AnalyticsScreen(),
        '/history_screen': (context) => TransactionHistoryScreen(),
        '/order_successful': (context) => OrderSuccessfulScreen(),
        '/add_name': (context) => AddNameModal(),
        '/order_info': (context) =>  OrderInfoModal()
      },
    );
  }
}
