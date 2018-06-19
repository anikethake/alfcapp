import 'package:alfcapp/news.dart';
import 'package:flutter/material.dart';
import 'page_data.dart';
import 'intro_page_item.dart';
import 'page_transformer.dart';
import 'fixture.dart';
import 'standing.dart';
import 'teams/team_home.dart';





class IntroPageView extends StatefulWidget {
  @override
  IntroPageViewState createState() {
    
       
       return new IntroPageViewState(); 
      
  }
}

class IntroPageViewState extends State<IntroPageView> {
 
  @override
  Widget build(BuildContext context) {


  
    return new Scaffold(
    //appBar: new AppBar(
      //title: new Text('alfc'),
      //backgroundColor: new Color(0xFF00204A)


    //,),
      
      body: 

      new Container(
         decoration: new BoxDecoration( color: Color(0xFF240629)),
        child: new Center(
          child: new SizedBox.fromSize(
            size: const Size.fromHeight(550.0),
            child: new PageTransformer(
              pageViewBuilder: (context, visibilityResolver) {
                return new PageView.builder(
                  controller: new PageController(viewportFraction: 0.80),
                  itemCount: sampleItems.length,
                  itemBuilder: (context, index) {
                    final item = sampleItems[index];
                    final pageVisibility =
                      visibilityResolver.resolvePageVisibility(index);


                      new ListTile(
                      leading: const Icon(Icons.event_seat),
                      title: const Text('The seat for the narrator'),
                       );
                      return InkWell(

                      onTap:
                          () {
                        {
                          if(index == 0)

                         return Navigator.push(context, new MaterialPageRoute(
                         builder: (context) => new Fixtures()), );
                         }
                          if (index == 1)
                           {
                           return Navigator.push(context, new MaterialPageRoute(
                           builder: (context) => new Standing()), );
                           }
                        if (index == 2)
                        {
                          return Navigator.push(context, new MaterialPageRoute(
                             builder: (context) => new teamlistpage()), );
                        }
                        if (index == 3)
                        {
                          return Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new news()), );
                        }


                      },


                    child: new IntroPageItem(

                      item: item,
                      pageVisibility: pageVisibility,
                    ),
                    );

                  },

                );
              },
            ),
          ),
        ),
      ),
      
    );
  }

}

