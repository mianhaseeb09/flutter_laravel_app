import 'package:flutter/material.dart';
import 'package:flutter_laravel_app/student.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Student studentService = Student();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Laravel Connection'),
        ),
        body: Container(
          child: FutureBuilder<List>(
            future: studentService.getStudent(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return ListView.builder(

                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(

                            snapshot.data![index]['student_name'],
                            style: const TextStyle(
                                fontSize: 30.0
                            ),
                          ),
                          subtitle: Text(
                            snapshot.data![index]['email'],
                            style: const TextStyle(
                                fontSize: 20
                            ),
                          ),

                        ),

                      );
                    });
              } else {
                return const Center(
                  child: Text('No Data Found'),
                );
              }
            },
          ),
        )
    );
  }
}
