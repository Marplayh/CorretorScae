import 'package:app_corretor/core/widgets/LeadForm_components.dart';
import 'package:app_corretor/core/widgets/lead_component.dart';
import 'package:app_corretor/data/models/lead.dart';
import 'package:app_corretor/data/services/listarleads_service.dart';
import 'package:flutter/material.dart';

class LeadScreen extends StatefulWidget {
  @override
  _LeadScreenState createState() => _LeadScreenState();
}

class _LeadScreenState extends State<LeadScreen> {
  // Lista de leads que será preenchida pela requisição
  List<Lead> leads = [];

  // Instancia o serviço de lead
  final LeadService _leadService = LeadService();

  @override
  void initState() {
    super.initState();
    _fetchLeads();
  }

  // Função para buscar os leads usando o serviço
  Future<void> _fetchLeads() async {
    try {
      final fetchedLeads = await _leadService.fetchLeadsFromAssets();
      setState(() {
        leads = fetchedLeads;
      });
    } catch (e) {
      debugPrint('Erro ao carregar os leads: $e');
      // Lidar com o erro
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leads'),
        backgroundColor: Colors.orange, // Cor da AppBar
      ),
      body: leads.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: leads.length,
              itemBuilder: (context, index) {
                return LeadCard(lead: leads[index], onTap: () => _showLeadDetails(context, leads[index]));
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () => _showLeadForm(context),
        child: Icon(Icons.add),
        tooltip: 'Cadastrar Novo Lead',
      ),
    );
  }

  // Exibe o Dialog de detalhes do Lead
  void _showLeadDetails(BuildContext context, Lead lead) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          lead.nome,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.orange,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Data Cadastro:', 
                  '${lead.dataCadastro.day}/${lead.dataCadastro.month}/${lead.dataCadastro.year}'),
              Divider(color: Colors.orangeAccent),
              _buildDetailRow('Empreendimento:', lead.empreendimento),
              Divider(color: Colors.orangeAccent),
              _buildDetailRow('Unidade:', lead.unidade),
              Divider(color: Colors.orangeAccent),
              SizedBox(height: 10),
              Text(
                'Observações:',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              SizedBox(height: 5),
              Text(
                lead.observacoes,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Fechar',
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ],
      );
    },
  );
}
Widget _buildDetailRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 5),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(lead.nome),
  //         content: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text('Data Cadastro: ${lead.dataCadastro.day}/${lead.dataCadastro.month}/${lead.dataCadastro.year}'),
  //             Text('Empreendimento: ${lead.empreendimento}'),
  //             Text('Unidade: ${lead.unidade}'),
  //             SizedBox(height: 10),
  //             Text('Observações:'),
  //             Text(lead.observacoes),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: Text('Fechar'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // Exibe o Dialog de cadastro de novo Lead
  void _showLeadForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cadastrar Novo Lead'),
          content: LeadForm(),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}