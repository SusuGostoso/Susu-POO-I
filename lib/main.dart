import 'package:flutter/material.dart';

class NewNavBar extends StatelessWidget {
  const NewNavBar({super.key});

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: botaoFoiTocado,
      items: const [
        BottomNavigationBarItem(
          label: "Cafés",
          icon: Icon(Icons.coffee_outlined),
        ),
        BottomNavigationBarItem(
          label: "Cervejas",
          icon: Icon(Icons.local_drink_outlined),
        ),
        BottomNavigationBarItem(
          label: "Nações",
          icon: Icon(Icons.flag_outlined),
        )
      ],
    );
  }
}

class NewBody extends StatelessWidget {
  const NewBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Text("La Fin Du Monde - Bock - 65 ibu"),
        ),
        Expanded(
          child: Text("Sapporo Premiume - Sour Ale - 54 ibu"),
        ),
        Expanded(
          child: Text("Duvel - Pilsner - 82 ibu"),
        ),
      ],
    );
  }
}

class NewAppBar extends AppBar {
  NewAppBar()
      : super(
          title: Text("Dicas"),
          backgroundColor: Colors.deepPurple,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => print("Pesquisando..."),
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () => print("Favoritos..."),
            ),
          ],
        );
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: NewAppBar(),
        body: NewBody(),
        bottomNavigationBar: NewNavBar(),
      ),
    );
  }
}

void main() {
  MyApp app = const MyApp();
  runApp(app);
}
