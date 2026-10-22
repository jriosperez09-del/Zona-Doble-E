import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ZonaDobleEApp());
}

const kRed = Color(0xFFD71920);
const kBlack = Color(0xFF101010);
const kDark = Color(0xFF1A1A1A);
const kLight = Color(0xFFF5F5F5);

class ZonaDobleEApp extends StatelessWidget {
  const ZonaDobleEApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zona Doble E',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: kRed),
        fontFamily: 'Arial',
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final code = TextEditingController();
  bool loading = false;

  void enter() async {
    setState(() => loading = true);
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: kBlack,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: kRed.withOpacity(0.25),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 120,
                  height: 105,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: kRed, width: 2),
                  ),
                  child: const Center(
                    child: Text(
                      'ZDE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'ZONA DOBLE E',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'CONECTADOS EN LA MISMA ZONA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 36),
                TextField(
                  controller: code,
                  decoration: InputDecoration(
                    labelText: 'Código de acceso',
                    labelStyle: const TextStyle(color: Colors.white70),
                    prefixIcon: const Icon(Icons.key_rounded, color: kRed),
                    filled: true,
                    fillColor: const Color(0xFF1C1C1C),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: kRed, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: kRed, width: 2),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: kRed,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: loading ? null : enter,
                    child: loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('INICIO', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, letterSpacing: 2)),
                  ),
                ),
                const SizedBox(height: 16),
                const Text('¿Aún no tienes una cuenta?', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 11)),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: kRed, width: 1.5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('El registro estará disponible cuando conectemos el módulo de cuentas')),
                      );
                    },
                    child: const Text('REGISTRO', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, letterSpacing: 2)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserPoint {
  final String name;
  final String phone;
  final String vehicle;
  final String plates;
  final String group;
  final double x;
  final double y;
  final bool emergency;

  const UserPoint({
    required this.name,
    required this.phone,
    required this.vehicle,
    required this.plates,
    required this.group,
    required this.x,
    required this.y,
    this.emergency = false,
  });
}

const users = [
  UserPoint(name: 'Gómez', phone: '55 0000 0000', vehicle: 'Nissan Sentra', plates: 'ABC-123-E', group: 'Doble E', x: .54, y: .45),
  UserPoint(name: 'Luis', phone: '55 0000 0001', vehicle: 'Dodge Attitude', plates: 'DEF-456-E', group: 'Doble E', x: .32, y: .62),
  UserPoint(name: 'Marco', phone: '55 0000 0002', vehicle: 'Chevrolet Aveo', plates: 'GHI-789-E', group: 'Doble E', x: .72, y: .30, emergency: true),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tab = 0;
  bool locationOn = true;
  bool emergency = false;

  void showUserPoint(UserPoint u) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              CircleAvatar(
                backgroundColor: u.emergency ? kRed : kBlack,
                child: Icon(u.emergency ? Icons.warning_rounded : Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(u.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
              if (u.emergency) Chip(label: const Text('EMERGENCIA'), backgroundColor: kRed, labelStyle: const TextStyle(color: Colors.white)),
            ]),
            const Divider(height: 28),
            _info(Icons.phone, 'Teléfono', u.phone),
            _info(Icons.car_rental, 'Vehículo', u.vehicle),
            _info(Icons.location_on, 'Placas', u.plates),
            _info(Icons.groups, 'Grupo', u.group),
          ],
        ),
      ),
    );
  }

  Widget _info(IconData icon, String label, String value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 7),
    child: Row(children: [
      Icon(icon, size: 21, color: kRed),
      const SizedBox(width: 12),
      Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
      Expanded(child: Text(value)),
    ]),
  );

  void triggerEmergency() {
    setState(() => emergency = !emergency);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(emergency
            ? '🚨 Emergencia activada. En la versión conectada se avisará a todo el grupo.'
            : 'Emergencia cancelada.'),
        backgroundColor: emergency ? kRed : kBlack,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kBlack,
        foregroundColor: Colors.white,
        title: const Text('ZONA DOBLE E', style: TextStyle(fontWeight: FontWeight.w900)),
        actions: [
          IconButton(tooltip: 'Administración', onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminScreen())), icon: const Icon(Icons.admin_panel_settings_outlined)),
        ],
      ),
      body: IndexedStack(
        index: tab,
        children: [
          MapTab(
            locationOn: locationOn,
            emergency: emergency,
            onLocation: () => setState(() => locationOn = !locationOn),
            onEmergency: triggerEmergency,
            onUser: showUserPoint,
          ),
          const UsersTab(),
          const ProfileTab(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (i) => setState(() => tab = i),
        indicatorColor: kRed.withOpacity(.15),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.map), label: 'Mapa'),
          NavigationDestination(icon: Icon(Icons.people), label: 'Usuarios'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Perfil'),
        ],
      ),
    );
  }
}

class MapTab extends StatelessWidget {
  final bool locationOn;
  final bool emergency;
  final VoidCallback onLocation;
  final VoidCallback onEmergency;
  final void Function(UserPoint) onUser;

