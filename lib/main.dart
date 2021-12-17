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
    'meters': 0,
    'kilometers': 1,
    'grams': 2,
    'kilograms': 3,
    'feet': 4,
    'miles': 5,
    'pounds (lbs)': 6,
    'ounces': 7,
  };

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
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];
  double? _numberFrom;
  String? _startMeasure;

  final TextStyle inputStyle = TextStyle(
    fontSize: 15,
    color: Colors.red[400],
    backgroundColor: Colors.white10,
  );

  final TextStyle labelStyle = const TextStyle(
    fontSize: 10,
    color: Colors.black,
    fontFamily: 'Alberto',
  );
  final TextStyle labelStyle2 = const TextStyle(
    fontSize: 15,
    color: Colors.cyan,
    fontFamily: 'Alberto',
    backgroundColor: Colors.black,
  );

  String? _convertedMeasure;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          elevation: 50.00, 
          backgroundColor: Colors.brown,
          title: Center(
            child: Column(
              children:<Widget> [
                Image.network('https://blog.ipler.edu.co/hubfs/estudiar_matematicas-1.png',width: 1130,height: 150,),
              const SizedBox(height: 10),
              const Text(
                  'CONVERSOR DE MEDIDAS',
                  style: TextStyle(
                      fontSize: 20.00, 
                      fontFamily: 'Alberto', 
                      color: Colors.cyanAccent),
                ),
              ],
            ),
          ),
          toolbarHeight: 200.00,
          leading: Image.asset(
            'img/utea.png',
            width: 60.00,
            height: 100.00,
          ),
        ),
        //__________________________________________________________________
        body: Container(
          padding: const EdgeInsets.all(30),
         
          color: Colors.brown[300],
         
          child: Column(
            children: [

              Container(
                 color: Colors.black26,
                    //width: 400,
                    height: 70,
                    padding: const EdgeInsets.all(10),
                   // margin: EdgeInsets.all(10),
                   alignment: Alignment.center,
                child: Row(
                  children:<Widget> [
                    Container( 
                      color: Colors.orange[900],
                      width: 160,
                      height: 48,
                     // margin: EdgeInsets.all(10),
                     alignment: Alignment.center,
                      child:Text(
                      'Ingrese valor:',
                      style: labelStyle,
                    ),),
                   const SizedBox(width: 20),
                Container(
                  width: 180,
                  color: Colors.white,
                  child: TextField(
                    style: inputStyle,
                    decoration: const InputDecoration(
                      hintText: "Ingrese el numero que desa convertir",
                    ),
                    onChanged: (text) {
                      //leemos el valor que el usuario ingresara
                      var rv = double.tryParse(text);
                      //luego actualizamos el estado en nuestra varible
                      if (rv != null) {
                        setState(() {
                          _numberFrom = rv;
                        });
                      }
                    },
                  ),
                ),
                  ],
                ),
              ),
              //espaciado

            const SizedBox(height: 5),

              Container(
                color: Colors.black26,
                    //width: 400,
                    height: 70,
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 2),
                   // margin: EdgeInsets.all(10),
                   alignment: Alignment.center,
                child: Row(
                  children: [
                    const SizedBox(height: 22),
                    Container(
                       color: Colors.orange[900],
                      width: 160,
                      height: 28,
                     // margin: EdgeInsets.all(10),
                     alignment: Alignment.center,
                      child: Text(
                        'convertir de.',
                        style: labelStyle,
                      ),
                    ),
                    const SizedBox(height:0),
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 180,
                      color: Colors.white,
                      child: DropdownButton(
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
                    ),
                  ],
                ),
              ),
            
            const SizedBox(height: 5),
              Container(
               color: Colors.black26,
                    //width: 400,
                    height: 70,
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 2),
                  alignment: Alignment.center,
                child: Row(
                  children: [
                    Container(
                       color: Colors.orange[900],
                      width: 160,
                      height: 28,
                     // margin: EdgeInsets.all(10),
                     alignment: Alignment.center,
                      child: Text(
                        'Convertir a:',
                        style: labelStyle,
                      ),
                    ),
                    const SizedBox(width: 0),
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 180,
                      color: Colors.white,
                  child: DropdownButton(
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
                ),

                  ],
                ),
              ),

              const SizedBox(height: 13),
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
              
              const SizedBox(height: 22),
              Text((_resultMessage == null) ? '' : _resultMessage.toString(),
                  style: labelStyle2),
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
    );
  }

  void convert(double value, String from, String to) {
    int? nFrom = _measuresMap[from];
    int? nTo = _measuresMap[to];
    var multiplier = _formulas[nFrom.toString()][nTo];
    double result = value * multiplier;
    if (result == 0) {
      _resultMessage = 'Esta conversion no es valida';
    } else {
      _resultMessage =
          '${_numberFrom.toString()} $_startMeasure es igual a  ${result.toString()} $_convertedMeasure';
    }
    setState(() {
      _resultMessage = _resultMessage;
    });
  }

  void initState() {
    _numberFrom = 0;
    super.initState();
  }
}
