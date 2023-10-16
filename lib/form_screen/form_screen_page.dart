import 'package:flutter/material.dart';

class FormScreenPage extends StatefulWidget {
  const FormScreenPage({Key? key}) : super(key: key);

  @override
  State<FormScreenPage> createState() => _FormScreenPage();
}

class _FormScreenPage extends State<FormScreenPage> {
  bool shouldApplyOpacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova Tarefa')),
      body: Center(
        child: Container(
          color: null,
          height: 650,
          width: 375,
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nome',
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
