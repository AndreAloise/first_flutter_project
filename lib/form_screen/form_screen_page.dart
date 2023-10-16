import 'package:flutter/material.dart';

class FormScreenPage extends StatefulWidget {
  const FormScreenPage({Key? key}) : super(key: key);

  @override
  State<FormScreenPage> createState() => _FormScreenPage();
}

class _FormScreenPage extends State<FormScreenPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nome',
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: difficultyController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Difficulty',
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {});
                  },
                  controller: imageController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Image',
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 72,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(width: 2, color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageController.text,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset('assets/images/no-photo-icon.png');
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Adicionar!'))
            ],
          ),
        ),
      ),
    );
  }
}
