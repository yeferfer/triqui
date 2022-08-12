import '../pages/triqui_page.dart';

bool validator(dynamic wv, dynamic rv, cube) {
  if (wv != 2) {
    // log("ya se pinto");
    aux--;
    return true;
  } else {
    // log("No se ha pintado");
    rv;
    movements[cube - 1] = aux % 2 == 0 ? 0 : 1;
    return false;
  }
}
