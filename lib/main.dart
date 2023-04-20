import 'package:flutter/material.dart';

enum Genero { masculino, feminino }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  Genero? _generoSelecionado;
  bool _termosAceitos = false;

  void _submitForm() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Formulário está sendo processado...'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu formulário'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Repita o E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Gênero'),
            RadioListTile(
              title: const Text('Masculino'),
              value: Genero.masculino,
              groupValue: _generoSelecionado,
              onChanged: (Genero? value) {
                setState(() {
                  _generoSelecionado = value;
                });
              },
            ),
            RadioListTile(
              title: const Text('Feminino'),
              value: Genero.feminino,
              groupValue: _generoSelecionado,
              onChanged: (Genero? value) {
                setState(() {
                  _generoSelecionado = value;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text('Termos de uso'),
            SwitchListTile(
              title: const Text('Aceito os termos de uso'),
              value: _termosAceitos,
              onChanged: (bool value) {
                setState(() {
                  _termosAceitos = value;
                });
              },
            ),

            //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: _content ,duration: Duration(milliseconds: 200),));
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Enviar'),
              onPressed: () {
                _submitForm();
              },
            ),
          ],
        ),
      ),
    );
  }
}
