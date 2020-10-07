import 'package:flutter_test/flutter_test.dart';
import 'package:garita/app/cNegocio/negocioLogo.dart';
import 'package:garita/app/eRepositorio/baseLocal.dart';
import 'package:garita/app/gCatalogo/catalogoCamposGarita.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  NegocioLogo negocio = new NegocioLogo();
  BaseLocal baseLocal = new BaseLocal();
  String campoTestBaseLocal = 'TESTUNITARIO';
  String respuestaTestBaseLocal = 'correcto';

  test('Tengo conexión a internet?', () async {
    // Build our app and trigger a frame.
    bool respuesta;
    respuesta = await negocio.tengoInternet();
    expect(respuesta, true);
  });

  test('Puedo escribir localmente?', () async {
    // Build our app and trigger a frame.
    bool respuesta;
    respuesta =
        await baseLocal.escribir(campoTestBaseLocal, respuestaTestBaseLocal);
    expect(respuesta, true);
  });

  test('Puedo leer localmente?', () async {
    // Build our app and trigger a frame.
    String respuesta;
    respuesta = await baseLocal.leer(campoTestBaseLocal);
    expect(respuesta, respuestaTestBaseLocal);
  });

  test('Estoy registrado en alert?', () async {
    // Build our app and trigger a frame.
    await baseLocal.escribir(
        CatalogoCamposGarita().cod_garita, respuestaTestBaseLocal);
    bool respuestaLectura = await negocio.estoyRegistradoEnAlert();
    expect(respuestaLectura, true);
  });

  test('Se poblo entidad garita?', () async {
    // Build our app and trigger a frame.
    bool respuesta = await negocio.poblarEntidadGarita();
    expect(respuesta, true);
  });
}

/*
    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);*/
