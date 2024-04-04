import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/api_provider.dart';
import 'package:task/controller/db_provider.dart';
import 'package:task/model/data_model.dart';
import 'package:task/view/favorit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final pro = Provider.of<ApiProvider>(context, listen: false);
    final pro2 = Provider.of<DbProvider>(context, listen: false);
    pro.fetchData();
    pro2.getAllFavorits();
  }

  @override
  Widget build(BuildContext context) {
    // bool isFavourite = false;
    // getAllFavorits();
    final dataPro = Provider.of<DbProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoritScreen(),
                    ));
              },
              icon: const Icon(Icons.favorite_border))
        ],
      ),
      body: Consumer<ApiProvider>(builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.datas!.length,
          itemBuilder: (context, index) {
            final data = value.datas![index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 22, 0, 42),
                    borderRadius: BorderRadius.circular(20)),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network('${data.avatar}'),
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
                            'First Name: ${data.firstname}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Last Name: ${data.lastname}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            '${data.email}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          if (data.id == data.id) {
                            DataModel favourite = DataModel(
                              firstname: data.firstname,
                              lastname: data.lastname,
                              email: data.email,
                              id: data.id,
                              avatar: data.avatar,
                            );

                            await dataPro.addFavorite(favourite);
                          }
                        },
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
