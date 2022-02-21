/*class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ceci est la variable qui va contenir tes quotes
  late Future<Album> futureAlbum;

  // ton initState qui va recuperer les donnees dans ton widget
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchTags();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        // c'est la partie qui va vraiment afficher tes donnees ca..do c'est ici que tu copies pour mettre das ton widget
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Row(children: [Text(snapshot.data!.name), Text(snapshot.data!.quoteCount));
              } else if (snapshot.hasError) {
              return Text('${snapshot.error}'); // tu laisses ceci comme xa
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
    Future<Album> fetchAlbum() async {
      final response = await http
          .get(Uri.parse('https://api.quotable.io/tags'));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return jsonDecode(response.body);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load tags');
      }
    }
  }*/