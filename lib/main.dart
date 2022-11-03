import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> tasksList = [];
  String taskInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red[400],
            centerTitle: true,
            title: const Text('میرزابنویس')),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                    hintText: '...تسک خود را وارد کنید',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2))),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                onChanged: (taskText) => {taskInput = taskText},
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red[400],
                    ),
                    onPressed: () => {
                      setState(() {
                        tasksList.add(taskInput);
                      })
                    },
                    child: const Text('بنویس'),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: tasksList
                    .map((task) => Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      tasksList.remove(task);
                                    });
                                  },
                                  icon: const Icon(
                                      Icons.highlight_remove_outlined,
                                      size: 20),
                                  label: const Text('حذف'),
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.red),
                                )),
                            Text(task,
                                style: TextStyle(fontStyle: FontStyle.italic)),
                          ],
                        )))
                    .toList(),
              )
            ],
          ),
        ));
  }
}
