// class Config{
//   static  const String url = "http://10.2.100.41:3000/";
// }

// class PostProvider with ChangeNotifier {
//   List<Post> _posts = [];

//   List<Post> get posts => _posts;

//   Future<void> fetchPosts() async {
//     final response = await http.get(Uri.parse('https://myapi/posts'));
//     final json = jsonDecode(response.body);
//     _posts = List.from(json).map((e) => Post.fromJson(e)).toList();
//     notifyListeners();
//   }

//   Future<void> toggleFavorite(Post post) async {
//     post.isFavorite = !post.isFavorite;

//     await http.put(
//       Uri.parse('https://myapi/posts/${post.id}/favorite'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(post.toJson()),
//     );

//     notifyListeners();
//   }

//   List<Post> get favorites => _posts.where((post) => post.isFavorite).toList();
// }

// class PostListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final postProvider = Provider.of<PostProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Posts'),
//       ),
//       body: postProvider.posts.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: postProvider.posts.length,
//               itemBuilder: (context, index) {
//                 final post = postProvider.posts[index];

//                 return ListTile(
//                   leading: Image.network(post.imageUrl),
//                   title: Text(post.caption),
//                   trailing: IconButton(
//                     icon: Icon(post.isFavorite ? Icons.favorite : Icons.favorite_border),
//                     onPressed: () => postProvider.toggleFavorite(post),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }

// class FavoriteListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final postProvider = Provider.of<PostProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorites'),
//       ),
//       body: postProvider.favorites.isEmpty
//           ? Center(child: Text('No favorites yet'))
//           : ListView.builder(
//               itemCount: postProvider.favorites.length,
//               itemBuilder: (context, index) {
//                 final post = postProvider.favorites[index];

//                 return ListTile(
//                   leading: Image.network(post.imageUrl),
//                   title: Text(post

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:jsquare/src/models/category_model.dart';

// class RealtimeData extends StatefulWidget {
//   const RealtimeData({super.key});

//   @override
//   _RealtimeDataState createState() => _RealtimeDataState();
// }

// class _RealtimeDataState extends State<RealtimeData> {
//   late StreamController _streamController;
//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();
//     _streamController = StreamController();
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
//       final response = await http
//           .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
//       _streamController.add(response.body);
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _streamController.close();
//     _timer.cancel();
//   }

//   Stream<http.Response> makeRequest() async* {
//     const url = 'https://jsonplaceholder.typicode.com/todos/1';
//     List<CategoryModel> category = [];
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         print(response.body);
//         // Do something with the response
//       } else {
//         print('Request failed with status: ${response.statusCode}.');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//     _streamController.sink.add(category);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Realtime Data'),
//       ),
//       body: Center(
//         child: StreamBuilder(
//           stream: _streamController.stream,
//           builder: (context, AsyncSnapshot snapshot) {
//             if (snapshot.hasData) {
//               return Text(snapshot.data);
//             } else {
//               return const CircularProgressIndicator();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }



// Here are the steps to create Google authentication in Flutter using the Google Sign In package, Node.js, and MongoDB for production level:

// Flutter Side:
// Add the google_sign_in dependency to your pubspec.yaml file and run flutter pub get.
// In your Flutter app, create a Firebase project and enable Google Sign-In in the Authentication section.
// Create a button in your Flutter app to initiate the sign-in process:
// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Authentication'),
//       ),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () => _signInWithGoogle(),
//           child: Text('Sign in with Google'),
//         ),
//       ),
//     );
//   }
  
//   // Google Sign-In
//   Future<void> _signInWithGoogle() async {
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//     final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//     final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;
//     final AuthCredential credential = GoogleAuthProvider.getCredential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,
//     );
    
//     // After getting the credential, you can pass it to your backend API.
//   }
// }
// Server Side:
// Create a database in MongoDB and create a collection named users.
// Create a new project using Express.js for your backend API.
// Add the google-auth-library dependency and create a new route to handle the Google Sign-In API request as follows:
// const { OAuth2Client } = require('google-auth-library');
// const client = new OAuth2Client(CLIENT_ID);

// router.post('/google-signin', async (req, res) => {
//   const { idToken } = req.body;
//   try {
//     const ticket = await client.verifyIdToken({
//       idToken,
//       audience: CLIENT_ID,
//     });
//     const { name, email, picture } = ticket.getPayload();
//     const user = await User.findOne({ email });

//     if (!user) {
//       // If the user is new, create a new user account in the database.
//       const newUser = await User.create({
//         name,
//         email,
//         picture,
//       });
//       if (newUser) {
//         const token = jwt.sign({ id: newUser._id }, SECRET, { expiresIn: '7d' });
//         return res.json({ success: true, token , newUser });
//       }
//     } else {
//       // If the user already exists in the database, create a new JWT token and send it back to the client.
//       const token = jwt.sign({ id: user._id }, SECRET, { expiresIn: '7d' });
//       return res.json({ success: true, token , user });
//     }
//   } catch (error) {
//     console.log(`Error: ${error}`);
//     return res.status(500).json({ success: false, error });
//   }
// });

// // You should add the middleware for the route and set the value of the `CLIENT_ID` and `SECRET` constant.
// That's it! You have now created a Google authentication system in Flutter using the Google Sign In package, Node.js, and MongoDB for production level.





// To create a production-level app using Google authentication in Flutter by using the 'google_sign_in' package connected to a Node.js backend with a MongoDB database, follow these steps:

// Set up a new project in the Google Developers Console (https://console.developers.google.com/).

// Enable the Google Sign-In API for your project and get your client ID and secret. Add your app's package name and SHA-1.

