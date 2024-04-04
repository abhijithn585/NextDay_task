import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/db_provider.dart';
import 'package:task/model/data_model.dart';

class FavoritScreen extends StatefulWidget {
  const FavoritScreen({super.key});

  @override
  State<FavoritScreen> createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Consumer<DbProvider>(builder: (context, value, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              DataModel datas = value.dataList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 22, 0, 42),
                      borderRadius: BorderRadius.circular(20)),
                  height: 100,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network('${datas.avatar}'),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'First Name: ${datas.firstname}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Last Name: ${datas.lastname}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              '${datas.email}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            value.deleteFavoraits(index);
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              );
            },
            itemCount: value.dataList.length,
          );
        }
            // },
            // ),
            ));
  }
}
