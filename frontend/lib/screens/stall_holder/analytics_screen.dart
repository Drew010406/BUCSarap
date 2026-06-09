import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/constants.dart';
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
    final List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    DateTime now = DateTime.now();

    int currentYear = now.year;
    int currentMonth = now.month;
    String currentMonthName = months[currentMonth - 1];
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
                      Text("Earnings,", style: kFlameFontTitle),
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
                                                  text: '$currentMonthName ',
                                                  style: kFlameDescription
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Color(
                                                          0xFF5D371A,
                                                        ),
                                                        fontSize: 20,
                                                      ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: '$currentYear',
                                                      style:
                                                          kFlameDescription
                                                              .copyWith(
                                                                color: Color(
                                                                  0xFF5D371A,
                                                                ),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                fontSize: 20,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  text: '₱ ',
                                                  style: kFlameFontTitle,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text:
                                                          '0.0',
                                                      style:
                                                          kFlameFontTitle,
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
                                                  Text(
                                                    "+0.0% increase",
                                                    style: kFlameDescription
                                                        .copyWith(
                                                          color: Colors.green,
                                                          fontSize: 18,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Expanded(child: SizedBox()),
                                        ],
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
                                                text: '$currentMonthName ',
                                                style: kFlameDescription
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color(0xFF5D371A),
                                                      fontSize: 20,
                                                    ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: '$currentYear',
                                                    style: kFlameDescription
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
                                                style: kFlameFontTitle,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        '${data.stallRevenue}',
                                                    style: kFlameFontTitle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            monthComparison.when(
                                              loading: () => Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              error: (err, stack) =>
                                                  Text("Error: $err"),
                                              data: (data) {
                                                return Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      data.percentageChange! > 0
                                                          ? Icons.arrow_drop_up
                                                          : Icons
                                                                .arrow_drop_down,
                                                      size: 30,
                                                      color:
                                                          data.percentageChange! >
                                                              0
                                                          ? Colors.green
                                                          : Colors.red,
                                                    ),
                                                    Text(
                                                      data.percentageChange! >
                                                              0.0
                                                          ? "+${data.percentageChange}% increase"
                                                          : "${data.percentageChange}% decrease",
                                                      style: kFlameDescription
                                                          .copyWith(
                                                            color:
                                                                data.percentageChange! >
                                                                    0
                                                                ? Colors.green
                                                                : Colors.red,
                                                            fontSize: 18,
                                                          ),
                                                    ),
                                                  ],
                                                );
                                              },
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
                                                  text: '$currentMonthName ',
                                                  style: kFlameDescription
                                                      .copyWith(
                                                    fontWeight:
                                                    FontWeight.w900,
                                                    color: Color(
                                                      0xFF5D371A,
                                                    ),
                                                    fontSize: 20,
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: '$currentYear',
                                                      style:
                                                      kFlameDescription
                                                          .copyWith(
                                                        color: Color(
                                                          0xFF5D371A,
                                                        ),
                                                        fontWeight:
                                                        FontWeight
                                                            .w900,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  text: '₱ ',
                                                  style: kFlameFontTitle,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text:
                                                      '0.0',
                                                      style:
                                                      kFlameFontTitle,
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
                                                  Text(
                                                    "+0.0% increase",
                                                    style: kFlameDescription
                                                        .copyWith(
                                                      color: Colors.green,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Expanded(child: SizedBox()),
                                        ],
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
                                                text: '$currentMonthName ',
                                                style: kFlameDescription
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color(0xFF5D371A),
                                                      fontSize: 20,
                                                    ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: '$currentYear',
                                                    style: kFlameDescription
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
                                                style: kFlameFontTitle,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        '${data.stallRevenue}',
                                                    style: kFlameFontTitle,
                                                  ),
                                                  TextSpan(
                                                    text: '',
                                                    style: kFlameFontTitle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            weekComparison.when(
                                              loading: () => Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              error: (err, stack) =>
                                                  Text("Error: $err"),
                                              data: (data) {
                                                return Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      data.percentageChange! > 0
                                                          ? Icons.arrow_drop_up
                                                          : Icons
                                                                .arrow_drop_down,
                                                      size: 30,
                                                      color:
                                                          data.percentageChange! >
                                                              0
                                                          ? Colors.green
                                                          : Colors.red,
                                                    ),
                                                    Text(
                                                      data.percentageChange! >
                                                              0.0
                                                          ? "+${data.percentageChange}% increase"
                                                          : "${data.percentageChange}% decrease",
                                                      style: kFlameDescription
                                                          .copyWith(
                                                            color:
                                                                data.percentageChange! >
                                                                    0
                                                                ? Colors.green
                                                                : Colors.red,
                                                            fontSize: 18,
                                                          ),
                                                    ),
                                                  ],
                                                );
                                              },
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
                                                  text: '$currentMonthName ',
                                                  style: kFlameDescription
                                                      .copyWith(
                                                    fontWeight:
                                                    FontWeight.w900,
                                                    color: Color(
                                                      0xFF5D371A,
                                                    ),
                                                    fontSize: 20,
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: '$currentYear',
                                                      style:
                                                      kFlameDescription
                                                          .copyWith(
                                                        color: Color(
                                                          0xFF5D371A,
                                                        ),
                                                        fontWeight:
                                                        FontWeight
                                                            .w900,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  text: '₱ ',
                                                  style: kFlameFontTitle,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text:
                                                      '0.0',
                                                      style:
                                                      kFlameFontTitle,
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
                                                  Text(
                                                    "+0.0% increase",
                                                    style: kFlameDescription
                                                        .copyWith(
                                                      color: Colors.green,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Expanded(child: SizedBox()),
                                        ],
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
                                                text: '$currentMonthName ',
                                                style: kFlameDescription
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color(0xFF5D371A),
                                                      fontSize: 20,
                                                    ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: '$currentYear',
                                                    style: kFlameDescription
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
                                                style: kFlameFontTitle,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        '${data.stallRevenue}',
                                                    style: kFlameFontTitle,
                                                  ),
                                                  TextSpan(
                                                    text: '',
                                                    style: kFlameFontTitle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            dayComparison.when(
                                              loading: () => Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              error: (err, stack) =>
                                                  Text("Error: $err"),
                                              data: (data) {
                                                return Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      data.percentageChange! > 0
                                                          ? Icons.arrow_drop_up
                                                          : Icons
                                                                .arrow_drop_down,
                                                      size: 30,
                                                      color:
                                                          data.percentageChange! >
                                                              0
                                                          ? Colors.green
                                                          : Colors.red,
                                                    ),
                                                    Text(
                                                      data.percentageChange! >
                                                              0.0
                                                          ? "+${data.percentageChange}% increase"
                                                          : "${data.percentageChange}% decrease",
                                                      style: kFlameDescription
                                                          .copyWith(
                                                            color:
                                                                data.percentageChange! >
                                                                    0
                                                                ? Colors.green
                                                                : Colors.red,
                                                            fontSize: 18,
                                                          ),
                                                    ),
                                                  ],
                                                );
                                              },
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
                      Text("Income History", style: kFlameFontTitle),
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
                                    .map(
                                      (e) => e.dailyRevenue?.toDouble() ?? 0.0,
                                    )
                                    .reduce((a, b) => a > b ? a : b);

                          final double chartMaxY =
                              ((maxRevenue / 10).ceil() * 10 + 10).toDouble();
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
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0, top: 15.0, bottom: 5.0),
                              child: LineChart(
                                LineChartData(
                                  minX: 0,
                                  maxX: 9,
                                  minY: 0,
                                  maxY: chartMaxY,
                                  lineTouchData: LineTouchData(
                                    touchTooltipData: LineTouchTooltipData(
                                      getTooltipColor: (LineBarSpot touchedSpot) => Colors.brown.withValues(alpha: 0.8),
                                      getTooltipItems: (List<LineBarSpot> touchedSpots) {
                                        return touchedSpots.map((LineBarSpot touchedSpot) {
                                          return LineTooltipItem(
                                            '₱${touchedSpot.y.toStringAsFixed(0)}',
                                            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                          );
                                        }).toList();
                                      },
                                    ),
                                    handleBuiltInTouches: true,
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    topTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    rightTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 45,
                                        getTitlesWidget: (value, meta) {
                                          return Text(
                                            '₱${value.toStringAsFixed(0)}',
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontFamily: 'Flame',
                                              color: Color(0xFF5D371A),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 45,
                                        interval: 1,
                                        getTitlesWidget: (value, meta) {
                                          final int index = value.toInt();
                                          if (index < 0 || index >= data.length) {
                                            return const SizedBox();
                                          }

                                          final raw = data[index].orderDate ?? '';
                                          final short = raw
                                              .replaceAll(
                                                RegExp(r',?\s*\d{4}'),
                                                '',
                                              )
                                              .trim();

                                          return SideTitleWidget(
                                            meta: meta,
                                            space: 10,
                                            child: Transform.rotate(
                                              angle: -pi / 4,
                                              child: Text(
                                                short,
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Flame',
                                                  color: Color(0xFF5D371A),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  gridData: FlGridData(
                                    show: true,
                                    drawHorizontalLine: true,
                                    drawVerticalLine: false,
                                    getDrawingHorizontalLine: (value) {
                                      return FlLine(
                                        color: const Color(0xFFDA782B).withValues(alpha: 0.2),
                                        strokeWidth: 1,
                                        dashArray: [5, 5],
                                      );
                                    },
                                  ),
                                  borderData: FlBorderData(
                                    show: true,
                                    border: const Border(
                                      bottom: BorderSide(color: Color(0xFFDA782B), width: 2),
                                      left: BorderSide(color: Color(0xFFDA782B), width: 2),
                                      right: BorderSide(color: Colors.transparent),
                                      top: BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                  lineBarsData: [
                                    LineChartBarData(
                                      color: const Color(0xFFDA782B),
                                      barWidth: 3,
                                      isCurved: true,
                                      curveSmoothness: 0.3,
                                      preventCurveOverShooting: true,
                                      dotData: FlDotData(
                                        show: true,
                                        getDotPainter: (spot, percent, barData, index) {
                                          return FlDotCirclePainter(
                                            radius: 3,
                                            color: const Color(0xFFDA782B),
                                            strokeWidth: 1.5,
                                            strokeColor: Colors.white,
                                          );
                                        },
                                      ),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(0xFFDA782B).withValues(alpha: 0.4),
                                            const Color(0xFFDA782B).withValues(alpha: 0.0),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
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
