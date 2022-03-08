import 'package:example_imc/controller/person_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  final String? title;

  const HomePage({Key? key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = PersonController();

  Widget _rowHeight() {
    return TextField(
      onChanged: controller.setHeight,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Altura'
      ),
      keyboardType: const TextInputType.numberWithOptions(),
    );
  }

  Widget _rowWeight() {
    return TextField(
      onChanged: controller.setWeight,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Peso'
      ),
      keyboardType: const TextInputType.numberWithOptions(),
    );
  }

  Widget _elevatedButton() {
    return ElevatedButton(
        onPressed: () {
          controller.getIMC();
          setState(() {});
        },
        child: const Text('Calcular'));
  }

  Widget _sizedBox() => const SizedBox(height: 10.0,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title!)),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _rowHeight(),
            _sizedBox(),
            _rowWeight(),
            _sizedBox(),
            _elevatedButton(),
            _sizedBox(),
            AnimatedBuilder(animation: controller, builder: (context, child) {
              return Text(controller.result);
            })
          ],
        ),
      )
    );
  }

}
