import 'package:first_flutter_project/data/task_cards_inherited.dart';
import 'package:flutter/material.dart';

class FormScreenPage extends StatefulWidget {
  const FormScreenPage({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreenPage> createState() => _FormScreenPageState();
}

class _FormScreenPageState extends State<FormScreenPage> {
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
                  _taskNameField(nameController),
                  _taskDifficultyField(difficultyController),
                  _taskImageField(imageController),
                  _taskIconPreview(imageController),
                  _addTaskButton(widget.taskContext, context, nameController,
                      imageController, difficultyController),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _taskNameField(TextEditingController nameController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (String? value) {
          bool isValid = _valueValidate(value);
          return isValid ? null : 'Enter the Task\'s name';
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

  Padding _taskDifficultyField(TextEditingController difficultyController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          bool isValid = _difificultyValidator(value);
          return isValid ? null : 'Enter a difficult value between 1 and 5.';
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

  Padding _taskImageField(TextEditingController imageController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          bool isValid = _valueValidate(value);
          return isValid ? null : 'Enter the url of an image';
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

  Container _taskIconPreview(TextEditingController imageController) {
    return Container(
      width: 72,
      height: 100,
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

  ElevatedButton _addTaskButton(
      BuildContext taskContext,
      BuildContext context,
      TextEditingController nameController,
      TextEditingController imageController,
      TextEditingController difficultyController) {
    return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            TaskCardsInherited.insideOf(taskContext).addNewTask(
                nameController.text,
                imageController.text,
                int.parse(difficultyController.text));

            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                behavior: SnackBarBehavior.floating,
                elevation: 150.0,
                content: Text('Creating new Task')));
            Navigator.pop(context);
          }
        },
        child: const Text('Add!'));
  }

  bool _valueValidate(String? value) {
    return (value != null && value.trim().isNotEmpty);
  }

  bool _difificultyValidator(String? value) {
    bool hasValue = _valueValidate(value);
    if (hasValue) {
      try {
        int intValue = int.parse(value!);
        if (intValue <= 5 && intValue >= 1) {
          return true;
        }
      } catch (e) {
        debugPrint("Error on converting '$value' into Int!");
        debugPrint("Error Message: $e");
        return false;
      }
    }
    return false;
  }
}
