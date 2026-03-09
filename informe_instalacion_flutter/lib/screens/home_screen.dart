import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          // --- 1. TARJETA ORIGINAL ---
          const Text("1. Tarjeta Original",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          _PlantsCard(context),

          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 20),

          // --- 2. ROW ESTRELLAS ---
          const Text("2. Row (Estrellas)",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          const SizedBox(height: 10),
          _buildStarsRow(),

          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 20),

          // --- 3. STACK KION (.jpg) ---
          const Text("3. Stack (Superposición)",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          const SizedBox(height: 10),
          _buildStack(),

          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 20),

          // --- 4. EXPANDED KION (.jpg) ---
          const Text("4. Expanded (Distribución)",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          const SizedBox(height: 10),
          _buildExpandedImages(),

          const SizedBox(height: 50),
        ],
      ),
    );
  }

  // ===========================================================================
  // WIDGETS
  // ===========================================================================

  Widget _PlantsCard(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 125,
      child: Card(
        elevation: 4,
        child: Row(
          children: <Widget>[
            Container(
              height: 125,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://metroio.vtexassets.com/arquivos/ids/240150/frontal-3106.jpg?v=638173826670800000',
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, err, stack) => const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 26),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Planta',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Quicksand',
                        color: Colors.brown,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Container(height: 1, width: 95, color: Colors.orange),
                const Text('Gabriela Zuñiga',
                    style: TextStyle(fontSize: 16, fontFamily: 'Quicksand')),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStarsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: Colors.green[500], size: 35),
        Icon(Icons.star, color: Colors.green[500], size: 35),
        Icon(Icons.star, color: Colors.green[500], size: 35),
        const Icon(Icons.star, color: Colors.black, size: 35),
        const Icon(Icons.star, color: Colors.black, size: 35),
      ],
    );
  }

  // --- CORRECCIÓN AQUÍ: .jpg ---
  Widget _buildStack() {
    return Center(
      child: Stack(
        alignment: const Alignment(0.6, 0.6),
        children: [
          const CircleAvatar(
            // CAMBIO: .jpeg -> .jpg
            backgroundImage: AssetImage('assets/images/kion.jpg'),
            radius: 80,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(5)),
            child: const Text('Kion',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // --- CORRECCIÓN AQUÍ TAMBIÉN: .jpg ---
  Widget _buildExpandedImages() {
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            // CAMBIO: .jpeg -> .jpg
            child: Image.asset('assets/images/kion.jpg', fit: BoxFit.cover),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blue,
              child: const Center(
                  child: Text("Kion Info",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
            ),
          ),
          Expanded(
            // CAMBIO: .jpeg -> .jpg
            child: Image.asset('assets/images/kion.jpg', fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
