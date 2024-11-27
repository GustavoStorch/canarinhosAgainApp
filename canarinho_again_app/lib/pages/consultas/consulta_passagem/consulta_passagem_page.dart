import 'package:canarinho_again_app/app_controls.dart';
import 'package:canarinho_again_app/pages/error404_page.dart';
import 'package:canarinho_again_app/pages/loading_page.dart';
import 'package:canarinho_again_app/rounting/app_route_path.dart';
import 'package:canarinho_again_app/utils/pages/page_background.dart';
import 'package:canarinho_again_app/utils/pages/page_const.dart';
import 'package:canarinho_again_app/utils/pages/page_menubar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class ConsultaPassagemPage extends StatelessWidget {
  const ConsultaPassagemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
      appBar: PageMenuBar(
        title: "Consulta Passagens",
        onPressed: () => AppControl.defineRoute(AppRoute.consultas),
      ),
      child: FutureBuilder(
        future: Future.wait({
          ConsultaPassagemDataControl.loadDataAsync()
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (ConsultaPassagemDataControl.data.isEmpty) {
              return const Center(
                child: Text("Não foi possível encontrar uma Passagem.", style: STYLE_FEFEFE_F16),
              );
            }

            // Filtra os dados conforme a pesquisa
            var passagemList = ConsultaPassagemDataControl.data.where((e) =>
                PesquisaDataControl.filtro.isEmpty ||
                e.linhaOnibus.contains(RegExp(PesquisaDataControl.filtro, caseSensitive: false))).toList();

            passagemList = passagemList.where((element) => element.ehEntrada == true).toList();

            // Agrupa os dados por data e linha
            Map<String, Map<String, double>> dailyLineData = {};

            for (var passagem in passagemList) {
              final date = DateFormat('dd-MM-yyyy').format(passagem.dataHora);
              final linha = passagem.linhaOnibus;

              if (!dailyLineData.containsKey(date)) {
                dailyLineData[date] = {};
              }
              dailyLineData[date]![linha] = (dailyLineData[date]![linha] ?? 0) + passagem.quantidade;
            }

            // Prepara os dados para o gráfico
            List<ChartData> chartData = [];
            dailyLineData.forEach((date, lines) {
              lines.forEach((linha, quantidade) {
                chartData.add(ChartData(date, quantidade, linha));
              });
            });

            // Cria múltiplas séries para o gráfico de colunas
            List<ColumnSeries<ChartData, String>> seriesList = [];
            Set<String> linhas = chartData.map((e) => e.linha).toSet();

            for (var linha in linhas) {
              seriesList.add(
                ColumnSeries<ChartData, String>(
                  name: linha,
                  dataSource: chartData.where((data) => data.linha == linha).toList(),
                  xValueMapper: (ChartData data, _) => data.date,
                  yValueMapper: (ChartData data, _) => data.quantity,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  width: 0.7, // Ajusta a largura da coluna para criar espaçamento
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 400,
                    width: MediaQuery.of(context).size.width - 50,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        labelIntersectAction: AxisLabelIntersectAction.rotate45,
                      ),
                      primaryYAxis: NumericAxis(
                        majorGridLines: const MajorGridLines(color: Colors.white, width: 0.5),
                        minorGridLines: const MinorGridLines(color: Colors.white, width: 0.5),
                        axisLine: const AxisLine(color: Colors.transparent),
                      ),
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                        header: 'Quantidade',
                        format: 'point.x: point.y',
                      ),
                      plotAreaBorderColor: Colors.transparent,
                      plotAreaBackgroundColor: Colors.black,
                      borderColor: Colors.black,
                      legend: Legend(isVisible: true),
                      series: seriesList, // Usa as séries de colunas no gráfico
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Error404Page(error: "ConsultaPassagemPage: ${snapshot.error}");
          }
          return const LoadingPage();
        },
      ),
    );
  }
}

class ChartData {
  ChartData(this.date, this.quantity, this.linha);
  final String date;
  final double quantity;
  final String linha;
}
