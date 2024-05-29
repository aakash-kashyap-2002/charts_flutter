import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialData {
  RadialData({required this.xData, required this.yData});
  final String xData;
  final num yData;
}

class RadialChartWidget extends StatefulWidget {
  const RadialChartWidget({super.key});
  @override
  State<RadialChartWidget> createState() => _RadialChartWidget();
}

class _RadialChartWidget extends State<RadialChartWidget> {
  final List<RadialData> chartData = [
    RadialData(xData: 'Mircosoft', yData: 90000),
    RadialData(xData: 'Google', yData: 70000),
    RadialData(xData: 'TCS', yData: 30000),
    RadialData(xData: 'Wipro', yData: 95000),
    RadialData(xData: 'Amdocs', yData: 75000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Radial Chart'),),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height*0.3,
        child: SfCircularChart(
          title: const ChartTitle(text: 'Sales Data'),
          legend: const Legend(isVisible: true, position: LegendPosition.right),
          backgroundColor: Colors.lightGreen,
          palette: const[Colors.blueAccent, Colors.deepPurple,Colors.greenAccent,Colors.amber,Colors.red], //List<Colors>
          series: [
            //RadialBarSeries - DoughnutSeries
            RadialBarSeries<RadialData,String>(
              dataSource: chartData,
              xValueMapper: (RadialData radialdata, _) => radialdata.xData, 
              yValueMapper: (RadialData radialdata, _) => radialdata.yData, 
              legendIconType: LegendIconType.seriesType,
              radius: '90%', //to select radius of the radial chart
              innerRadius: '40%', //to select inner circle radius of the radial chart
              // trackColor: Colors.grey,
              //gap: '2',
              cornerStyle: CornerStyle.bothCurve,
              // dataLabelSettings: const DataLabelSettings(isVisible: true),
            )
          ],
        ),
      ),
    );
  }
}
