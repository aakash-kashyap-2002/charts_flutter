import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieData {
  PieData({required this.xData, required this.yData});
  final String xData;
  final num yData;
}

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  State<PieChartWidget> createState() => _PieChartWidget();
}

class _PieChartWidget extends State<PieChartWidget> {
  final List<PieData> chartData = [
    PieData(xData: 'Mircosoft', yData: 90000),
    PieData(xData: 'Google', yData: 70000),
    PieData(xData: 'TCS', yData: 30000),
    PieData(xData: 'Wipro', yData: 95000),
    PieData(xData: 'Amdocs', yData: 75000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Pie Chart')),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        margin: const EdgeInsets.all(10),
        child: SfCircularChart(
          title: const ChartTitle(text: 'Sales Data'),
          legend: const Legend(isVisible: true, position: LegendPosition.right),
          backgroundColor: Colors.black,
          palette: const[Colors.blueAccent, Colors.deepPurple,Colors.greenAccent,Colors.amber,Colors.red], //List<Colors>
          series: [
            PieSeries<PieData,String>(
              dataSource: chartData,
              xValueMapper: (PieData piedata, _) => piedata.xData,
              yValueMapper: (PieData piedata, _) => piedata.yData,
              legendIconType: LegendIconType.diamond,
              radius: '100', //to select radius of the pie chart
              explode: true, //to explode a section
              explodeIndex: 2, //to explode index 2
              //dataLabelSettings: DataLabelSettings(isVisible: true),  //to show values in each section
            ),
          ],
        ),
      ),
    );
  }
}
