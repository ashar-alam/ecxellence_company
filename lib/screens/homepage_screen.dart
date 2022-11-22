import 'dart:developer';

import 'package:ecxellence_company/services/chart.service.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_data.dart';
import '../utils/app_style.dart';
import '../utils/string_manager.dart';

class MyHomepageScreen extends StatefulWidget {
  const MyHomepageScreen({super.key});

  @override
  State<MyHomepageScreen> createState() => _MyHomepageScreenState();
}

class _MyHomepageScreenState extends State<MyHomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.black,
        centerTitle: true,
        title: const Text(StringManager.excellenceCompany),
        leading: const Icon(Icons.arrow_back),
      ),
      body: Container(
        color: AppStyle.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: AssetImage("assets/background.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          StringManager.alokMaurya,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: AppStyle.white,
                          ),
                        ),
                        Text(
                          StringManager.developer,
                          style: TextStyle(
                            fontSize: 20,
                            color: AppStyle.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 720,
                decoration: BoxDecoration(
                    color: AppStyle.mainColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: AppStyle.yellow)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      StringManager.howsTheMoodToday,
                      style: TextStyle(
                        fontSize: 25,
                        color: AppStyle.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "😃",
                          style: TextStyle(fontSize: 40),
                        ),
                        Icon(
                          Icons.sentiment_satisfied,
                          color: AppStyle.yellow,
                          size: 50,
                        ),
                        Icon(
                          Icons.emoji_emotions,
                          color: AppStyle.yellow,
                          size: 50,
                        ),
                        Text(
                          "😔",
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(
                          "😡",
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 3,
                color: AppStyle.white,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.speed_outlined,
                    color: AppStyle.yellow,
                    size: 40,
                  ),
                  Text(
                    StringManager.teamMood,
                    style: TextStyle(
                      color: AppStyle.white,
                      fontSize: 25,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      height: 5,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 720,
                decoration: BoxDecoration(
                  color: AppStyle.mainColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: AppStyle.yellow),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      StringManager.theTeamisFeelingGoodToday,
                      style: TextStyle(
                        color: AppStyle.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.emoji_emotions,
                      color: AppStyle.yellow,
                      size: 50,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.emoji_emotions,
                    color: AppStyle.yellow,
                    size: 40,
                  ),
                  Text(
                    StringManager.moodalytics,
                    style: TextStyle(
                      color: AppStyle.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    StringManager.trendChartonMood,
                    style: TextStyle(
                      color: AppStyle.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              FutureBuilder<List<ChartData>>(
                  future: ChartService().getChartdata(),
                  builder: (context, snapshot) {
                    log(snapshot.toString());
                    if (snapshot.hasData) {
                      return SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          series: <ChartSeries>[
                            LineSeries<ChartData, String>(
                                dataSource: snapshot.data!,
                                pointColorMapper: (ChartData data, _) =>
                                    data.lineColor,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y)
                          ]);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
