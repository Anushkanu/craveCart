import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.tealAccent.shade700,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
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
                // Profile Picture and Name
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/profile_picture.png'), // Add profile image in assets folder
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Anishka",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "anishka@example.com",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),

                // Address Text Field
                TextField(
                  decoration: InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),

                // Mobile Text Field
                TextField(
                  keyboardType: TextInputType.phone, // Numeric keyboard for phone
                  decoration: InputDecoration(
                    labelText: "Mobile",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Settings Button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/settings'); // Link to settings page
                  },
                  icon: const Icon(Icons.settings, color: Colors.white),
                  label: const Text(
                    "Settings",
                    style: TextStyle(color: Colors.white), // Set text color to white
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    backgroundColor: Color.fromARGB(255, 152, 233, 222),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Logout Button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login'); // Redirect to login on logout
                  },
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white), // Set text color to white
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    backgroundColor: Color.fromARGB(255, 194, 168, 230),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
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



// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Profile"),
//         backgroundColor: Colors.tealAccent.shade700,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 255, 255, 255),
//               Color.fromARGB(255, 255, 255, 255),
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
//                 // Profile Picture and Name
//                 const CircleAvatar(
//                   radius: 60,
//                   backgroundImage: AssetImage('assets/profile_picture.png'), // Add profile image in assets folder
//                   backgroundColor: Color.fromARGB(255, 255, 255, 255),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   "Anishka",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 0, 0, 0),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   "anishka@example.com",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
                
//                 // Settings Button
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     Navigator.of(context).pushNamed('/settings'); // Link to settings page
//                   },
//                   icon: const Icon(Icons.settings, color: Colors.white),
//                   label: const Text(
//                  "Settings",
//                  style: TextStyle(color: Colors.white), // Set text color to white
//                   ), 
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                     backgroundColor: Color.fromARGB(255, 152, 233, 222),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
                
//                 // Logout Button
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     Navigator.of(context).pushNamed('/login'); // Redirect to login on logout
//                   },
//                   icon: const Icon(Icons.logout, color: Colors.white),
//                  label: const Text(
//                  "Logout",
//                  style: TextStyle(color: Colors.white), // Set text color to white
//                   ), 
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                     backgroundColor: Color.fromARGB(255, 194, 168, 230),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
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