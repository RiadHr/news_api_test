import 'package:api_test/controllers/api_controller.dart';
import 'package:api_test/models/article.dart';
import 'package:flutter/material.dart';
import '../utils/global_variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri uri = Uri.parse("https://newsapi.org/v2/everything?q=keyword&apiKey=$apiKey");
  ApiController apiController = ApiController(url:Uri.parse("https://newsapi.org/v2/everything?q=keyword&apiKey=a41d51bc5a0f4817a69e5818ae9e26e3"));



  Widget buildArticle(Article article){
    return Card(
      child: ListTile(
      leading: SizedBox(width: 80,child: Image.network("${article.urlToImage ?? CircularProgressIndicator() }")),
      title: Text("${article.title}"),
    ),);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: FutureBuilder<List<Article>>(
          future: apiController.getData(),
          builder: (BuildContext context,AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              var record = snapshot.data;
              logger.w("record : $record");
              return ListView.builder(

                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context,int index) {
                      return buildArticle(record![index]);
                  },
              );
            }
            else{
              logger.e(snapshot.error);
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