// Create a new Flutter project, and add the required dependencies to your pubspec.yaml file:

// dependencies:
//   google_sign_in: ^5.0.4
//   http: ^0.13.3
// In your main.dart, import the Google Sign-In package alongside other required imports:
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:http/http.dart' as http;
// Initialize the GoogleSignIn in your main.dart as a global instance:
// final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
// Create a function to handle the Google SignIn process:
// Future<void> signInWithGoogle() async {
//   try {
//     final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//     final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;

//     // Send the GoogleSignInAuthentication to your Node.js backend for verification and user creation
//     var response = await http.post(
//       'https://your-nodejs-server-url.com/api/auth/google-signin',
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'idToken': googleSignInAuthentication.idToken,
//         'accessToken': googleSignInAuthentication.accessToken,
//       }),
//     );

//     if (response.statusCode == 200) {
//       // Handle a successful sign-in
//     } else {
//       // Handle unsuccessful sign-in
//     }
//   } catch (error) {
//     print('Error occurred while signing in with Google: $error');
//   }
// }
// Create the Node.js backend and use packages like express, mongoose, and google-auth-library. Install these packages via npm or yarn:
// npm install --save express mongoose google-auth-library
// Create a new Mongoose model for the user connected to your MongoDB database, for example, user.model.js:
// const mongoose = require('mongoose');

// const userSchema = new mongoose.Schema({
//   googleId: { type: String, unique: true },
//   email: String,
//   name: String,
//   imageUrl: String,
// });

// const User = mongoose.model('User', userSchema);

// module.exports = User;
// Add the following code to your main server file, e.g., app.js:
// const express = require('express');
// const mongoose = require('mongoose');
// const { OAuth2Client } = require('google-auth-library');

// const User = require('./user.model');

// const app = express();
// app.use(express.json());

// const CLIENT_ID = 'YOUR_GOOGLE_CLIENT_ID';
// const oAuth2Client = new OAuth2Client(CLIENT_ID);

// // Connect to MongoDB
// mongoose.connect('mongodb://localhost:27017/yourDBName', { useNewUrlParser: true, useUnifiedTopology: true, useCreateIndex: true });

// app.post('/api/auth/google-signin', async (req, res) => {
//   const { idToken, accessToken } = req.body;

//   try {
//     const googleUser = await oAuth2Client.verifyIdToken({ idToken, audience: CLIENT_ID });

//     if (!googleUser) {
//       return res.status(401).json({ message: 'Google verification failed.' });
//     }

//     const payload = googleUser.getPayload();

//     // Check if the user exists in your database
//     let user = await User.findOne({ googleId: payload.sub });

//     if (!user) {
//       // If the user does not exist, create a new user
//       user = new User({
//         googleId: payload.sub,
//         email: payload.email,
//         name: payload.name,
//         imageUrl: payload.picture,
//       });

//       await user.save();
//     }

//     // Generate your unique JWT token for this user or perform other actions

//     res.status(200).json(user);
//   } catch (error) {
//     res.status(500).json({ message: 'Error occurred during authentication.' });
//   }
// });

// const PORT = process.env.PORT || 3000;
// app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
// This is a basic example of how you can create a production-level app with Google authentication in Flutter, Node.js, and MongoDB. You may need to make changes and improvements based on the requirements of your project.

// Make sure to handle token refresh in your Flutter app and set up proper authentication and authorization for your routes in your Node.js backend. Add necessary error handling and security measures as needed.


/*



To create a search functionality in a Flutter app that works with Node.js (Express) and MongoDB, you will first have to create an API that fetches and filters the data from the MongoDB database.

First, let's set up the Node.js (Express) API with MongoDB.

Initialize a new Node.js project and install dependencies:
mkdir search_example
cd search_example
npm init -y
npm install express mongoose
Create an app.js file and setup Express API:
// app.js
const express = require('express');
const mongoose = require('mongoose');

const app = express();

// Replace your MongoDB connection string
const MONGO_URI = 'mongodb+srv://username:password@cluster.mongodb.net/dbname';

mongoose.connect(MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true });

const itemSchema = new mongoose.Schema({
  title: String,
  description: String,
  // Additional fields can be added
});

const Item = mongoose.model('Item', itemSchema);

app.use(express.json());

app.get('/search', async (req, res) => {
  const { query } = req.query;
  
  const items = await Item.find({ 
    $or: [
      { title: new RegExp(query, 'i') },
      { description: new RegExp(query, 'i') },
      // Add search criteria for additional fields
    ]
  });

  res.json(items);
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server is running at http://localhost:${PORT}`);
});
Now, let's create the Flutter app.

Create a new Flutter project:
flutter create search_app
cd search_app
Modify the pubspec.yaml file to include required packages:
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.3
Create a function in lib/main.dart to fetch search results from the API:
// main.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchSearchResults(String query) async {
  final response = await http.get(Uri.parse('http://localhost:3000/search?query=$query'));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load search results');
  }
}
Build the search UI and utilize the fetchSearchResults() function to display the results:
// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> searchResults = [];

  void fetchAndShowResults(String query) async {
    try {
      List<dynamic> results = await fetchSearchResults(query);
      setState(() {
        searchResults = results;
      });
    } catch (e) {
      print(e);
      // Show an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => fetchAndShowResults(_searchController.text),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final item = searchResults[index];
                  return ListTile(
                    title: Text(item['title']),
                    subtitle: Text(item['description']),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
This will create a Flutter app with search functionality that connects to the Node.js (Express) API with MongoDB. Note that you might need to adjust the API url(http://localhost:3000/) depending on where your server is hosted. */