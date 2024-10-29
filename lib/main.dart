import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  final Map<String, String> biodata = const {
    'name': 'Nailong (Dino)',
    'email': 'nailong@dinokuning.com',
    'phone': '+62345678910',
    'image': 'nailong.png',
    'hobby': 'Mwehehehe',
    'addr': 'Semarang Van Houten',
    'desc':
        "'A bard that seems to have arrived on some unknown wind — sometimes sings songs as old as the hills, and other times sings poems fresh and new. Likes apples and lively places but is not a fan of cheese or anything sticky. When using his Anemo power to control the wind, it often appears as feathers, as he's fond of that which appears light and breezy.'"
  };

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Biodata",
      home: Scaffold(
        appBar: AppBar(title: const Text("Aplikasi Biodata")),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              teksKotak(Colors.black, biodata['name'] ?? ''),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: Image.asset('assets/${biodata["image"] ?? ''}'),
              ),
              const SizedBox(height: 10),
              const Text(
                'Description:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  btnContact(Icons.alternate_email, Colors.green[900],
                      "mailto:${biodata['email'] ?? ''}"),
                  btnContact(Icons.mark_email_read, Colors.blueAccent,
                      "https://wa.me/${biodata['phone']}"),
                  btnContact(Icons.phone, Colors.deepPurple,
                      "tel:${biodata['phone']}"),
                ],
              ),
              const SizedBox(height: 10),
              textAttribute('Hobby', biodata['hobby'] ?? ''),
              const SizedBox(height: 5),
              textAttribute('Alamat', biodata['addr'] ?? ''),
              const SizedBox(height: 10),
              teksKotak(Colors.black38, 'Deskripsi'),
              Text(
                biodata['desc'] ?? '',
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container teksKotak(Color bgColor, String teks) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Text(
        teks,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Row textAttribute(String judul, String teks) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            '- $judul ',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const Text(': '),
        Expanded(
          child: Text(
            teks,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Expanded btnContact(IconData icon, Color? color, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          launchUrl(Uri.parse(uri));
        },
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: color,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
