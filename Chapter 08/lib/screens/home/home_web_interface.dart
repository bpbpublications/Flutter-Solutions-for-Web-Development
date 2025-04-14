import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kmeans/kmeans.dart';

class HomeWebInterface extends StatefulWidget {
  const HomeWebInterface({super.key, required this.title});

  final String title;

  @override
  State<HomeWebInterface> createState() => _HomeWebInterfaceState();
}

class _HomeWebInterfaceState extends State<HomeWebInterface> {
  bool isModelTrained = false;
  Clusters? clusters;

  // Load and parse the CSV data
  Future<List<List<double>>> _loadAndParseCSVData(String path) async {
    final String csvData = await rootBundle.loadString(path);
    List<String> rows = csvData.split('\n').sublist(1);
    return rows.map((String line) {
      var list = line.split(',').map((String x) => x.trim()).toList();
      return list
          .sublist(0, list.length - 1)
          .map((String x) => double.parse(x))
          .toList();
    }).toList();
  }

  // Train the model
  Future<void> trainModel({int k = 3}) async {
    var irisTrainingData =
        await _loadAndParseCSVData('assets/data/iris_lda.csv');
    var model = KMeans(irisTrainingData);
    var clusters = model.fit(k);
    await Future.delayed(const Duration(seconds: 3)); // Simulate a delay
    print("length of clusters: ${clusters.points.length}");
    print("length of points: ${clusters.clusters.length}");
    print("length of cluster points: ${clusters.clusterPoints.length}");
    setState(() {
      isModelTrained = true;
      this.clusters = clusters;
    });
  }

  @override
  void initState() {
    super.initState();
    trainModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: isModelTrained
            ? SizedBox(
                width: 1200,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        'Iris dataset clustering',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'The Iris dataset has been clustered into 3 groups using the K-means algorithm.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Cluster means',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        height: 400,
                        width: 1000,
                        padding: const EdgeInsets.all(32),
                        child: IrisClusterBarChart(clusters: clusters!),
                      ),
                      const SizedBox(height: 32),
                      const Text("Cluster points by species",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            color: Colors.red.shade300,
                            child: const Text("Species Group 1"),
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            color: Colors.green.shade300,
                            child: const Text("Species Group 2"),
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            color: Colors.blue.shade300,
                            child: const Text("Species Group 3"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        height: 400,
                        width: 1000,
                        padding: const EdgeInsets.all(32),
                        child: IrisClusterScatterChart(clusters!),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Statistics',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: 1000,
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Cluster 1',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Cluster 2',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Cluster 3',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Size: ${clusters!.clusterPoints[0].length}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  'Size: ${clusters!.clusterPoints[1].length}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  'Size: ${clusters!.clusterPoints[2].length}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}

class IrisClusterBarChart extends StatelessWidget {
  const IrisClusterBarChart({super.key, required this.clusters});

  final Clusters clusters;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              getTitlesWidget: (value, meta) => SideTitleWidget(
                axisSide: meta.axisSide,
                child: Text(
                  'Cluster ${value.toInt() + 1}',
                  style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        gridData: const FlGridData(show: true, drawVerticalLine: false),
        alignment: BarChartAlignment.spaceAround,
        borderData: FlBorderData(show: false),
        barGroups: clusters.means.map((val) {
          return BarChartGroupData(
            x: clusters.means.indexOf(val),
            barRods: [
              BarChartRodData(
                toY: double.parse(
                    val.reduce((a, b) => a + b).toStringAsFixed(1)),
                width: 25,
                color: Colors.lightBlue.shade300,
                borderSide: const BorderSide(color: Colors.black54, width: 2),
              ),
            ],
            showingTooltipIndicators: [0],
          );
        }).toList(),
        maxY: 10,
        minY: -10,
        extraLinesData: ExtraLinesData(horizontalLines: [
          HorizontalLine(
            y: 0,
            color: Colors.black54,
            strokeWidth: 2,
            dashArray: [5, 5],
          ),
        ]),
      ),
    );
  }
}

class IrisClusterScatterChart extends StatelessWidget {
  const IrisClusterScatterChart(this.clusters);

  final Clusters clusters;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ScatterChart(
        ScatterChartData(
          scatterSpots: clusterSpots(clusters.clusterPoints),
          minY: -3,
          maxY: 3,
          minX: -12,
          maxX: 12,
          titlesData: const FlTitlesData(
            show: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
        ),
      ),
    );
  }

  List<ScatterSpot> clusterSpots(List<List<List<double>>> clusterPoints) {
    const colorList = [Colors.red, Colors.green, Colors.blue];
    return clusterPoints.asMap().entries.expand((entry) {
      final color = colorList[entry.key];
      return entry.value.map((point) {
        return ScatterSpot(
          point[0],
          point[1],
          dotPainter: FlDotCirclePainter(
            radius: 10,
            color: color,
            strokeWidth: 2,
            strokeColor: Colors.white,
          ),
        );
      });
    }).toList();
  }
}
