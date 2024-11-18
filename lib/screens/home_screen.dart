import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String corretorNome = "João Correia"; // Nome do corretor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem-vindo, $corretorNome"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Foto do corretor
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/corretor.png"),
            ),
            SizedBox(height: 16),
            // Nome do corretor
            Text(
              corretorNome,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32),
            // Botões de opções
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/leads');

              },
              icon: Icon(Icons.person_search),
              label: Text("Visualizar Leads"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.orange, // Substituído primary por backgroundColor
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                print("Reservas");
              },
              icon: Icon(Icons.bookmark),
              label: Text("Reservas"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.orange, // Substituído primary por backgroundColor
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                print("Funil de Vendas");
              },
              icon: Icon(Icons.analytics),
              label: Text("Funil de Vendas"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.orange, // Substituído primary por backgroundColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}
