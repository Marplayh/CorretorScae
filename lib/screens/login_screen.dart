import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo ou imagem
            Image.asset("assets/logoscae.png", height: 100),
            SizedBox(height: 20),
            // Campos de login
            TextField(
              decoration: InputDecoration(
                labelText: "Usuário",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode adicionar a lógica para autenticação, por enquanto só vai navegar
                Navigator.pushNamed(context, '/home');
              },
              child: Text("Entrar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Substituído primary por backgroundColor
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
