import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fuel Manager',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final edtGasolina = TextEditingController();
  final edtEtanol = TextEditingController();
  String resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gasolina x Etanol'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                style: TextStyle(fontSize: 18),
                keyboardType: TextInputType.number,
                controller: edtGasolina,
                validator: (value) {
                  if (value.isEmpty) return 'Digite o preço da Gasolina!';
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Preço da Gasolina',
                ),
              ),
              TextFormField(
                style: TextStyle(fontSize: 18),
                keyboardType: TextInputType.number,
                controller: edtEtanol,
                validator: (value) {
                  if (value.isEmpty) return 'Digite o preço do Etanol!';
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Preço do Etanol',
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Calcular',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    final vGas = double.parse(edtGasolina.text);
                    final vEta = double.parse(edtEtanol.text);
                    final pct = (vEta / vGas) * 100.0;

                    setState(() {
                      if (pct > 70) {
                        resultado = pct.toStringAsFixed(0) +
                            '% Vale mais a pena usar Gasolina!';
                      } else {
                        resultado = pct.toStringAsFixed(0) +
                            '% Vale mais a pena usar Etanol!';
                      }
                    });
                  }
                },
              ),
              Center(
                child: Text(
                  resultado,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
