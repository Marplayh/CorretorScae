import 'package:flutter/material.dart';

class LeadForm extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController empreendimentoController = TextEditingController();
  final TextEditingController unidadeController = TextEditingController();
  final TextEditingController observacoesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: nomeController,
          decoration: InputDecoration(labelText: 'Nome'),
        ),
        TextField(
          controller: empreendimentoController,
          decoration: InputDecoration(labelText: 'Empreendimento'),
        ),
        TextField(
          controller: unidadeController,
          decoration: InputDecoration(labelText: 'Unidade'),
        ),
        TextField(
          controller: observacoesController,
          decoration: InputDecoration(labelText: 'Observações'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lead Cadastrado')));
          },
          child: Text('Salvar Lead'),
        ),
      ],
    );
  }
}
