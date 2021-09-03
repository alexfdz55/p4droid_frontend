import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:p4droid_frontend/shared/widgets/custom_container.dart';
import 'package:p4droid_frontend/ui/pages/calendar/controller/calendar_controller.dart';
import 'package:p4droid_frontend/utils/colors_text_and_size.dart';

class SelectSubcategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
      init: CalendarController(),
      id: 'select_subcategory',
      builder: (_) {
        _.context = context;
        return InkWell(
          child: CustomContainer(
            leftPadding: _.subcategory.value.name == '' ? 14 : 10,
            child: Obx(
              () => Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _.subcategory.value.name == ''
                      ? Text(
                          'Seleccionar Estudio',
                          style: TextStyle(fontSize: 17, color: textColor),
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.subject_rounded),
                            SizedBox(width: 10),
                            Text(
                              _.subcategory.value.name,
                              style: TextStyle(fontSize: 17, color: textColor),
                            ),
                          ],
                        ),
                  SizedBox(width: 20),
                  _.subcategory.value.name == ''
                      ? Icon(FontAwesomeIcons.alignJustify)
                      : Container(),
                ],
              ),
            ),
          ),
          onTap: () async {
            // _.subcategory.value =
            //     await Get.to(ServiciosPage()) ?? subcategoryConst;
            //_.apiGetSubcategories();
          },
        );
      },
    );
  }
}
