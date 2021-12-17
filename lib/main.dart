import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /**/ 
  String? _resultMessage; ///////
  final Map<String, int> _measuresMap = {
    'meters': 0,'kilometers': 1,'grams': 2,'kilograms': 3,'feet': 4,
    'miles': 5,'pounds (lbs)': 6,'ounces': 7,};

    final dynamic _formulas = {
    '0': [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    '1': [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    '2': [0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.035274],
    '3': [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    '4': [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    '5': [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    '6': [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    '7': [0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1],
    };
  /* */
  final List<String> _measures = [
              'meters', 'kilometers', 'grams','kilograms',
              'feet','miles', 'pounds (lbs)', 'ounces',];
  double? _numberFrom;
  String? _startMeasure;

  final TextStyle inputStyle = TextStyle(
  fontSize: 20,
  color: Colors.blue[700],
  //backgroundColor:  Colors.teal,
  );

  final TextStyle labelStyle = const TextStyle(
  fontSize: 20,
  color: Colors.teal,
  fontFamily: 'Alberto',
  );

  String? _convertedMeasure;




  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Center(
            child: Text('Converciones',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 45.00),),),
          toolbarHeight: 100.00,
          leading: Image.asset('img/tierra.png',width:40.00,height: 80.00,),
          
        ),
        body: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Container(
            color: Colors.orange[100],
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text( 'Ingrese valor:', style: labelStyle,),
                //espaciado
                Spacer(),
                TextField(
                  style: inputStyle,
                  decoration: const InputDecoration(
                  hintText: "Ingrese el numero que desa convertir",
                  ),
                  onChanged: (text){
                    //leemos el valor que el usuario ingresara
                    var rv=double.tryParse(text);
                    //luego actualizamos el estado en nuestra varible
                    if(rv!=null){
                        setState(() {
                          _numberFrom=rv;
                        });
                    }
                  },
                ),
                const Spacer(flex: 3,),
                const Text('Convertir',style:TextStyle(fontFamily: 'Alberto')),
                const Spacer(flex: 3,),
                Text('de...',style: labelStyle,),
                DropdownButton(
                isExpanded: true,
                style: inputStyle,
                items: _measures.map((String value) {
                return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
                );
                }).toList(),
                onChanged: (String? value) {
                setState(() {
                _startMeasure = value;
                });
                },
                value: _startMeasure,
                ),
                Spacer(),
                  Text('a...',style: labelStyle,),
                  Spacer(),
                DropdownButton(
                isExpanded: true,
                style: inputStyle,
                items: _measures.map((String value) {
                return DropdownMenuItem<String>(
                value: value,
                child: Text(
                value,

                style: inputStyle,

                ),
                );
                }).toList(),
                onChanged: (String? value) {
                setState(() {
                _convertedMeasure = value;
                });
                },
                value: _convertedMeasure,
                ),
                Spacer(flex: 2,),
                RaisedButton(
                  child: Text(
                  'Convertir',
                  style: inputStyle,
                  ),
                  onPressed: () {
                  if (_startMeasure!.isEmpty ||
                  _convertedMeasure!.isEmpty ||
                  _numberFrom == 0) {
                  return;
                  } else {
                  convert(_numberFrom!, _startMeasure!, _convertedMeasure!);
                  }
                  },
                  
                  ),
                  Text((_resultMessage == null) ? '' : _resultMessage.toString(),style: labelStyle),
                /*
                  RaisedButton(
                    
                  child: Text(    
                  'Convertir',
                  style: inputStyle, ),

                  onPressed: () => true,),
                Spacer(flex: 2,),
                Text((_numberFrom == null) ? '' : _numberFrom.toString(),
                    style: labelStyle),
                    Spacer(
                    flex: 8,
                    ),*/
                                  //creamos un text que verifique si el valor se actulizo
               //Text((_numberFrom==null)?'':_numberFrom.toString()),   
              
               
                
              ],
              
            ),
          ),
        ),
        
      ),
    );
    
  }

void convert(double value, String from, String to) {
int? nFrom = _measuresMap[from];
int? nTo = _measuresMap[to];
var multiplier = _formulas[nFrom.toString()][nTo];
double result = value * multiplier;
    if (result == 0) {
    _resultMessage = 'This conversion cannot be performed';
    } else {
    _resultMessage =
    '${_numberFrom.toString()} $_startMeasure are ${result.toString()
    } $_convertedMeasure';
    }
    setState(() {
    _resultMessage = _resultMessage;
    });
}

  void initState(){
      _numberFrom=0;
      super.initState();
  }

  
}