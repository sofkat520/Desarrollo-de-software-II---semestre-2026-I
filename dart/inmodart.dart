// 1. Definición de tipos y clases
sealed class Inmueble {}

class Casa extends Inmueble {
  final int habitaciones;
  final double metrosCuadrados;
  Casa(this.habitaciones, this.metrosCuadrados);
}

class Apartamento extends Inmueble {
  final int piso;
  final bool tieneAscensor;
  Apartamento(this.piso, this.tieneAscensor);
}

typedef InfoFinanciera = (double lat, double lng, {String zona, double precio});

// 2. Función de procesamiento
void procesarCatalogo(List<(Inmueble, InfoFinanciera)> catalogo) {
  print('---  REPORTE DE PROPIEDADES INMODART  ---\n');

  for (var (inmueble, info) in catalogo) {
    // Destructuring del Record
    var (lat, lng, zona: zonaNombrada, precio: precioBase) = info;

    // Pattern Matching para categoría
    String categoria = switch (inmueble) {
      Casa(habitaciones: > 4) => 'Mansión Familiar',
      Casa() => 'Casa Estándar',
      Apartamento(piso: > 10, tieneAscensor: true) => 'Penthouse / Atico',
      Apartamento(tieneAscensor: false) => 'Dep. Acceso por Escalera',
      _ => 'Propiedad General',
    };

    // Cálculo de precio base según rangos
    double precioFinal = switch (precioBase) {
      < 50000 => precioBase * 0.95,
      >= 50000 && <= 150000 => precioBase,
      _ => precioBase * 1.10,
    };

    // --- MODIFICACIÓN: Descuento por piso alto sin ascensor ---

    if (inmueble case Apartamento(piso: > 5, tieneAscensor: false)) {
      precioFinal -= 2000;
      print('¡Aviso: Descuento de \$2000 aplicado a esta unidad!');
    }

    print('Tipo: $categoria');
    print('Ubicación: [$lat, $lng] en Zona: $zonaNombrada');
    print('Precio Final: \$\$${precioFinal.toStringAsFixed(2)}\n');
  }
}

// 3. Punto de entrada
void main() {
  var listaPropiedades = [
    (Casa(5, 250.0), (-12.04, -77.03, zona: 'Miraflores', precio: 180000.0)),
    (
      Apartamento(12, true),
      (-12.08, -76.99, zona: 'San Isidro', precio: 120000.0)
    ),
    (
      Apartamento(6, false),
      (-12.12, -77.01, zona: 'Surquillo', precio: 45000.0)
    ), // Este debería aplicar el descuento
  ];

  procesarCatalogo(listaPropiedades);
}
