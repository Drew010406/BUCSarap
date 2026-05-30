import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/models/revenue_model.dart';
import 'package:frontend/providers/transaction_history_provider.dart';
import 'dart:math';
import '../../components/stall_holder/navigation_panel.dart';
import '../../shared/back_button_container.dart';

enum ChartStatus { MONTHLY, WEEKLY, DAILY }

class AnalyticsScreen extends ConsumerStatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  ConsumerState<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends ConsumerState<AnalyticsScreen> {
  ChartStatus _status = ChartStatus.MONTHLY;

  final Color active = Color(0xFFFFC570).withValues(alpha: 0.8);
  final Color inactive = Color(0xFFEFE2D3);

  void _updateStatus(ChartStatus status) {
    _status = status;
  }

  @override
  Widget build(BuildContext context) {
    final monthlyRevenue = ref.watch(monthlyRevenueProvider);
    final weeklyRevenue = ref.watch(weeklyRevenueProvider);
    final dailyRevenue = ref.watch(dailyRevenueProvider);
    final dayComparison = ref.watch(dailyComparisonProvider);
    final weekComparison = ref.watch(weeklyComparisonProvider);
    final monthComparison = ref.watch(monthlyComparisonProvider);
    final lastTenDaysRevenue = ref.watch(tenDaysRevenueProvider);

    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Color(0xFFEFE2D3),
        leadingWidth: 140,
        leading: BackButtonContainer(
          onTap: () {
            Navigator.popUntil(
              context,
              ModalRoute.withName('/stall_holder_screen'),
            );
          },
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/add_product_screen');
        //     },
        //     icon: Icon(Icons.add, color: Color(0xFFDA782B)),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Earnings,", style: kJetbrainsFontTitle),
                      SizedBox(height: 10),
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFC570).withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Color(0xFFEFE2D3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _updateStatus(ChartStatus.MONTHLY);
                                      });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: _status == ChartStatus.MONTHLY
                                            ? active
                                            : inactive,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Monthly",
                                          style: TextStyle(fontFamily: "Flame"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _updateStatus(ChartStatus.WEEKLY);
                                      });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: _status == ChartStatus.WEEKLY
                                            ? active
                                            : inactive,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Weekly",
                                          style: TextStyle(fontFamily: "Flame"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _updateStatus(ChartStatus.DAILY);
                                      });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: _status == ChartStatus.DAILY
                                            ? active
                                            : inactive,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Daily",
                                          style: TextStyle(fontFamily: "Flame"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Expanded(child: SizedBox()),
                            if (_status == ChartStatus.MONTHLY)
                              monthlyRevenue.when(
                                loading: () =>
                                    Center(child: CircularProgressIndicator()),
                                error: (err, stack) => Text("Error: $err"),
                                data: (data) {
                                  if (data.stallRevenue == null ||
                                      data.stallID == null) {
                                    return Center(
                                      child: Text(
                                        "No Revenue data available",
                                        style: kJetbrainsFontTitle.copyWith(
                                          fontSize: 24,
                                        ),
                                      ),
                                    );
                                  }
                                  return IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text.rich(
                                              TextSpan(
                                                text: 'April ',
                                                style: kJetbrainsDescription
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color(0xFF5D371A),
                                                      fontSize: 20,
                                                    ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: '2026',
                                                    style: kJetbrainsDescription
                                                        .copyWith(
                                                          color: Color(
                                                            0xFF5D371A,
                                                          ),
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 20,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                text: '₱ ',
                                                style: kJetbrainsFontTitle,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        '${data.stallRevenue}',
                                                    style: kJetbrainsFontTitle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 30,
                                                  color: Colors.green,
                                                ),
                                                dayComparison.when(
                                                  loading: () => Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                  error: (err, stack) =>
                                                      Text("Error: $err"),
                                                  data: (data) {
                                                    return Text(
                                                      "+${data.percentageChange}% increase",
                                                      style:
                                                          kJetbrainsDescription
                                                              .copyWith(
                                                                color: Colors
                                                                    .green,
                                                                fontSize: 18,
                                                              ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Expanded(child: SizedBox()),
                                      ],
                                    ),
                                  );
                                },
                              )
                            else if (_status == ChartStatus.WEEKLY)
                              weeklyRevenue.when(
                                loading: () =>
                                    Center(child: CircularProgressIndicator()),
                                error: (err, stack) => Text("Error: $err"),
                                data: (data) {
                                  if (data.stallRevenue == null ||
                                      data.stallID == null) {
                                    return Center(
                                      child: Text(
                                        "No Revenue data available",
                                        style: kJetbrainsFontTitle.copyWith(
                                          fontSize: 24,
                                        ),
                                      ),
                                    );
                                  }
                                  return IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text.rich(
                                              TextSpan(
                                                text: 'April ',
                                                style: kJetbrainsDescription
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color(0xFF5D371A),
                                                      fontSize: 20,
                                                    ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: '2026',
                                                    style: kJetbrainsDescription
                                                        .copyWith(
                                                          color: Color(
                                                            0xFF5D371A,
                                                          ),
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 20,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                text: '₱ ',
                                                style: kJetbrainsFontTitle,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        '${data.stallRevenue}',
                                                    style: kJetbrainsFontTitle,
                                                  ),
                                                  TextSpan(
                                                    text: '',
                                                    style: kJetbrainsFontTitle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 30,
                                                  color: Colors.green,
                                                ),
                                                weekComparison.when(
                                                  loading: () => Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                  error: (err, stack) =>
                                                      Text("Error: $err"),
                                                  data: (data) {
                                                    return Text(
                                                      "+${data.percentageChange}% increase",
                                                      style:
                                                          kJetbrainsDescription
                                                              .copyWith(
                                                                color: Colors
                                                                    .green,
                                                                fontSize: 18,
                                                              ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Expanded(child: SizedBox()),
                                      ],
                                    ),
                                  );
                                },
                              )
                            else
                              dailyRevenue.when(
                                loading: () =>
                                    Center(child: CircularProgressIndicator()),
                                error: (err, stack) => Text("Error: $err"),
                                data: (data) {
                                  if (data.stallRevenue == null ||
                                      data.stallID == null) {
                                    return Center(
                                      child: Text(
                                        "No Revenue data available",
                                        style: kJetbrainsFontTitle.copyWith(
                                          fontSize: 24,
                                        ),
                                      ),
                                    );
                                  }
                                  return IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text.rich(
                                              TextSpan(
                                                text: 'April ',
                                                style: kJetbrainsDescription
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color(0xFF5D371A),
                                                      fontSize: 20,
                                                    ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: '2026',
                                                    style: kJetbrainsDescription
                                                        .copyWith(
                                                          color: Color(
                                                            0xFF5D371A,
                                                          ),
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 20,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                text: '₱ ',
                                                style: kJetbrainsFontTitle,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        '${data.stallRevenue}',
                                                    style: kJetbrainsFontTitle,
                                                  ),
                                                  TextSpan(
                                                    text: '',
                                                    style: kJetbrainsFontTitle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 30,
                                                  color: Colors.green,
                                                ),
                                                monthComparison.when(
                                                  loading: () => Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                  error: (err, stack) =>
                                                      Text("Error: $err"),
                                                  data: (data) {
                                                    return Text(
                                                      "+${data.percentageChange}% increase",
                                                      style:
                                                          kJetbrainsDescription
                                                              .copyWith(
                                                                color: Colors
                                                                    .green,
                                                                fontSize: 18,
                                                              ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Expanded(child: SizedBox()),
                                      ],
                                    ),
                                  );
                                },
                              ),

                            Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Text("Income History", style: kJetbrainsFontTitle),
                      SizedBox(height: 10),
                      lastTenDaysRevenue.when(
                        loading: () =>
                            Center(child: CircularProgressIndicator()),
                        error: (err, stack) => Text("Error: $err"),
                        data: (data) {
                          var x = 0.0;
                          final double maxRevenue = data.isEmpty
                              ? 50
                              : data
                              .map((e) => e.dailyRevenue?.toDouble() ?? 0.0)
                              .reduce((a, b) => a > b ? a : b);

                          final double chartMaxY = ((maxRevenue / 10).ceil() * 10 + 10).toDouble();
                          return Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFC570).withValues(alpha: 0.8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 10,
                            ),
                            child: LineChart(
                              // https://www.youtube.com/watch?v=LB7B3zudivI
                              // https://blog.logrocket.com/build-beautiful-charts-flutter-fl-chart/
                              LineChartData(
                                minX: 0,
                                maxX: 9,
                                minY: 0,
                                maxY: chartMaxY,
                                titlesData: FlTitlesData(
                                  show: true,
                                  topTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  rightTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 35,
                                      getTitlesWidget: (value, meta) {
                                        return Text(
                                          '₱${value.toStringAsFixed(0)}',
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontFamily: 'Flame'
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 60,
                                      getTitlesWidget: (value, meta) {
                                        final int index = value.toInt();
                                        if (index < 0 || index >= data.length) return const SizedBox();

                                        final raw = data[index].orderDate ?? '';
                                        final short = raw.replaceAll(RegExp(r',?\s*\d{4}'), '').trim();

                                        return Transform.rotate(
                                          angle: -pi / 4,
                                          child: Text(short, style: const TextStyle(fontSize: 11, fontFamily: 'Flame')),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                gridData: FlGridData(
                                  show: true,
                                  drawHorizontalLine: false,
                                  getDrawingHorizontalLine: (value) {
                                    return FlLine(strokeWidth: 1);
                                  },
                                  drawVerticalLine: false,
                                  getDrawingVerticalLine: (value) {
                                    return FlLine(strokeWidth: 1);
                                  },
                                ),
                                borderData: FlBorderData(
                                  show: true,
                                  border: Border.all(width: 1),
                                ),
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: data
                                        .map(
                                          (item) => FlSpot(
                                            x++,
                                            item.dailyRevenue?.toDouble() ??
                                                0.0,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          NavigationPanel(currentRoute: currentRoute as String),
        ],
      ),
    );
  }
}
