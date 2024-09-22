// // ignore_for_file: non_constant_identifier_names

// import 'package:canarinho_again_app/app_controls.dart';
// import 'package:canarinho_again_app/controllers/data_controllers/consulta_passagem/consulta_passagem_data_controller.dart';
// import 'package:canarinho_again_app/controllers/data_controllers/pesquisa_data_controller.dart';
// import 'package:canarinho_again_app/models/consulta_passagem/consulta_passagem.dart';
// import 'package:canarinho_again_app/pages/error404_page.dart';
// import 'package:canarinho_again_app/pages/loading_page.dart';
// import 'package:canarinho_again_app/rounting/app_route_path.dart';
// import 'package:canarinho_again_app/utils/pages/page_background.dart';
// import 'package:canarinho_again_app/utils/pages/page_const.dart';
// import 'package:canarinho_again_app/utils/pages/page_menubar.dart';
// import 'package:canarinho_again_app/utils/pages/page_search.dart';
// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
 
// class ConsultaPassagemPage extends StatelessWidget {
//   const ConsultaPassagemPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PageBackground(
//       appBar: PageMenuBar(
//         title: "Consulta Passagens",
//         onPressed: () => AppControl.defineRoute(AppRoute.config),
//       ),
//       child: FutureBuilder(
//         future: Future.wait({
//           ConsultaPassagemDataControl.loadDataAsync()
//         }),
//         builder: (context, snapshot) {
//           if (snapshot.inState(ConnectionState.done).hasData) {
//             if (ConsultaPassagemDataControl.data.isEmpty) {
//               return const Center(
//                   child: Text("Não foi possível encontrar uma Passagem.", style: STYLE_FEFEFE_F16));
//             }

//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const PageSearch(),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height - 165,
//                   child: Consumer<PesquisaDataController>(
//                     builder: (context, value, child) {
//                       final List<ConsultaPassagem> passagemList = [
//                         ...ConsultaPassagemDataControl.data.where((e) =>
//                             PesquisaDataControl.filtro.isEmpty ||
//                             (e.linhaOnibus.contains(RegExp(PesquisaDataControl.filtro, caseSensitive: false))))
//                       ];

//                       return Scrollbar(
//                         thumbVisibility: true,
//                         child: ListView.builder(
//                           itemCount: passagemList.length,
//                           itemBuilder: (context, i) {
//                             return Consumer<ConsultaPassagemDataController>(
//                               builder: (context, value, child) {
//                                 final ConsultaPassagem passagem = passagemList[i];

//                                 final int codigo = passagem.codApontamento;
//                                 final double quantidade = passagem.quantidade;
//                                 final DateTime dataHora = passagem.dataHora;
//                                 final String linha = passagem.linhaOnibus;

//                                 return Visibility(
//                                   visible: true,
//                                   child: Center(
//                                       child: SizedBox(
//                                     width: CARD_WIDTH,
//                                     child: Card(
//                                       elevation: PAGE_ELEVATION,
//                                       margin: EdgeInsets.fromLTRB(
//                                           12, (i == 0 ? 0 : 12), 12, (i == passagemList.length - 1 ? 38 : 0)),
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(vertical: 8),
//                                         child: ListTile(
//                                           title: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             mainAxisSize: MainAxisSize.min,
//                                             children: [
//                                               Text("Apontamento: ${codigo.toString()}",
//                                                   style: ConfigUsuarioControl.codUsuario == codigo
//                                                       ? STYLE_GREEN_BF14
//                                                       : STYLE_171717_BF14),
//                                               Text("Quantidade: $quantidade", style: STYLE_171717_F14),
//                                               Text("Data Hora: $dataHora", style: STYLE_171717_F14),
//                                               Text("Linha: $linha", style: STYLE_171717_F14),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   )),
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             );
//           } else if (snapshot.hasError) {
//             return Error404Page(error: "ConsultaPassagemPage: ${snapshot.error}");
//           }
//           return const LoadingPage();
//         },
//       ),
//     );
//   }
// }
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
                  child: Text("Não foi possível encontrar uma Passagem.", style: STYLE_FEFEFE_F16));
            }

            // Filtra os dados conforme a pesquisa
            final passagemList = ConsultaPassagemDataControl.data.where((e) =>
                PesquisaDataControl.filtro.isEmpty ||
                e.linhaOnibus.contains(RegExp(PesquisaDataControl.filtro, caseSensitive: false))).toList();

            // Agrupa os dados por mês
            Map<String, double> monthlyData = {};
            for (var passagem in passagemList) {
              final monthYear = DateFormat('MM-yyyy').format(passagem.dataHora);
              monthlyData[monthYear] = (monthlyData[monthYear] ?? 0) + passagem.quantidade;
            }

            // Prepara os dados para o gráfico
            final List<ChartData> chartData = monthlyData.entries.map((entry) {
              final DateTime month = DateTime.parse("2024-${entry.key.split('-')[0]}-01");
              return ChartData(DateFormat('MMM').format(month), entry.value);
            }).toList();

            return Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 400,
                    width:  MediaQuery.of(context).size.height - 300,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        majorGridLines: const MajorGridLines(color: Colors.white, width: 0.5), // Espessura da linha
                        minorGridLines: const MinorGridLines(color: Colors.white, width: 0.5), // Espessura da linha
                        axisLine: const AxisLine(color: Colors.transparent), // Esconde a linha do eixo
                        labelIntersectAction: AxisLabelIntersectAction.rotate45, // Rotaciona os rótulos se necessário
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
                      series: <CartesianSeries<ChartData, String>>[
                        LineSeries<ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.month,
                          yValueMapper: (ChartData data, _) => data.quantity,
                          markerSettings: const MarkerSettings(
                            isVisible: true,
                            color: Colors.black,
                          ),
                          color: Colors.blueAccent,
                        ),
                      ],
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
  ChartData(this.month, this.quantity);
  final String month;
  final double quantity;
}