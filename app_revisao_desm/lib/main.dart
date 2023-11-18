import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("SVAR Hospedagens"),
          ),
          body: ListView(
            children: [
              Destino(
                  'Angra dos Reis',
                  384,
                  70,
                  'images/angra.jpeg',
                  'RS 384/Dia - RS 70/Pessoa',
                  '1 Quarto, banheiro, televisão, wifi, ar-condicionado'),
              Destino(
                  'Jericoacoara',
                  571,
                  75,
                  'images/jeri.jpeg',
                  'RS 571/Dia - RS 75/Pessoa',
                  '1 Quarto, banheiro, televisão, wifi, ar-condicionado'),
              Destino(
                  'Arraial do Cabo',
                  534,
                  65,
                  'images/arraial.jpeg',
                  'RS 534/Dia - RS 65/Pessoa',
                  '1 Quarto, banheiro, televisão, wifi, ar-condicionado'),
              Destino(
                  'Florianópolis',
                  378,
                  85,
                  'images/floripa.jpeg',
                  'RS 378/Dia - RS 85/Pessoa',
                  '1 Quarto, banheiro, televisão, wifi, ar-condicionado'),
              Destino(
                  'Madri',
                  401,
                  85,
                  'images/madri.jpeg',
                  'RS 401/Dia - RS 85/Pessoa',
                  '1 Quarto, banheiro, televisão, wifi, ar-condicionado'),
              Destino(
                  'Paris',
                  546,
                  95,
                  'images/paris.jpeg',
                  'RS 546/Dia - RS 95/Pessoa',
                  '1 Quarto, banheiro, televisão, wifi, ar-condicionado'),
              Destino(
                  'Orlando',
                  616,
                  105,
                  'images/orlando.jpeg',
                  'RS 616/Dia - RS 105/Pessoa',
                  '1 Quarto, banheiro, televisão, wifi, ar-condicionado'),
              Destino(
                  'Las Vegas',
                  504,
                  110,
                  'images/vegas.jpeg',
                  'RS 504/Dia - RS 110/Pessoa',
                  '1 Quarto, banheiro, televisão, wifi, ar-condicionado'),
              Destino(
                  'Roma',
                  478,
                  85,
                  'images/roma.jpeg',
                  'RS 478/Dia - RS 85/Pessoa',
                  '1 Quarto, banheiro, televisão, wifi, ar-condicionado'),
              Destino(
                  'Chile',
                  446,
                  95,
                  'images/chile.jpeg',
                  'RS 446/Dia - RS 95/Pessoa',
                  '1 Quarto, banheiro, televisão, wifi, ar-condicionado'),
            ],
          )),
    );
  }
}

class Destino extends StatefulWidget {
  final String nome_c;
  final String img;
  final String valorDiaria;
  final String descricao;
  int vp;
  int vd;
  // final antes do tipo da variavel
  // protege contra alteração acidental

  Destino(
      this.nome_c, this.vd, this.vp, this.img, this.valorDiaria, this.descricao,
      {super.key});

  @override
  State<Destino> createState() => _DestinoState();
}

class _DestinoState extends State<Destino> {
  String? mensagem;
  int qtdeDia = 0;
  int qtdePessoa = 0;
  int valorTotal = 0;
  int ok = 0;
  int ok2 = 0;
  // _ funçao publica
  void _printmsg() {
    // set state monitora o estado da variavel
// da classe statefull
    setState(() {
      mensagem = "Mobile";
    });
  }

  void _incqtdedia() {
    setState(() {
      qtdeDia++;
    });
  }

  void _incqtdepessoas() {
    setState(() {
      qtdePessoa++;
    });
  }

  void _limpar() {
    setState(() {
      ok = 0;
      ok2 = 0;
      valorTotal = 0;
      qtdeDia = 0;
      qtdePessoa = 0;
    });
  }

  void _calcTotal() {
    setState(() {
      ok = qtdeDia * widget.vd;
      ok2 = qtdePessoa * widget.vp;
      valorTotal = ok + ok2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.blue,
              width: 393,
              height: 250,
              child: Image.asset(
                widget.img,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              "${widget.nome_c}",
              style: TextStyle(fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${widget.valorDiaria}",
                style: TextStyle(fontSize: 25, color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${widget.descricao}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  width: 300,
                  height: 40,
                  child: Text(
                    "Quantidade de dias: $qtdeDia",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ),
                ElevatedButton(onPressed: _incqtdedia, child: Icon(Icons.add)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  width: 300,
                  height: 40,
                  child: Text(
                    "Quantidade de pessoas: $qtdePessoa",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ),
                ElevatedButton(
                    onPressed: _incqtdepessoas, child: Icon(Icons.add)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,
                    width: 300,
                    height: 30,
                    child: Text(
                      "Valor Total R\$: ${valorTotal}",
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(onPressed: _calcTotal, child: Text("Calcular")),
              ElevatedButton(onPressed: _limpar, child: Text("Limpar")),
            ])
          ],
        ),
      ),
    );
  }
}
