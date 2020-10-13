import 'package:flutter/material.dart';

class Weight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weight On Planet X',
        home: WeightStateful(title: 'Weight On Planet X'));
  }
}

class WeightStateful extends StatefulWidget {
  WeightStateful({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return WeightState();
  }
}

class WeightState extends State<WeightStateful> {
  int planets;
  double currentPlanetWeight;
  final TextEditingController _weightController = new TextEditingController();

  handleRadio(int value) {
    setState(() {
      planets = value;
      currentPlanetWeight = null;
    });
  }

  calculateWeight() {
    setState(() {
      int weight = int.parse(_weightController.value.text.toString());
      double mass = weight / 10;
      switch (planets) {
        case 0:
          currentPlanetWeight = mass * 0.62;
          break;
        case 1:
          currentPlanetWeight = mass * 3.72;
          break;
        case 2:
          currentPlanetWeight = mass * 8.87;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          widget.title,
        ),
      )),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Image.asset('images/planet.png', width: 150, height: 75),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter your Weight',
                  hintText: 'In KG',
                  icon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 0,
                    groupValue: planets,
                    onChanged: handleRadio,
                    activeColor: Colors.greenAccent,
                  ),
                  Text('Pluto'),
                  Radio(
                    value: 1,
                    groupValue: planets,
                    onChanged: handleRadio,
                    activeColor: Colors.greenAccent,
                  ),
                  Text('Mars'),
                  Radio(
                    value: 2,
                    groupValue: planets,
                    onChanged: handleRadio,
                    activeColor: Colors.greenAccent,
                  ),
                  Text('Venus')
                ],
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  color: Colors.blue[200],
                  child:
                      Text('CALCULATE', style: TextStyle(color: Colors.white)),
                  onPressed: calculateWeight),
              SizedBox(
                height: 40,
              ),
              currentPlanetWeight != null
                  ? Text(
                      'Your weight is ${currentPlanetWeight.toStringAsFixed(2)} KG')
                  : Text('')
            ],
          )),
    );
  }
}
