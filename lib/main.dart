//DEPENDENCIES
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:interface_3/ui/shopCard_ui.dart';

// UI
import '/ui/button_ui.dart';
import '/ui/custom_circle_avatar.dart';
import 'package:interface_3/ui/foodCard_ui.dart';
import 'package:interface_3/ui/profile_iu.dart';

//SERVICES
import 'services/firebase_service.dart';
import 'ui/chat_ui.dart';

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
          body: FutureBuilder<Map<String, List>>(
            future: fetchData(),
            builder: (BuildContext context,
                AsyncSnapshot<Map<String, List>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                final Map<String, List> data = snapshot.data!;
                final List userDBData = data['users'] ?? [];
                final List storeDBData = data['store'] ?? [];
                final List foodDBData = data['foods'] ?? [];
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
                                for (var userData in userDBData)
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
                          for (var userData in userDBData)
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

                    //FOOD TAB
                    Wrap(
                      children: [
                        if (snapshot.data != null)
                          for (var foodData in foodDBData)
                            CustomCard(
                              imageUrl: foodData['img'],
                              name: foodData['name'],
                              calories: foodData['calories'],
                            ),
                      ],
                    ),

                    //SHOP TAB
                    Wrap(
                      children: [
                        if (snapshot.data != null)
                          for (var storeData in storeDBData)
                            CustomShopCard(
                              imageUrl: storeData['img'],
                              name: storeData['name'],
                              price: storeData['price'],
                            ),
                      ],
                    ),

                    //MESAGES TAB
                    Wrap(
                      children: [
                        if (snapshot.data != null)
                          for (var userData in userDBData)
                            ChatMessage(
                              name: userData['name'],
                              message:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                              img: userData['img'],
                            ),
                      ],
                    ),
                    //LAST TAB
                    Column(
                      children: [
                        if (snapshot.data != null)
                          for (var userData in userDBData)
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
                Tab(icon: Icon(Icons.store)),
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