  const MapTab({super.key, required this.locationOn, required this.emergency, required this.onLocation, required this.onEmergency, required this.onUser});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: CustomPaint(painter: MapPainter())),
        const Positioned(top: 16, left: 16, right: 16, child: MapHeader()),
        Positioned(
          left: 16, bottom: 16, right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(children: [
                Icon(Icons.location_city, color: kRed),
                const SizedBox(width: 9),
                Expanded(child: Text('Zona activa • León, Guanajuato', style: TextStyle(color: Colors.white, fontSize: 15, shadows: [Shadow(color: Colors.black45, blurRadius: 4)])),
                Icon(Icons.wifi, color: Colors.green),
              ]),
              const SizedBox(height: 16),
              Row(children: [
                Expanded(child: FilledButton.icon(
                  onPressed: onLocation,
                  style: FilledButton.styleFrom(
                    backgroundColor: locationOn ? kRed : Colors.grey.shade700,
                    minimumSize: const Size(0, 58),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  icon: Icon(locationOn ? Icons.location_off : Icons.location_on),
                  label: Text(locationOn ? 'UBICACIÓN ACTIVA' : 'UBICACIÓN APAGADA'),
                )),
                const SizedBox(width: 16),
                Expanded(child: FilledButton.icon(
                  onPressed: onEmergency,
                  style: FilledButton.styleFrom(
                    backgroundColor: emergency ? Colors.red.shade900 : kRed,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  icon: const Icon(Icons.warning_amber_rounded, size: 30),
                  label: Text(emergency ? 'EMERGENCIA ACTIVA' : 'BOTÓN DE EMERGENCIA'),
                )),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}

class MapHeader extends StatelessWidget {
  const MapHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.94),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: const Row(children: [
        Icon(Icons.info_outline, color: Colors.grey),
        SizedBox(width: 8),
        Expanded(child: Text('Tus compañeros conectados aparecerán aquí en tiempo real', style: TextStyle(color: Colors.black54))),
      ]),
    );
  }
}

class MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final road = Paint()..color = const Color(0xFFEEEEEE)..strokeWidth = 1;
    canvas.drawRect(Offset.zero & size, Paint()..color = Colors.white);
    for (double y = 30; y < size.height; y += size.height * .25) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), road);
    }
    for (double x = 30; x < size.width; x += size.width * .25) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), road);
    }
    for (final u in users) {
      final pos = Offset(u.x * size.width, u.y * size.height);
      final dot = Paint()..color = u.emergency ? kRed : kBlack;
      canvas.drawCircle(pos, u.emergency ? 20 : 14, dot);
      if (u.emergency) {
        final ring = Paint()..color = kRed.withOpacity(.35)..style = PaintingStyle.stroke..strokeWidth = 3;
        canvas.drawCircle(pos, 30, ring);
      }
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class UsersTab extends StatelessWidget {
  const UsersTab({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Usuarios conectados', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        const Text('Solo tú y tu grupo podrán consultar sus datos.', style: TextStyle(color: Colors.black54)),
        const SizedBox(height: 16),
        ...users.map((u) => Card(
          elevation: 0,
          margin: const EdgeInsets.only(bottom: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: u.emergency ? kRed : kBlack,
              child: Icon(u.emergency ? Icons.warning_amber_rounded : Icons.person, color: Colors.white),
            ),
            title: Text(u.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${u.vehicle} • ${u.plates}'),
            trailing: Icon(Icons.chevron_right, color: kRed),
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                builder: (_) => Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(u.name, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 24),
                      _rowInfo(Icons.phone, 'Teléfono', u.phone),
                      _rowInfo(Icons.car_rental, 'Vehículo', u.vehicle),
                      _rowInfo(Icons.location_on, 'Placas', u.plates),
                      _rowInfo(Icons.groups, 'Grupo', u.group),
                    ],
                  ),
                ),
              );
            },
          ),
        )),
      ],
    );
  }

  Widget _rowInfo(IconData icon, String label, String value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(children: [
      Icon(icon, color: kRed),
      const SizedBox(width: 12),
      Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
      Expanded(child: Text(value)),
    ]),
  );
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const CircleAvatar(radius: 44, backgroundColor: kBlack, child: Icon(Icons.person, size: 44, color: Colors.white)),
        const SizedBox(height: 20),
        const Center(child: Text('Gómez', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
        const Center(child: Text('"Doble E"', style: TextStyle(fontSize: 16, color: Colors.black54))),
        const SizedBox(height: 24),
        _rowData(Icons.phone, 'Teléfono', '55 0000 0000'),
        _rowData(Icons.car_rental, 'Vehículo', 'Nissan Sentra'),
        _rowData(Icons.location_on, 'Placas', 'ABC-123-E'),
      ],
    );
  }

  Widget _rowData(IconData icon, String label, String value) => Card(
    margin: const EdgeInsets.symmetric(vertical: 7),
    child: ListTile(leading: Icon(icon, color: kRed), title: Text(label), subtitle: Text(value)),
  );
}

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
        foregroundColor: Colors.white,
        title: const Text('Administración'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          _adminTile(Icons.person_add, 'Agregar usuario', 'Crear nuevo usuario y asignar grupo', () {}),
          _adminTile(Icons.group, 'Grupos', 'Crear y administrar grupos', () {}),
          _adminTile(Icons.key, 'Códigos de acceso', 'Crear y revocar códigos de ingreso', () {}),
          _adminTile(Icons.settings, 'Configuración', 'Subadministradores, notificaciones', () {}),
        ],
      ),
    );
  }

  Widget _adminTile(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: kRed.withOpacity(.1), child: Icon(icon, color: kRed)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
