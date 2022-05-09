import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';

import 'dart:math';

class CalendarioForm extends StatefulWidget {
  const CalendarioForm({Key? key}) : super(key: key);

  @override
  _CalendarioPageState createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioForm> {
  CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();
  CalendarAgendaController _calendarAgendaControllerNotAppBar =
      CalendarAgendaController();

  late DateTime _selectedDateAppBBar;
  late DateTime _selectedDateNotAppBBar;

  Random random = new Random();

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
    _selectedDateNotAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAgenda(
        controller: _calendarAgendaControllerAppBar,
        appbar: true,
        selectedDayPosition: SelectedDayPosition.center,
        backgroundColor: Colors.grey,
        calendarBackground: Colors.grey.shade200,
        weekDay: WeekDay.long,
        fullCalendarScroll: FullCalendarScroll.horizontal,
        fullCalendarDay: WeekDay.long,
        selectedDateColor: Colors.green.shade900,
        locale: 'pt',
        initialDate: DateTime.now(),
        calendarEventColor: Colors.grey,
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now().add(Duration(days: 365)),
        events: List.generate(
            100,
            (index) => DateTime.now()
                .subtract(Duration(days: index * random.nextInt(5)))),
        onDateSelected: (date) {
          setState(() {
            _selectedDateAppBBar = date;
          });
        },
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _calendarAgendaControllerAppBar.goToDay(DateTime.now());
              },
              child: Text("Pular para hoje"),
            ),
            Text('Data selecionada é $_selectedDateAppBBar'),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
