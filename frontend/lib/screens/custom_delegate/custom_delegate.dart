import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/models/transaction_history_model.dart';

import '../../shared/back_button_container.dart';

// Source-sogon: https://www.geeksforgeeks.org/flutter/flutter-search-bar/
class CustomSearchDelegate extends SearchDelegate<TransactionHistoryModel?> {
  final List<TransactionHistoryModel>? data;
  final Future<void> Function(
    BuildContext context,
    TransactionHistoryModel item,
  )
  onItemTap;

  CustomSearchDelegate({required this.data, required this.onItemTap});

  List<TransactionHistoryModel> _getMatches() {
    if (data == null) return [];
    return data!.where((item) {
      final q = query.toLowerCase();
      return (item.orderNumber ?? '').toLowerCase().contains(q) ||
          (item.customerName ?? '').toLowerCase().contains(q);
    }).toList();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFEFE2D3),
        elevation: 0,
        toolbarHeight: 110,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.black38,
          fontFamily: 'Flame',
          fontSize: 16,
        ),
        border: InputBorder.none,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: Colors.black,
          fontFamily: 'Flame',
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear), color: Color(0xFFDA782B),),
  ];

  @override
  Widget? buildLeading(BuildContext context) =>
      BackButtonContainer(onTap: () => close(context, null));

  @override
  Widget buildResults(BuildContext context) => _buildList(context);

   @override
  Widget buildSuggestions(BuildContext context) => _buildList(context);

  Widget _buildList(BuildContext context) {
    final matches = _getMatches();

    if (matches.isEmpty) {
      return const Center(child: Text('No results found.'));
    }

    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (context, index) {
        final item = matches[index];
        return InkWell(
          onTap: () => onItemTap(context, item),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFFFC570),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey.shade100),
            ),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.customerName ?? '',
                      style: const TextStyle(
                        fontSize: 19,
                        fontFamily: 'Flame',
                        fontWeight: FontWeight.w500,
                        color: Colors.brown,
                      ),
                    ),
                    Text(
                      item.orderNumber ?? '',
                      style: kJetbrainsDescription.copyWith(
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
