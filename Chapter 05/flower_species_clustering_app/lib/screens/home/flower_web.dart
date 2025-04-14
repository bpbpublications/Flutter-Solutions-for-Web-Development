// screens/home/flower_web.dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kmeans/kmeans.dart';

class FlowerWeb extends StatefulWidget {
  const FlowerWeb({super.key, required this.title});

  final String title;

  @override
  State<FlowerWeb> createState() => _FlowerWebState();
}

class _FlowerWebState extends State<FlowerWeb> {
  bool isModelTrained = false;
  Clusters? clusters;

  Future<List<List<double>>> loadAndParseCSVData(String path) async {
    final String csvData = await rootBundle.loadString(path);
    return csvData.split('\n').sublist(1).map((String line) {
      var list = line.split(',').map((String x) => x.trim()).toList();
      return list.sublist(0, list.length - 1).map(double.parse).toList();
    }).toList();
  }

  Future<void> trainModel({int k = 3}) async {
    var irisTrainingData =
        await loadAndParseCSVData('assets/data/iris_lda.csv');
    var model = KMeans(irisTrainingData);
    var clusters = model.fit(k);
    await Future.delayed(const Duration(seconds: 3)); // Simulate a delay
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
      body: isModelTrained
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.indigo,
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    child: const Column(
                      children: [
                        Text(
                          'Iris Dataset Clustering',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'The Iris dataset has been clustered into 3 groups using the K-means algorithm.',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  buildSection(
                    'Cluster Means',
                    FlowerClusterBarChart(clusters: clusters!),
                  ),
                  const SizedBox(height: 32),
                  buildSection(
                    'Cluster Points by Species',
                    Column(
                      children: [
                        buildSpeciesLegend(),
                        const SizedBox(height: 16),
                        FlowerClusterScatterChart(clusters!),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  buildSection(
                    'Statistics',
                    buildStatisticsContainer(),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget buildSection(String title, Widget content) {
    return Container(
      width: 1000,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
              const SizedBox(height: 16),
              content,
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSpeciesLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildLegendItem("Species Group 1", Colors.red),
        const SizedBox(width: 16),
        buildLegendItem("Species Group 2", Colors.green),
        const SizedBox(width: 16),
        buildLegendItem("Species Group 3", Colors.blue),
      ],
    );
  }

  Widget buildLegendItem(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget buildStatisticsContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(3, (index) {
        return Column(
          children: [
            Text(
              'Cluster ${index + 1}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
            const SizedBox(height: 8),
            Text(
              'Size: ${clusters!.clusterPoints[index].length}',
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        );
      }),
    );
  }
}

class FlowerClusterBarChart extends StatelessWidget {
  const FlowerClusterBarChart({super.key, required this.clusters});

  final Clusters clusters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: BarChart(
        BarChartData(
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                getTitlesWidget: (value, meta) => SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    'Cluster ${value.toInt() + 1}',
                    style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              ),
            ),
            leftTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) => const FlLine(
              color: Colors.black12,
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: clusters.means.asMap().entries.map((entry) {
            return BarChartGroupData(
              x: entry.key,
              barRods: [
                BarChartRodData(
                  toY: double.parse(
                      entry.value.reduce((a, b) => a + b).toStringAsFixed(1)),
                  width: 25,
                  color: Colors.indigo.shade300,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(4)),
                ),
              ],
              showingTooltipIndicators: [0],
            );
          }).toList(),
          maxY: 10,
          minY: -10,
        ),
      ),
    );
  }
}

class FlowerClusterScatterChart extends StatelessWidget {
  const FlowerClusterScatterChart(this.clusters, {super.key});

  final Clusters clusters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ScatterChart(
        ScatterChartData(
          scatterSpots: clusterSpots(clusters.clusterPoints),
          minY: -3,
          maxY: 3,
          minX: -12,
          maxX: 12,
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (value) =>
                const FlLine(color: Colors.black12, strokeWidth: 1),
            getDrawingVerticalLine: (value) =>
                const FlLine(color: Colors.black12, strokeWidth: 1),
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
            radius: 6,
            color: color,
            strokeWidth: 0,
          ),
        );
      });
    }).toList();
  }
}
