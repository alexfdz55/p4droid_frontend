import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p4droid_frontend/shared/responisve/responsive.dart';
import 'package:p4droid_frontend/ui/pages/calendar/controller/calendar_controller.dart';
import 'package:p4droid_frontend/utils/colors_text_and_size.dart';

class HorariosAdminWidget extends StatelessWidget {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return GetBuilder<CalendarController>(
      init: CalendarController(),
      id: 'horarios',
      builder: (_) => Obx(
        () => _.horarios.length == 0
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 2, color: Colors.black54),
                  // boxShadow: <BoxShadow>[
                  //   BoxShadow(
                  //       color: Colors.black26,
                  //       blurRadius: 2.0,
                  //       spreadRadius: 1.0,
                  //       offset: Offset(1.0, 2.0))
                  // ],
                ),
                child: Text(
                  'Seleccione un estudio para poder ver los horarios disponibles.',
                  style: TextStyle(color: Colors.black),
                ),
              )
            : Container(
                //color: Colors.yellow,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
                height: responsive.dp(7),
                child: ListView.separated(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      _HorarioButton(hora: _.horarios[index]),
                  itemCount: _.horarios.length, /////allCategories.length,
                  separatorBuilder: (_, index) => SizedBox(
                    width: 10,
                  ),
                ),
              ),
      ),
    );
  }
}

class _HorarioButton extends StatelessWidget {
  final String hora;
  //final String horaFinal;

  _HorarioButton({
    required this.hora,
    //required this.horaFinal,
  });

  late Size size;

  bool isSelect = false;
  final _ = Get.find<CalendarController>();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    double kFontSize = responsive.dp(1.8);
    final kColor = Theme.of(context).primaryColor;

    return GetBuilder<CalendarController>(
        init: CalendarController(),
        id: 'horario_button',
        builder: (_) {
          for (var k in _.horariosMap.keys) {
            if (k == this.hora) {
              isSelect = _.horariosMap[k]!;
              //print('IsSelect horario: $isSelect');
            }
          }

          return InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              width: responsive.dp(11),
              height: responsive.dp(7),
              decoration: BoxDecoration(
                color: (isSelect) ? kColor : Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(width: 2, color: Colors.black54),
                // boxShadow: <BoxShadow>[
                //   BoxShadow(
                //       color: Colors.black26,
                //       blurRadius: 2.0,
                //       spreadRadius: 1.0,
                //       offset: Offset(1.0, 2.0))
                // ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    this.hora,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: kFontSize,
                      color: isSelect ? Colors.white : textColor,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              //print('Horario Button is pressed: $hora');
              _.horariosMap[this.hora] = !_.horariosMap[this.hora]!;
              for (var k in _.horariosMap.keys) {
                if (k != this.hora) {
                  _.horariosMap[k] = false;
                  //_.hora = '';
                  // _.validacion();
                  //print(k);
                } else {
                  _.hour = k;
                  // _.validacion();
                  print('hour seleccionada: ' + _.hour);
                  //print(_.horariosMap[k]);
                  // if (_.horariosMap[k] == true) {
                  //   _.update();
                  // }
                }
              }

              // //Para resetear la variable hora
              int j = 0;
              if (_.horariosMap[this.hora] == false) {
                for (var i = 0; i < _.horarios.length; i++) {
                  if (_.horariosMap[_.horarios[i]] == false) {
                    j++;
                  }
                }
                print(j);
                if (j == _.horarios.length) {
                  print('Se resetea la variable hora');
                  _.hour = '';
                  // _.validacion();
                }
              }

              _.update(['horario_button']);
            },
          );
        });
  }
}
