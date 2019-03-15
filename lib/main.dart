import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jas_app/util/app_models.dart';
import 'dart:convert';

import 'package:jas_app/util/service_api.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jas\'s App',
      home: Dummy(),
      theme: ThemeData.dark(),
    );
  }
}


class Dummy extends StatefulWidget {
  @override
  _DummyState createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: FlatButton(onPressed: (){

        Navigator.push(context, MaterialPageRoute(
            settings: RouteSettings(name: '/movie_detail'),
            builder: (c) {
              return Home();
            }));

      }, child: Text('Press here'))),
    );
  }
}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ServiceAPI mS;

  @override
  void initState() {
    mS = ServiceAPI.getInstance();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Home Page'),),
      body: FutureBuilder(
        initialData: null,
        future: mS.getMovieData(),
        builder: (BuildContext context, /*AsyncSnapshot<MovieRes>*/ snap){
          return _checkAPIData(context, snap);
        },
      ),
    );
  }

  Widget _checkAPIData(BuildContext c , AsyncSnapshot snap ) {
    if(snap.hasData){
      // API
      // 404
      // catch
      MovieRes _d = snap.data;
    
    
      if(_d.status){
        // API true
        return _buildList(_d);
      }else {

        return Center(child: Text('${_d.message}' ?? 'Something went wrong'));


//        final snackBar = SnackBar(content: Text('${_d.message}' ?? 'Something went wrong'));
//        Scaffold.of(c).showSnackBar(snackBar);

      }
    
    }else {
      // initial loading
      return Center(child:  CircularProgressIndicator());
    }
  }



  Widget _buildList(MovieRes _d){
    return ListView.builder(
        itemCount: _d.moviesList.length ?? 0,
        itemBuilder: (BuildContext context, int i){

          MovieM _m = _d.moviesList[i];

          return ListTile(
            leading: Text(_m.original_title),
            title: Text(_m.release_date),
          );
        });
  }
}
