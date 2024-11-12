import 'package:get_it/get_it.dart';
import 'package:movie_app/modules/home/movie_details/presentation/di/home_di.dart';

void setup(GetIt di) {
  HomeDi().registerModule(di);
}
