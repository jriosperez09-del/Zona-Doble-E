
import 'package:flutter/material.dart';

void main() {
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
        scaffoldBackgroundColor: Colors.white,
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
      backgroundColor: const Color(0xFF050505),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: const Color(0xFF101010),
                border: Border.all(color: kRed, width: 1.5),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: kRed.withOpacity(0.25),
                    blurRadius: 25,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 116,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: kRed, width: 2),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: kRed.withOpacity(0.35),
                          blurRadius: 20,
                        ),
                      ],
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
                  const SizedBox(height: 22),
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
                  const SizedBox(height: 8),
                  Container(width: 100, height: 3, color: kRed),
                  const SizedBox(height: 12),
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
                    textCapitalization: TextCapitalization.characters,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Código de acceso',
                      labelStyle: const TextStyle(color: Colors.white70),
                      prefixIcon: const Icon(Icons.key_rounded, color: kRed),
                      filled: true,
                      fillColor: const Color(0xFF1C1C1C),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: kRed.withOpacity(0.55),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: kRed, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
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
                          : const Text(
                              'ENTRAR',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    '¿AÚN NO TIENES UNA CUENTA?',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 11),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: kRed, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'El registro estará disponible cuando conectemos el módulo de cuentas.',
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'REGISTRO',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'PROTOTIPO V0.1',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 10,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
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
  UserPoint(
    name: 'Gómez',
    phone: '55 0000 0000',
    vehicle: 'Nissan Sentra',
    plates: 'ABC-123-E',
    group: 'Doble E',
    x: .54, y: .45,
  ),
  UserPoint(
    name: 'Luis',
    phone: '55 0000 0001',
    vehicle: 'Dodge Attitude',
    plates: 'DEF-456-E',
    group: 'Doble E',
    x: .32, y: .62,
  ),
  UserPoint(
    name: 'Marco',
    phone: '55 0000 0002',
    vehicle: 'Chevrolet Aveo',
    plates: 'GHI-789-E',
    group: 'Doble E',
    x: .72, y: .30,
    emergency: true,
  ),
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

  void showUser(UserPoint user) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      showDragHandle: true,
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(22, 4, 22, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: user.emergency ? kRed : kBlack,
                  child: Icon(user.emergency ? Icons.warning_rounded : Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(user.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                ),
                if (user.emergency)
                  const Chip(
                    label: Text('EMERGENCIA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    backgroundColor: kRed,
                  ),
              ],
            ),
            const Divider(height: 28),
            _info(Icons.phone, 'Teléfono', user.phone),
            _info(Icons.directions_car, 'Vehículo', user.vehicle),
            _info(Icons.confirmation_number, 'Placas', user.plates),
            _info(Icons.groups, 'Grupo', user.group),
          ],
        ),
      ),
    );
  }

  Widget _info(IconData icon, String label, String value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 7),
    child: Row(
      children: [
        Icon(icon, size: 21, color: kRed),
        const SizedBox(width: 12),
        Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
        Expanded(child: Text(value)),
      ],
    ),
  );

  void triggerEmergency() {
    setState(() => emergency = !emergency);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: emergency ? kRed : kBlack,
        content: Text(emergency
            ? '🚨 Emergencia activada. En la versión conectada se avisará al grupo.'
            : 'Emergencia cancelada.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
        foregroundColor: Colors.white,
        title: const Text('ZONA DOBLE E', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.4)),
        actions: [
          IconButton(
            tooltip: 'Administración',
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminScreen())),
            icon: const Icon(Icons.admin_panel_settings_outlined),
          ),
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
            onUser: showUser,
          ),
          const UsersTab(),
          const ProfileTab(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (i) => setState(() => tab = i),
        backgroundColor: Colors.white,
        indicatorColor: kRed.withOpacity(.12),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.map_outlined), selectedIcon: Icon(Icons.map), label: 'Mapa'),
          NavigationDestination(icon: Icon(Icons.groups_outlined), selectedIcon: Icon(Icons.groups), label: 'Usuarios'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Perfil'),
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

  const MapTab({
    super.key,
    required this.locationOn,
    required this.emergency,
    required this.onLocation,
    required this.onEmergency,
    required this.onUser,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: CustomPaint(painter: MapPainter())),
        Positioned(
          top: 16, left: 16, right: 16,
          child: Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.94),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [BoxShadow(blurRadius: 16, color: Colors.black12)],
            ),
            child: const Row(
              children: [
                Icon(Icons.location_city, color: kRed),
                SizedBox(width: 9),
                Expanded(child: Text('Zona activa • León, Guanajuato', style: TextStyle(fontWeight: FontWeight.w800))),
                Icon(Icons.wifi, color: Colors.green),
              ],
            ),
          ),
        ),
        ...users.map((u) => Positioned(
          left: MediaQuery.of(context).size.width * u.x - 25,
          top: MediaQuery.of(context).size.height * u.y,
          child: GestureDetector(
            onTap: () => onUser(u),
            child: Column(
              children: [
                Container(
                  width: 48, height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: u.emergency ? kRed : kBlack,
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [BoxShadow(color: (u.emergency ? kRed : kBlack).withOpacity(.35), blurRadius: 12)],
                  ),
                  child: Icon(u.emergency ? Icons.warning_rounded : Icons.person, color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 3),
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                  child: Text(u.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                ),
              ],
            ),
          ),
        )),
        Positioned(
          left: 16, right: 16, bottom: 18,
          child: Column(
            children: [
              if (emergency)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: kRed, borderRadius: BorderRadius.circular(14)),
                  child: const Row(
                    children: [
                      Icon(Icons.warning_amber_rounded, color: Colors.white),
                      SizedBox(width: 10),
                      Expanded(child: Text('EMERGENCIA ACTIVA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900))),
                    ],
                  ),
                ),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: onLocation,
                      style: FilledButton.styleFrom(
                        backgroundColor: locationOn ? kBlack : Colors.grey.shade700,
                        minimumSize: const Size(0, 58),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      icon: Icon(locationOn ? Icons.location_on : Icons.location_off),
                      label: Text(locationOn ? 'UBICACIÓN ACTIVA' : 'UBICACIÓN APAGADA', style: const TextStyle(fontWeight: FontWeight.w900)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 72, height: 58,
                    child: FilledButton(
                      onPressed: onEmergency,
                      style: FilledButton.styleFrom(
                        backgroundColor: emergency ? kBlack : kRed,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: const Icon(Icons.warning_rounded, size: 30),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = const Color(0xFFEAEAEA)..strokeWidth = 1;
    canvas.drawColor(const Color(0xFFF8F8F8), BlendMode.src);
    for (double x = 0; x < size.width; x += 70) {
      canvas.drawLine(Offset(x, 0), Offset(x + size.height * .25, size.height), p);
    }
    for (double y = 30; y < size.height; y += 85) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y - size.width * .12), p);
    }
    final road = Paint()..color = Colors.white..strokeWidth = 20..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(0, size.height*.72), Offset(size.width, size.height*.36), road);
    canvas.drawLine(Offset(size.width*.12, 0), Offset(size.width*.7, size.height), road);
    final red = Paint()..color = kRed.withOpacity(.18)..strokeWidth = 5;
    canvas.drawLine(Offset(0, size.height*.72), Offset(size.width, size.height*.36), red);
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
        const Text('Usuarios conectados', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
        const SizedBox(height: 5),
        const Text('Toca un usuario para consultar sus datos.'),
        const SizedBox(height: 16),
        ...users.map((u) => Card(
          elevation: 0,
          color: u.emergency ? kRed.withOpacity(.08) : kLight,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: u.emergency ? kRed : kBlack,
              child: Icon(u.emergency ? Icons.warning : Icons.person, color: Colors.white),
            ),
            title: Text(u.name, style: const TextStyle(fontWeight: FontWeight.w900)),
            subtitle: Text('${u.vehicle} • ${u.plates}'),
            trailing: Icon(u.emergency ? Icons.warning_rounded : Icons.circle, color: u.emergency ? kRed : Colors.green, size: 18),
          ),
        )),
      ],
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const CircleAvatar(radius: 44, backgroundColor: kBlack, child: Icon(Icons.person, color: Colors.white, size: 48)),
        const SizedBox(height: 12),
        const Center(child: Text('Gómez', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900))),
        const Center(child: Text('Grupo Doble E', style: TextStyle(color: Colors.black54))),
        const SizedBox(height: 24),
        _row(Icons.phone, '55 0000 0000'),
        _row(Icons.directions_car, 'Nissan Sentra'),
        _row(Icons.confirmation_number, 'ABC-123-E'),
        _row(Icons.badge, 'Usuario'),
      ],
    );
  }

  Widget _row(IconData icon, String text) => Card(
    elevation: 0,
    color: kLight,
    child: ListTile(leading: Icon(icon, color: kRed), title: Text(text, style: const TextStyle(fontWeight: FontWeight.w700))),
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
        title: const Text('Administración', style: TextStyle(fontWeight: FontWeight.w900)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          _adminAction(context, Icons.person_add, 'Agregar usuario', 'Crear un nuevo usuario y asignar grupo.'),
          _adminAction(context, Icons.person_remove, 'Eliminar usuario', 'Dar de baja un usuario existente.'),
          _adminAction(context, Icons.key, 'Códigos de acceso', 'Crear y revocar códigos de invitación.'),
          _adminAction(context, Icons.admin_panel_settings, 'Subadministradores', 'Administrar permisos de subadministradores.'),
          _adminAction(context, Icons.groups, 'Grupos', 'Crear y administrar grupos.'),
        ],
      ),
    );
  }

  Widget _adminAction(BuildContext context, IconData icon, String title, String subtitle) => Card(
    elevation: 0,
    color: kLight,
    margin: const EdgeInsets.only(bottom: 12),
    child: ListTile(
      leading: CircleAvatar(backgroundColor: kBlack, child: Icon(icon, color: Colors.white)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$title: módulo pendiente para la conexión con la base de datos.')),
      ),
    ),
  );
}


