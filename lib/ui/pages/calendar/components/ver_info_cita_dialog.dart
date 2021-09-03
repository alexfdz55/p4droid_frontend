import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p4droid_frontend/shared/helpers/funtions_time.dart';
import 'package:p4droid_frontend/shared/models/citas.dart';
import 'package:p4droid_frontend/shared/responisve/responsive.dart';
import 'package:p4droid_frontend/shared/theme/colors.dart';
import 'package:p4droid_frontend/shared/widgets/button_azul.dart';
import 'package:p4droid_frontend/shared/widgets/custom_circular_progress.dart';
import 'package:p4droid_frontend/shared/widgets/text_title.dart';
import 'package:p4droid_frontend/ui/pages/calendar/controller/calendar_controller.dart';
import 'package:p4droid_frontend/ui/pages/calendar/screen/agendar_cita_page.dart';
import 'package:p4droid_frontend/utils/colors_text_and_size.dart';

final _style = TextStyle(fontSize: 16);
final _shape =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0));

final kBackgroundColor = Get.theme.backgroundColor;

dialogVerInfoCita(Cita cita, CalendarController _) {
  var _dialogInfoCita = AlertDialog(
    backgroundColor: kBackgroundColor,
    scrollable: true,
    shape: _shape,
    title: Text(
      'Información de la Cita',
      style: TextStyle(color: textColor, fontSize: 24),
      textAlign: TextAlign.center,
    ),
    content: _InfoCitaCard(cita: cita),
  );

  var _dialogBorrarCita = AlertDialog(
    backgroundColor: kBackgroundColor,
    scrollable: true,
    shape: _shape,
    title: Text(
      'Desea cancelar la cita',
      style: TextStyle(fontSize: 24),
      textAlign: TextAlign.center,
    ),

    actions: <Widget>[
      TextButton(
          child: Text('No', style: _style),
          onPressed: () {
            _.estadoCita = 0;
            _.update(['dialog_cita']);
          }),
      TextButton(
          child: Text('Sí', style: _style),
          onPressed: () {
            _.estadoCita = 2;
            _.update(['dialog_cita']);
            // _.apiDeleteCita(cita.uid);
            //Get.back();
          }),
    ],
    //content:_InfoCitaCard(cita: cita),
  );

  var _dialogCargando = AlertDialog(
    backgroundColor: kBackgroundColor,
    scrollable: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    content: CustomCircularProgress(),
  );

  var _dialogCitaCancelada = AlertDialog(
    backgroundColor: kBackgroundColor,
    scrollable: true,
    shape: _shape,
    title: Text(
      'Cita cancelada con éxito',
      style: TextStyle(
        fontSize: 24,
        color: isDark ? textColor : Colors.green,
      ),
      textAlign: TextAlign.center,
    ),
    actions: [
      TextButton(
        child: Text('Aceptar', style: _style),
        onPressed: () async {
          Get.back();
          await Future.delayed(Duration(milliseconds: 300));
          _.estadoCita = 0;
          _.update(['dialog_cita']);
          _.refreshPage();
        },
      )
    ],
  );

  AlertDialog selectDialog() {
    switch (_.estadoCita) {
      case 0:
        return _dialogInfoCita;

      case 1:
        return _dialogBorrarCita;
      case 2:
        return _dialogCargando;
      case 3:
        return _dialogCitaCancelada;
      default:
        return _dialogInfoCita;
    }
  }

  Get.dialog(
    GetBuilder<CalendarController>(
        init: CalendarController(),
        id: 'dialog_cita',
        builder: (_) => selectDialog()),
    barrierDismissible: false,
  );
}

class _InfoCitaCard extends StatelessWidget {
  final Cita cita;

  late Color kColor;
  late Responsive responsive;

  _InfoCitaCard({required this.cita});
  @override
  Widget build(BuildContext context) {
    responsive = Responsive(context);
    kColor = Theme.of(context).primaryColor;
    return GetBuilder<CalendarController>(
      init: CalendarController(),
      builder: (_) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // color: Colors.red,
              // margin: EdgeInsets.only(
              //     left: responsive.wp(1), right: responsive.wp(1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextTitle(
                    title: 'Nombre del paciente: ',
                    color: kprimaryColor,
                    fontSize: responsive.dp(2.0),
                  ),
                  SizedBox(height: 5),
                  TextTitle(
                    title: cita.user.name + ' ' + cita.user.lastName,
                    color: textColor,
                    fontSize: responsive.dp(1.7),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      TextTitle(
                        title: 'Cédula: ',
                        color: kprimaryColor,
                        fontSize: responsive.dp(2.0),
                      ),
                      SizedBox(width: 5),
                      TextTitle(
                        title: cita.user.cedula,
                        color: textColor,
                        fontSize: responsive.dp(1.7),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      TextTitle(
                        title: 'Estudio: ',
                        color: kprimaryColor,
                        fontSize: responsive.dp(2.0),
                      ),
                      SizedBox(width: 5),
                      TextTitle(
                        title: cita.estudio.name,
                        color: textColor,
                        fontSize: responsive.dp(1.7),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      TextTitle(
                        title: 'Día: ',
                        color: kprimaryColor,
                        fontSize: responsive.dp(2.0),
                      ),
                      SizedBox(width: 5),
                      TextTitle(
                        title: cita.day,
                        color: textColor,
                        fontSize: responsive.dp(1.7),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      TextTitle(
                        title: 'Hora: ',
                        color: kprimaryColor,
                        fontSize: responsive.dp(2.0),
                      ),
                      SizedBox(width: 5),
                      TextTitle(
                        title: cita.hour,
                        color: textColor,
                        fontSize: responsive.dp(1.5),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ButtonAzul(
                      color: Theme.of(context).primaryColor,
                      title: 'Editar cita',
                      height: 30,
                      fontSize: 18,
                      paddingV: 4,
                      onPressed: () => _editarCita(_)),
                  ButtonAzul(
                      title: 'Cancelar Cita',
                      color: Colors.red,
                      height: 30,
                      fontSize: 18,
                      paddingV: 4,
                      onPressed: () {
                        _.estadoCita = 1;
                        _.update(['dialog_cita']);
                      }),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      // TextButton(
                      //   child: Text('Cancelar', style: _style),
                      //   onPressed: () {
                      //     Get.back();
                      //   },
                      // ),
                      Expanded(child: Container()),
                      TextButton(
                        child: Text('Aceptar', style: _style),
                        onPressed: () => Get.back(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _editarCita(CalendarController _) async {
    //_.u = this.cita.user.name
    _.user.value.name = this.cita.user.name + ' ' + this.cita.user.lastName;
    _.user.value.uid = this.cita.user.id!;
    _.subcategory.value.name = this.cita.estudio.name;

    _.subcategory.value.uid = this.cita.estudio.id!;
    // await _.apiGetHorariosOcupadas();
    // _.horarios.value = await generarHorarios(
    //     estudio: this.cita.estudio,
    //     horariosOcupados: _.horariosOcupados); // horariosOcupados: []);
    _.createHorariosMap(this.cita.hour);

    // _.subcategory.value.uid = this.cita.estudio.id!;
    _.study = this.cita.estudio.name;
    _.hour = this.cita.hour;
    _.date = convertStringToDateTime(cita.day);
    //print(day);
    Get.back();

    Get.to(AgendarCitaPage(cita: this.cita, reagendar: true));
    //_.requisitosTextController.text = cita.
  }
}
