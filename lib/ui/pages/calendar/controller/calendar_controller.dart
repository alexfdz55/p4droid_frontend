import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p4droid_frontend/shared/helpers/funtions_time.dart';
import 'package:p4droid_frontend/shared/models/category.dart';
import 'package:p4droid_frontend/shared/models/citas.dart';
import 'package:p4droid_frontend/shared/models/subCategory.dart';
import 'package:p4droid_frontend/shared/models/user.dart';
import 'package:p4droid_frontend/ui/pages/calendar/components/calendar_month_widget.dart';
import 'package:p4droid_frontend/ui/pages/calendar/components/utils.dart';
// import 'package:timetable/timetable.dart';
// import 'package:supercharged/supercharged.dart';
// import 'package:intl/intl.dart';

final _userConst = Usuario(
    lastName: '',
    name: '',
    role: '',
    uid: '',
    email: '',
    cedula: '',
    gender: '',
    phone: '',
    blood: '',
    img: '');

final subcategoryConst = Subcategory(
  description: '',
  img: '',
  discount: 0,
  range: 0,
  ayuna: false,
  vejiga: false,
  timeStart: '7:00 AM',
  timeEnd: '5:00 PM',
  uid: '',
  name: '',
  price: 0,
  category: Category(description: '', uid: '', img: '', name: ''),
);

class CalendarController extends GetxController {
  String timeStart = '';
  DateTime initHour = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 7, 0);

  late BuildContext context;
  List<Cita> citas = [];
  List<Cita> citasOcupadas = [];
  List<String> horariosOcupados = [];
  // List<BasicEvent> citasEvent = <BasicEvent>[];
  List<CitaEvent> citasEvent = [];

  //List<CalendarEvent> citasEventMonth = [];
  List<CalendarCitatMonth> citasEventMonth = [];

  bool loadingCitas = true;

  TextEditingController cedula = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  // TextEditingController requisitosTextController = new TextEditingController();

  DateTime date = DateTime.now();

  String category = '';
  String study = '';
  // String day = '';
  //String hour = '';

  bool saveInformation = false;
  bool isVoluntario = false;
  bool isOrdenMedica = false;

  bool isCorrect = false;

  String info = 'Requisitos. Descripcion de los requisitos';

  // Para hacer la busqueda del usuario (Por nombre)
  List<Usuario> users = [];
  List<String> usersName = [];
  Rx<Usuario> user = _userConst
      .obs; //User(avatar: '', lastname: '', name: '', role: '', uid: '');

// Para hacer la busqueda de la subcategoria (Por nombre)
  List<Subcategory> subcategorias = [];

  var subcategory = subcategoryConst.obs;

  //Para los horarios
  String hour = '';

  Map<String, bool> horariosMap = Map();

  var horarios = <String>[].obs;

  ///Para buscar el paciente
  bool selectOption = false;
  String optionSearchSelect = "Por nombre";
  List<String> optionsSearhList = [
    "Por nombre",
    "Por apellido",
    "Por cédula",
  ];

  late List<DropdownMenuItem<String>> dropDownMenuItemsSearch;

  List<DropdownMenuItem<String>> getDropDownMenuItemsGender() {
    List<DropdownMenuItem<String>> items = [];
    for (String option in optionsSearhList) {
      items.add(new DropdownMenuItem(value: option, child: new Text(option)));
    }
    return items;
  }

  @override
  void onInit() {
    dropDownMenuItemsSearch = getDropDownMenuItemsGender();
    //apiGetCitas('completada');
    subcategory.value = subcategoryConst;

    //Evento  para generar los horarios. Ocurre al seleccionar un estudio
    ever(subcategory, (value) async {
      late Cita kCita;
      print('subcateg seleccionada');
      for (Cita cita in citas) {
        if (cita.estudio.name == subcategory.value.name &&
            cita.day == convertDate(date)) {
          print('Cita de paciente: ' + cita.user.name);
          // await apiGetHorariosOcupadas();
        }
      }

      // horarios.value = await generarHorarios(
      //     subcategory: subcategory.value, horariosOcupados: horariosOcupados);
      // print('horarios: ' + horarios.toString());

      await createHorariosMap('');
      // print('actualizar');

      //print('Slots ocupados de: ' + kCita.estudio.name);
    });

    super.onInit();
  }

  Future<void> createHorariosMap(String horaCita) async {
    for (var hora in horarios) {
      //print(hora);
      if (hora == horaCita) {
        horariosMap[hora] = true;
      } else {
        horariosMap[hora] = false;
      }
    }
    print('generar horariosmap');
    //update(['horarios']);
  }

  apiGetCitas(String tipo) {
    final citas = [];

    for (var cita in citas) {
      // Se crea la lista de eventos para mostrar en el calendario
      citasEvent.add(CitaEvent(cita, context));

      citasEventMonth.add(CalendarCitatMonth(cita: cita));
    }
    // if (citas.length == 0) {
    //   dialogNoCitas(tipo);
    // }
    loadingCitas = false;
    update();
  }

  refreshPage() {
    loadingCitas = true;
    citas = [];
    citasEvent = [];
    update();
    apiGetCitas('completada');
  }

  reiniciarCampos() {
    print('Reinicando datos');
    user.value = _userConst;
    user.value.name = '';
    subcategory.value = subcategoryConst;
    subcategory.value.name = '';
    date = DateTime.now();
    hour = '';
    horarios.value = [];
    horariosMap = Map();
    //hour = dropDownHours[0].value!;

    // FocusScope.of(context).requestFocus(FocusNode());
    update(['agendar', 'search_patient', 'search_study']);
  }

  int estadoCita = 0; // 0 -> Mostrar dialog de info
  // 1 -> Mostrar dialog de borrar
  // 2 -> Mostrar dialog de cargando
  // 3 -> Mostrar dialog de cita cancelada

}
