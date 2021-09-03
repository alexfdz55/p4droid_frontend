
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:p4droid_frontend/shared/helpers/funtions_time.dart';
import 'package:p4droid_frontend/shared/widgets/custom_container.dart';
import 'package:p4droid_frontend/ui/pages/calendar/controller/calendar_controller.dart';
import 'package:p4droid_frontend/utils/colors_text_and_size.dart';

class SeleccionarDiaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
        init: CalendarController(),
        builder: (_) => CustomContainer(
                child: TextButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (_.date == '')
                      ? Text(
                          'Seleccionar Día',
                          style: TextStyle(fontSize: 17, color: textColor,
                          fontWeight: FontWeight.w300
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Día:  ',
                              style: TextStyle(
                                  fontSize: 17, color: textColor),
                            ),
                            Text(
                              convertDate(_.date),
                              style: TextStyle(
                                  fontSize: 17,
                                  color: textColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                  Icon(
                    FontAwesomeIcons.solidCalendarAlt,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
              onPressed: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: new DateTime.now(),
                  firstDate: new DateTime.now()
                  lastDate: new DateTime(2025),//TODO: Definir tiempo maximo
                  //locale: Locale('es', 'ES'),
                );
                if (picked != null) {
                  _.date = picked;
                  // (picked.day.toInt() >= 10
                  //         ? picked.day.toString()
                  //         : '0' + picked.day.toString())+
                  //         '/' +
                  //     (picked.month.toInt() >= 10
                  //         ? picked.month.toString()
                  //         : '0' + picked.month.toString()) +
                  //     '/' +
                      
                  //     picked.year.toString() 
                           
                          
                          ;
                  //Get.find<CompletarRegistroController>().fechanac = datoIngresado;
                  // _.actualizarRegistro = true;
                  _.update();
                }
              },
            )));
  }

  // _selectDate(BuildContext context, AgendarCitaController _) async {
  //   DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: new DateTime.now(),
  //                 firstDate: new DateTime.now()
  //                 lastDate: new DateTime(2025),//TODO: Definir tiempo maximo
  //       locale: Locale('es', 'ES'));
  //   if (picked != null) {
  //     _.date = picked.toString();
  //     _.dateController.text = _.date;
  //     _.update();
  //   }
  // }
}
