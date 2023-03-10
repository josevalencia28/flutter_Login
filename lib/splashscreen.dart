import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/model.carrousel.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyAppCarrousel(),
    );
  }
}

class MyAppCarrousel extends StatefulWidget {
  const MyAppCarrousel({super.key});

  @override
  State<MyAppCarrousel> createState() => _MyAppState();
}

class _MyAppState extends State<MyAppCarrousel> {
  List<CarouselModel> carousel = [
    CarouselModel(
      cuerpo: "Bienvenido",
      imagen: "",
      titulo: "",
      github: "",
    ),
    CarouselModel(
      cuerpo: "Elaborado por:",
      titulo: "Jose Luis Valencia Ariza",
      github: "Github:",
      imagen: " https://github.com/josevalencia28/Flutter.git",
    )
  ];
  int contador = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SafeArea(
        top: false,
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  color: Colors.white,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: carousel.length,
                    onPageChanged: (value) => contador = value,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(carousel[index].cuerpo.toString()),
                            Text(carousel[index].titulo.toString()),
                            Text(carousel[index].github.toString()),
                            Text(carousel[index].imagen.toString()),
                          ],
                        )),
                      );
                    },
                  ),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: Container(
                      color: Colors.white,
                      child: Center(
                          child: ElevatedButton(
                              onPressed: () {
                                if (contador == carousel.length - 1) {
                                  contador = 0;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          MyApp(),
                                    ),
                                  );
                                }
                              },
                              // ignore: prefer_const_constructors
                              child: Text("Siguiente")))))
            ],
          ),
        ),
      ),
    );
  }
}
