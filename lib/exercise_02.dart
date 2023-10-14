import 'package:flutter/material.dart';

class Exercise02 extends StatelessWidget {
  const Exercise02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: _floatingButton(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Tarefas'),
    );
  }

  ListView _body() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        TaskEx02('Aprendendo Flutter'),
        TaskEx02('Aprendendo Dart'),
        TaskEx02('Aprendendo Git'),
        TaskEx02('Aprendendo Java'),
        TaskEx02('Aprendendo C#'),
        TaskEx02('Aprendendo Angular'),
        TaskEx02('Aprendendo Php'),
        TaskEx02('Aprendendo Ruby'),
      ],
    );
  }

  FloatingActionButton _floatingButton() {
    return FloatingActionButton(
      onPressed: () {},
    );
  }
}

class TaskEx02 extends StatelessWidget {
  final String taskName;
  const TaskEx02(this.taskName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _bodyPadding();
  }

  Padding _bodyPadding() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: _stackChildren(),
        ));
  }

  Stack _stackChildren() {
    return Stack(
      children: [
        Container(
          color: Colors.blue,
          height: 140,
        ),
        Container(
          color: Colors.white,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.black26,
                width: 72,
                height: 100,
              ),
              Container(
                  width: 200,
                  child: Text(taskName,
                      style: const TextStyle(
                          fontSize: 24, overflow: TextOverflow.ellipsis))),
              ElevatedButton(
                  onPressed: () {}, child: const Icon(Icons.arrow_drop_up))
            ],
          ),
        )
      ],
    );
  }
}
