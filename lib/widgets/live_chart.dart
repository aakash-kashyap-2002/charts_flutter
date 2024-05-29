import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiveData {
  LiveData({required this.time, required this.speed});
  final int time;
  final num speed;
}

class LiveChartWidget extends StatefulWidget {
  const LiveChartWidget({super.key});

  @override
  State<LiveChartWidget> createState() => _LiveChartWidget();
}

class _LiveChartWidget extends State<LiveChartWidget> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    super.initState();
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(time: 0, speed: 42),
      LiveData(time: 1, speed: 38),
      LiveData(time: 2, speed: 45),
      LiveData(time: 3, speed: 49),
      LiveData(time: 4, speed: 32),
      LiveData(time: 5, speed: 37),
      LiveData(time: 6, speed: 42),
      LiveData(time: 7, speed: 45),
      LiveData(time: 8, speed: 40),
      LiveData(time: 9, speed: 34),
    ];
  }

  int _time = 10;
  updateDataSource(Timer timer) {
    chartData.add(LiveData(time: _time++, speed: (math.Random().nextInt(60))));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
      addedDataIndex: chartData.length-1,
      removedDataIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Live Chart')),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height*0.5,
        child: SfCartesianChart(
          title: const ChartTitle(text: 'Sales Data'),
          backgroundColor: Colors.blueGrey.shade300,
          legend: const Legend(isVisible: true),
          series: [
            LineSeries<LiveData,int>(
              onRendererCreated: (controller) {
                _chartSeriesController = controller;
              },
              dataSource: chartData,
              xValueMapper: (LiveData livedata, _) => livedata.time,
              yValueMapper: (LiveData livedata, _) => livedata.speed,
              color: Colors.black,
              legendItemText: 'Sales',
              legendIconType: LegendIconType.seriesType,
            )
          ],
          primaryXAxis: const NumericAxis(
            majorGridLines: MajorGridLines(width: 1),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            interval: 2,
            title: AxisTitle(text: 'Time(seconds)'),
          ),
          primaryYAxis: const NumericAxis(
            majorGridLines: MajorGridLines(width: 1),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            title: AxisTitle(text: 'Speed(m/sec)'),
          ),
        ),
      ),
    );
  }
}
