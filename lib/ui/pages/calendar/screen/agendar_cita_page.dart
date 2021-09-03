import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:p4droid_frontend/shared/models/citas.dart';
import 'package:p4droid_frontend/shared/responisve/responsive.dart';
import 'package:p4droid_frontend/shared/theme/colors.dart';
import 'package:p4droid_frontend/shared/widgets/appBar_custom.dart';
import 'package:p4droid_frontend/shared/widgets/menu_lateral.dart';
import 'package:p4droid_frontend/shared/widgets/text_title.dart';
import 'package:p4droid_frontend/ui/pages/calendar/components/widgets/agendar_button.dart';
import 'package:p4droid_frontend/ui/pages/calendar/components/widgets/horarios_widget.dart';
import 'package:p4droid_frontend/ui/pages/calendar/components/widgets/seleccionar_dia.dart';
import 'package:p4droid_frontend/ui/pages/calendar/components/widgets/select_subcategory_widget.dart';
import 'package:p4droid_frontend/ui/pages/calendar/components/widgets/time_widget.dart';
import 'package:p4droid_frontend/ui/pages/calendar/controller/calendar_controller.dart';
import 'package:p4droid_frontend/utils/colors_text_and_size.dart';

class AgendarCitaPage extends StatelessWidget {
  final Cita? cita;
  final bool reagendar;
  final bool appbarNomal;

  AgendarCitaPage(
      {this.cita, this.reagendar = false, this.appbarNomal = false});
  late Responsive responsive;

  @override
  Widget build(BuildContext context) {
    responsive = Responsive(context);

    return GetBuilder<CalendarController>(
        init: CalendarController(),
        id: 'agendar',
        builder: (_) {
          return Scaffold(
              drawer: this.appbarNomal ? MenuLateral() : null,
              appBar: this.appbarNomal
                  ? appbarCustom(title: 'Crear Clase')
                  : AppBar(
                      leading: IconButton(
                          icon: Icon(Icons.close), onPressed: () => Get.back()),
                      title:
                          Text(this.reagendar ? 'Editar Clase' : 'Crear Clase'),
                    ), //appbarCustom(title: 'Agendar Cita'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Get.theme.canvasColor,
                      margin: EdgeInsets.only(
                          left: 30, right: 30, top: 40, bottom: 20),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 20,
                            left: responsive.wp(5),
                            right: responsive.wp(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SeleccionarDiaWidget(),
                            SizedBox(height: 20.0),
                            //SelectHourWidget(),

                            // Padding(
                            //   padding: EdgeInsets.only(left: 20, bottom: 10),
                            //   child: TextTitle(
                            //     title: 'Horarios',
                            //     color: textColor,
                            //     fontSize: responsive.dp(2.0),
                            //   ),
                            // ),
                            SizedBox(height: 20.0),
                            TimetWidget(),

                            // _.horarios.length == 0
                            //     ? Container()
                            //     : HorariosAdminWidget(),
                            // HorariosAdminWidget(),

                            SizedBox(height: 10.0),

                            AgendarButton(
                                title: 'Aceptar',
                                height: responsive.dp(5),
                                fontSize: responsive.dp(2.0),
                                onPressed: () {}),

                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: responsive.dp(4),
                    // ),
                  ],
                ),
              ));
        });
  }
}

class _CustomContainer extends StatelessWidget {
  final Widget child;
  final double leftPadding;
  final double rightPadding;
  final CalendarController calendarController;

  const _CustomContainer({
    required this.child,
    this.leftPadding = 10,
    this.rightPadding = 10,
    required this.calendarController,
  });
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.only(
        left: this.leftPadding,
        right: this.rightPadding,
      ),
      width: responsive.width,
      height: 50,
      // width: ,
      decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: calendarController.user.value.name == ''
                  ? Colors.grey.withOpacity(0.7)
                  : kprimaryColor),
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15.0)),

      child: this.child,
    );
  }
}
