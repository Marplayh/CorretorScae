class Lead {
  final String nome;
  final DateTime dataCadastro;
  final String empreendimento;
  final String unidade;
  final String observacoes;

  Lead({
    required this.nome,
    required this.dataCadastro,
    required this.empreendimento,
    required this.unidade,
    required this.observacoes,
  });

  // Construtor nomeado para converter JSON em Lead
  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      nome: json['nome'],
      dataCadastro: DateTime.parse(json['dataCadastro']),
      empreendimento: json['empreendimento'],
      unidade: json['unidade'],
      observacoes: json['observacoes'],
    );
  }
}
