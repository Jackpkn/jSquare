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
