import 'package:app_corretor/data/models/lead.dart';
import 'package:flutter/material.dart';

class LeadCard extends StatelessWidget {
  final Lead lead;
  final VoidCallback onTap;

  LeadCard({required this.lead, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      color: Colors.orange.shade50,
      child: ListTile(
        title: Text(lead.nome, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange.shade800)),
        subtitle: Text('Empreendimento: ${lead.empreendimento} - Unidade: ${lead.unidade}'),
        trailing: Text('${lead.dataCadastro.day}/${lead.dataCadastro.month}/${lead.dataCadastro.year}'),
        onTap: onTap,
      ),
    );
  }
}