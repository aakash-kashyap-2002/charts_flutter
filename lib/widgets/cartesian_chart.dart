import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesData {
  SalesData({required this.year, required this.sales, required this.color});

  final int year;
  final double sales;
  final Color color;
}

class CartesianChartWidget extends StatefulWidget {
  const CartesianChartWidget({super.key});

  @override
  State<CartesianChartWidget> createState() => _CartesianChartWidget();
}

class _CartesianChartWidget extends State<CartesianChartWidget> {
  final List<SalesData> chartData = [
    SalesData(year: 2001, sales: 34000, color: Colors.red),
    SalesData(year: 2002, sales: 36000, color: Colors.green),
    SalesData(year: 2003, sales: 30000, color: Colors.purple),
    SalesData(year: 2004, sales: 38000, color: Colors.brown),
    SalesData(year: 2005, sales: 31000, color: Colors.orange),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Cartesian Chart'),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height*0.4,
        margin: const EdgeInsets.all(10),
        child: SfCartesianChart(
          legend: const Legend(isVisible: true),
          title: const ChartTitle(text: 'Sales Data'),
          series: [
            //LineSeries - BarSeries - SplineSeries - AreaSeries - ColumnSeries - WaterfallSeries
            WaterfallSeries<SalesData,int>(
              dataSource: chartData,
              xValueMapper: (SalesData sales, _) => sales.year, 
              yValueMapper: (SalesData sales, _) => sales.sales,
              legendItemText: 'Sales',
              legendIconType: LegendIconType.circle,
              //color: Colors.amber,
              pointColorMapper: (SalesData sales, _) => sales.color,
              dashArray: const [5,5], //to create a dashed line in graph
            ),
          ],
        ),
      ),
    );
  }
}
