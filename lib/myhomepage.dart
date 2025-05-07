import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> notes = [
    {'content': 'cette liste est un test dans le premier bdd ', 'date': '2025-04-11'},
    {'content': 'cette liste est un test dans le second bdd', 'date': '2025-04-12'},
    {'content': 'cette liste est un test dans le troisieme bdd', 'date': '2025-04-13'},
    {'content': 'cette liste est un test dans le quatrieme bdd', 'date': '2025-04-14'},
    {'content': 'cette liste est un test dans le cinquieme bdd', 'date': '2025-04-15'},
    {'content': 'cette liste est un test dans le sixieme bdd', 'date': '2025-04-16'},
  ];

  // Fonction pour ajouter une note
  void _addNote() {
    setState(() {
      notes.add({
        'content': 'Nouvelle note',
        'date': DateTime.now().toIso8601String().split('T')[0],
      });
    });
  }

  // Fonction pour supprimer une note
  void _deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  // Fonction pour éditer une note
  void _editNote(int index) async {
    TextEditingController controller = TextEditingController(text: notes[index]['content']);
    
    // Afficher la fenêtre de dialogue pour éditer
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Modifier la note'),
          content: TextField(
            controller: controller,
            maxLines: null,
            decoration: InputDecoration(hintText: 'Entrez le nouveau contenu'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  // Sauvegarder les modifications de contenu et mettre à jour la date
                  notes[index]['content'] = controller.text;
                  notes[index]['date'] = DateTime.now().toIso8601String().split('T')[0]; // Mettre à jour la date
                });
                Navigator.of(context).pop(); // Fermer la fenêtre de dialogue
              },
              child: Text('Enregistrer'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Fermer sans sauvegarder
              child: Text('Annuler'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            Image.asset(
              "assets/images/supanote.png", // Logo de l'application
              height: 32,
            ),
            SizedBox(width: 10),
            Text(widget.title),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index]; // Récupérer la note à l'index
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          note['content']!, // Contenu de la note
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Mis à jour le : ${note['date']!}", // Afficher la date de mise à jour
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      // Bouton pour éditer la note
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.lightBlue),
                        onPressed: () => _editNote(index),
                      ),
                      // Bouton pour supprimer la note
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteNote(index),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote, // Ajouter une note lorsqu'on appuie sur le bouton
        tooltip: 'Ajouter une note',
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
