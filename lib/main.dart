//DEPENDENCIES
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:interface_3/ui/profile_iu.dart';

// UI
import '/ui/button_ui.dart';
import '/ui/custom_circle_avatar.dart';

//SERVICES
import 'services/firebase_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(const TabBarDemo());
  });
}

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({super.key});

  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 49, 50, 53),
          body: FutureBuilder<List>(
            future: getUsers(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return TabBarView(
                  children: [
                    // Primer tab
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.22, // 23% de la altura de la pantalla
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (snapshot.data != null)
                                for (var userData in snapshot.data!)
                                  if (userData['num'] <= 3)
                                    CustomCircleAvatar(
                                      imageUrl: userData['img'],
                                      borderColorChoice: userData['num'],
                                      size: 100,
                                      name: userData['name'],
                                      calories: userData['calories'],
                                    ),
                            ],
                          ),
                        ),
                        if (snapshot.data != null)
                          for (var userData in snapshot.data!)
                            if (userData['num'] > 3)
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: buildElevatedButton(
                                  userData['num'],
                                  userData['img'],
                                  userData['name'],
                                  userData['calories'],
                                  () {
                                    // Acción del botón
                                  },
                                ),
                              ),
                      ],
                    ),

                    // Otros tabs
                    const Icon(Icons.cake),
                    const Icon(Icons.timer),
                    const Icon(Icons.chat),
                    //LAST TAB
                    Column(
                      children: [
                        if (snapshot.data != null)
                          for (var userData in snapshot.data!)
                            if (userData['num'] == 1)
                              ProfileCircleAvatar(
                                imageUrl: userData['img'],
                                name: userData['name'],
                                calories: userData['calories'],
                                number: userData['num'],
                                goal: userData['goalStrk'],
                              ),
                        Column(
                          children: [
                            Container(
                              width: double.infinity, // Ocupa el 100% del ancho
                              height: MediaQuery.of(context).size.height *
                                  0.25, // Ocupa el 20% de la altura de la pantalla
                              padding: const EdgeInsets.only(
                                  top: 10.0), // Padding superior de 10
                              child: Image.network(
                                'https://i.pinimg.com/564x/0f/99/9d/0f999d0117b093ca74ca1da3346e83f2.jpg', // Reemplaza esto con tu enlace de imagen
                                fit: BoxFit
                                    .cover, // Ajusta la imagen al contenedor
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return const Text('Error al cargar datos');
              }
            },
          ),
          bottomNavigationBar: Container(
            color: const Color.fromARGB(255, 49, 50, 53),
            child: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.leaderboard)),
                Tab(icon: Icon(Icons.cake)),
                Tab(icon: Icon(Icons.timer)),
                Tab(icon: Icon(Icons.chat)),
                Tab(icon: Icon(Icons.account_box)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
