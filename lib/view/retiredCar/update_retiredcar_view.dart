import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp1appli/view_model/retiredcar/update_retiredcar_view_model.dart';
import '../../config/app_settings.dart';

class UpdateRetiredcarView extends StatefulWidget{
    const UpdateRetiredcarView({Key? key}) : super(key: key);

  @override
  UpdateRetiredcarViewState createState() => UpdateRetiredcarViewState();
}

class UpdateRetiredcarViewState extends State<UpdateRetiredcarView> {

  UpdateRetiredCarViewModel updateRetiredCar = UpdateRetiredCarViewModel();
  TextEditingController _tecModel = TextEditingController() ;
  TextEditingController _tecLicensePlate = TextEditingController();
  TextEditingController _tecStatusVehicle = TextEditingController() ;

  late UpdateRetiredCarViewModel _lvm;

  @override
  void initState(){
    print ('UpdateRetiredCarViewState - initState()');
    this._lvm=Provider.of<UpdateRetiredCarViewModel>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    print('UpdateRetiredCarViewState - build()');
    final args = ModalRoute.of(context)?.settings.arguments as List<dynamic>;
    if(args[1].isNotEmpty){
      _tecModel.text = args[1];
    }
    if(args[2].isNotEmpty){
      _tecLicensePlate.text = args[2];
    }
    if(args[3].isNotEmpty){
      _tecStatusVehicle.text = args[3];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(AppSettings.APP_UPDATERETIREDCAR),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(top: 62, left: 10.0, right: 10.0, bottom: 10.0),
          children: <Widget>[
            Container(
              height: 35,
              child: new TextField(
                controller: _tecModel,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: AppSettings.strings.model,
                ),
              ),
            ),
            Container(
              height: 35,
              child: new TextField(
                controller: _tecLicensePlate,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: AppSettings.strings.licensePlate,
                ),
              ),
            ),
            Container(
              height: 35,
              child: new TextField(
                controller: _tecStatusVehicle,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: AppSettings.strings.statusVehicle,
                ),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 35.0),),

            Container(
              height: 35,
              child: new RaisedButton(
                onPressed: () async {
                  this._lvm.updateRetiredcar(args[0].toString(),
                     _tecModel.text.trim(), _tecLicensePlate.text.trim(), _tecStatusVehicle.text.trim());
                  Navigator.popAndPushNamed(context, '/retiredcar');
                },
                color: Colors.blue,
                child: new Text('Modifier',
                  style: new TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.blue),),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 35.0))
          ],
        ),
      ),
    );
  }
}