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
        cuerpo: "Cuerpo ventanda 1", titulo: "Titulo ventana 1", imagen: "url"),
    CarouselModel(
        cuerpo: "Cuerpo ventanda 2", titulo: "Titulo ventana 2", imagen: "url"),
    CarouselModel(
        cuerpo: "Cuerpo ventanda 3", titulo: "Titulo ventana 3", imagen: "url")
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
                flex: 9,
                child: Container(
                  color: Colors.blue,
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
                            Text(carousel[index].imagen.toString()),
                            Text(carousel[index].titulo.toString()),
                            Text(carousel[index].cuerpo.toString())
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
                      color: Colors.blue,
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
                              child: Text("Siguiente")))))
            ],
          ),
        ),
      ),
    );
  }
}
