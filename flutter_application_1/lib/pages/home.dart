import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/profile.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor:  Colors.tealAccent.shade700,
        actions: [
          // Explore Item Icon Button
          IconButton(
            icon: const Icon(Icons.fastfood),
            onPressed: () {
              Navigator.of(context).pushNamed('/list-food');
            },
          ),
          // Profile Icon Button
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Removed the AnimatedScaleButton
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    backgroundColor: Color.fromARGB(255, 194, 168, 230),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Login Here",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/register');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    backgroundColor: Color.fromARGB(255, 121, 210, 198),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Register Here",
                    style: TextStyle(fontSize: 18, color: Colors.white),
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

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home"),
//         backgroundColor: Colors.tealAccent.shade700,
//         actions: [
//           // Explore Item Icon Button
//           IconButton(
//             icon: const Icon(Icons.fastfood),
//             onPressed: () {
//               Navigator.of(context).pushNamed('/list-food');
//             },
//           ),
//           // Profile Icon Button
//           IconButton(
//             icon: const Icon(Icons.person),
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => const ProfilePage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.blue.shade300,
//               Colors.blue.shade700,
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Card(
//                   elevation: 8,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const AnimatedScaleButton(),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pushNamed('/login');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                     backgroundColor: Colors.tealAccent.shade700,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   child: const Text(
//                     "Login Here",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pushNamed('/register');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                     backgroundColor: Colors.tealAccent.shade700,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   child: const Text(
//                     "Register Here",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AnimatedScaleButton extends StatefulWidget {
//   const AnimatedScaleButton({super.key});

//   @override
//   _AnimatedScaleButtonState createState() => _AnimatedScaleButtonState();
// }

// class _AnimatedScaleButtonState extends State<AnimatedScaleButton> {
//   bool _isHovering = false;

//   @override
//   Widget build(BuildContext context) {
//     final transform = _isHovering ? Matrix4.diagonal3Values(1.1, 1.1, 1.0) : Matrix4.identity();

//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovering = true),
//       onExit: (_) => setState(() => _isHovering = false),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         transform: transform,
//         child: ElevatedButton.icon(
//           style: ElevatedButton.styleFrom(
//             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//             backgroundColor: Colors.tealAccent.shade700,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             shadowColor: Colors.black45,
//             elevation: 10,
//           ),
//           onPressed: () {
//             Navigator.of(context).pushNamed('/list-food');
//           },
//           icon: const Icon(Icons.fastfood, color: Colors.white),
//           label: const Text(
//             "list",
//             style: TextStyle(
//               fontSize: 18,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }