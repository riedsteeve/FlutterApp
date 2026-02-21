import 'package:flutter/material.dart';
import 'package:mon_cour_de_flutter/components/my_custom_button.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _Textcontroller = TextEditingController();
  final _Textcontroller2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _switchValue = false;

  String? submitedText;
  String? description;

  String? _validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Champ requis";
    }
    return null;
  }

//Les option de priorité
String? valeurDebase = "Non prioritaire";
final List<String> options = ["Non prioritaire", "Prioritaire", "Extremement prioritaire"];


  void _onSubmit() {
    if(_formKey.currentState!.validate()){
      setState(() {
        submitedText = _Textcontroller.text.trim();
        description = _Textcontroller2.text.trim();
    });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Formlaire envoyé avec succès!"),
          backgroundColor: Colors.green,
        ),
      );
    }
  }










  //UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulaire d'incident")),
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _Textcontroller,
                    decoration: const InputDecoration(
                      labelText: "Titre de l'incident",
                      border: OutlineInputBorder(),
                    ),
                    validator: _validator,
                    autovalidateMode: AutovalidateMode.disabled,
                  ),

                  const SizedBox(height: 7),

                  TextFormField(
                    controller: _Textcontroller2,
                    decoration: const InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
                    validator: _validator,
                    autovalidateMode: AutovalidateMode.disabled,
                  ),

                  const SizedBox(height: 12),

                  const Text ("Inforations supplémentaires :"),
                  SwitchListTile(
                    title: const Text("Etat de l'incident"),
                    subtitle: Text(_switchValue ? "Critique" : "Non critique"),
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),

                  const Text("Priorité de l'incident :"),
                  DropdownButton<String>(
                    value: valeurDebase,
                    items: options.map((String v){
                       return DropdownMenuItem<String>(
                        value: v,
                        child: Text(v),
                       );   
                    }).toList(),
                    onChanged: (value) => {
                      setState(() {
                        valeurDebase = value;
                      }),
                    },
                  ),
                      
                  
                  

                  const SizedBox(height: 12),
                  MyCustomButton(label: ("Envoyer"), onPressed: _onSubmit),
                ],
              ),
            ),
            const SizedBox(height: 12),
            if (submitedText != null && description != null && _switchValue) ...[
              Text(
                "Titre de la demande : $submitedText",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Description de la demande : $description",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Etat de la demande : $_switchValue",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Priorité de l'incident : $valeurDebase",
                style: TextStyle(fontSize: 18),
              ),
          ],
          ],
        ),
      ),
      ),
    );
  }
}
