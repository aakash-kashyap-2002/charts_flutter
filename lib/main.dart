import 'package:charts_flutter/widgets/cartesian_chart.dart';
import 'package:charts_flutter/widgets/live_chart.dart';
import 'package:charts_flutter/widgets/pie_chart.dart';
import 'package:charts_flutter/widgets/radial_chart.dart';
import 'package:flutter/material.dart';

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Graphs',
      debugShowCheckedModeBanner: false,
      //home: CartesianChartWidget(),
      //home: PieChartWidget(),
      //home: RadialChartWidget(),
      home: LiveChartWidget(),
    );
  }
}