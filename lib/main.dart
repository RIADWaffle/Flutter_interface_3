//DEPENDENCIES
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
          body: TabBarView(
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
                        CustomCircleAvatar(
                          imageUrl:
                              'https://i.pinimg.com/736x/33/b3/e9/33b3e9680e210b46805866d9b1ff7266.jpg',
                          borderColor: const Color.fromARGB(255, 192, 192, 192),
                          size: 96,
                          name: "kukas",
                          numbers: "123",
                        ),
                        CustomCircleAvatar(
                          imageUrl:
                              'https://i.pinimg.com/736x/33/b3/e9/33b3e9680e210b46805866d9b1ff7266.jpg',
                          borderColor: const Color.fromARGB(255, 212, 175, 55),
                          size: 125,
                          name: "kukas",
                          numbers: "123",
                        ),
                        CustomCircleAvatar(
                          imageUrl:
                              'https://i.pinimg.com/736x/33/b3/e9/33b3e9680e210b46805866d9b1ff7266.jpg',
                          borderColor: const Color.fromARGB(255, 191, 137, 112),
                          size: 88,
                          name: "kukas",
                          numbers: "123",
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: buildElevatedButton(
                        1,
                        "https://i.pinimg.com/736x/33/b3/e9/33b3e9680e210b46805866d9b1ff7266.jpg",
                        "kukas",
                        "123", () {
                      // Acción del segundo botón
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: buildElevatedButton(
                        1,
                        "https://i.pinimg.com/736x/33/b3/e9/33b3e9680e210b46805866d9b1ff7266.jpg",
                        "kukas",
                        "123", () {
                      // Acción del segundo botón
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: buildElevatedButton(
                        1,
                        "https://i.pinimg.com/736x/33/b3/e9/33b3e9680e210b46805866d9b1ff7266.jpg",
                        "kukas",
                        "123", () {
                      // Acción del tercer botón
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: buildElevatedButton(
                        1,
                        "https://i.pinimg.com/736x/33/b3/e9/33b3e9680e210b46805866d9b1ff7266.jpg",
                        "kukas",
                        "123", () {
                      // Acción del cuarto botón
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: buildElevatedButton(
                        1,
                        "https://i.pinimg.com/736x/33/b3/e9/33b3e9680e210b46805866d9b1ff7266.jpg",
                        "kukas",
                        "123", () {
                      // Acción del segundo botón
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: buildElevatedButton(
                        1,
                        "https://i.pinimg.com/736x/33/b3/e9/33b3e9680e210b46805866d9b1ff7266.jpg",
                        "kukas",
                        "123", () {
                      // Acción del segundo botón
                    }),
                  ),
                ],
              ),

              // Otros tabs
              const Icon(Icons.cake),
              const Icon(Icons.timer),
              const Icon(Icons.chat),
              const Icon(Icons.account_box),
            ],
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
