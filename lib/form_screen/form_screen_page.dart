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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(title: const Text('New Task')),
        body: Center(
          child: SingleChildScrollView(
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
                  _taskNameField(),
                  _taskDifficultField(),
                  _taskImageField(),
                  _taskIconPreview(),
                  _addTaskButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _taskNameField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (String? value) {
          if (value != null && value.isEmpty) {
            return 'Enter the Task\'s name';
          }
          return null;
        },
        keyboardType: TextInputType.name,
        controller: nameController,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Task Name',
          fillColor: Colors.white70,
          filled: true,
        ),
      ),
    );
  }

  Padding _taskDifficultField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty || int.parse(value) > 5 || int.parse(value) < 1) {
            return 'Enter a difficult value between 1 and 5.';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        controller: difficultyController,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Difficulty',
          fillColor: Colors.white70,
          filled: true,
        ),
      ),
    );
  }

  Padding _taskImageField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter the url of an image';
          }
          return null;
        },
        keyboardType: TextInputType.url,
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
    );
  }

  Container _taskIconPreview() {
    return Container(
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
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Image.asset('assets/images/no-photo-icon.png');
          },
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  ElevatedButton _addTaskButton() {
    return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Saving Task')));
          }
        },
        child: const Text('Add!'));
  }
}
