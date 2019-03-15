import 'package:http/http.dart' as http;
import 'package:jas_app/util/app_models.dart';
import 'dart:convert';
import 'package:jas_app/util/constants.dart';
import 'package:connectivity/connectivity.dart';

class ServiceAPI {

  // Singleton
  static ServiceAPI getInstance() {
      ServiceAPI mS;
      return mS != null ? mS : ServiceAPI();
  }


  //@route    /d_movies/
  //@desc     get all the shows data
  //@access   public
  Future<MovieRes> getMovieData() async {

    MovieRes res_d;
    // true , false
    bool con = await checkConnection();

    if(con){

      try{


        const req_d = {"name" : 'anant'};

        print('URL ---> ${BASE_URL}d_movies/');
        print('BODY ---> ${req_d}');


        final res = await http.post("${BASE_URL}d_movies/",
            headers: HEADERS,
            body: json.encode(req_d));

        switch (res.statusCode) {
          case 200:
            final j_data = json.decode(res.body);
            print('Res ---> ${res.body}');

            // API thorugh
            res_d = MovieRes.fromJson(j_data);
            return res_d;

//        case 401:
//        case 403:
//        case 405:
          default:
          // seeflt created
            res_d = MovieRes();
            res_d.status = false;
            res_d.message = 'UnAutherized : Status Code ${res.statusCode}';
            return res_d;
        }

      }catch(err){

        // self created
        res_d = MovieRes();
        res_d.status = false;
        //res_d.message = 'Caught ${err}';
        res_d.message = 'Failed to connect server';
        return res_d;

      }

    }else {

      // self created
      res_d = MovieRes();
      res_d.status = false;
      res_d.message = 'Check your internet connection';
      return res_d;

    }
  }

  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      // API
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      // API
      return true;
    }else {
      return false;
    }
  }


}