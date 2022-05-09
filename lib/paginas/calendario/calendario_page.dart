import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcc/paginas/calendario/calendario_form.dart';

class CalendarioPage extends StatelessWidget {
  const CalendarioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendário"),
      ),
      body: CalendarioForm(),
    );
  }
}
