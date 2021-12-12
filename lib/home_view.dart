

import 'package:awesome_contact_app/contact_details_view.dart';
import 'package:awesome_contact_app/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class HomeView extends StatelessWidget {
  HomeView({ Key? key }) : super(key: key);
  final ScrollController _scrollController = ScrollController( );

  final List<Map<String,String>> data = [{"name": "Akua Antwiwaa",
		"phone": "+233 26 661 3943",
		"country": "Ghana",
		"email": "antwiwaa@gmail.com",
		"region": "Greater Accra"
	},
	{
		"name": "Daniel Acquah",
		"phone": "+233 54 419 7698",
		"country": "Ghana",
		"email": "danoacquah@gmail.com",
		"region": "Greater Accra"
	},
	{
		"name": "Avye Snider",
		"phone": "1-434-877-7871",
		"country": "Mexico",
		"email": "leo.cras@hotmail.org",
		"region": "Marche"
	},
	{
		"name": "Mara Gibbs",
		"phone": "872-6352",
		"country": "Nigeria",
		"email": "duis.volutpat@yahoo.com",
		"region": "Wielkopolskie"
	},
	{
		"name": "Xena Duke",
		"phone": "1-112-898-9277",
		"country": "Austria",
		"email": "sed@hotmail.com",
		"region": "Luxemburg"
	},
  
	{
		"name": "Asher Dennis",
		"phone": "244-5194",
		"country": "France",
		"email": "cras.lorem.lorem@yahoo.couk",
		"region": "Phú Thọ"
	},
	{
		"name": "Janna Herrera",
		"phone": "1-875-283-2330",
		"country": "Russian Federation",
		"email": "euismod@icloud.org",
		"region": "Aisén"
	},
	{
		"name": "Zeph Velazquez",
		"phone": "247-6766",
		"country": "Mexico",
		"email": "magna.nec@outlook.net",
		"region": "Leningrad Oblast"
	},
	{
		"name": "Gail Mcfarland",
		"phone": "1-888-714-7387",
		"country": "India",
		"email": "at@icloud.com",
		"region": "Gia Lai"
	},
	{
		"name": "Brennan Mathis",
		"phone": "356-2886",
		"country": "Chile",
		"email": "in.hendrerit.consectetuer@yahoo.com",
		"region": "Alajuela"
	}

];

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
       title: const Text( 'My Contacts',
       style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),), 
       actions: const [
         Padding(
           padding: EdgeInsets.only(right: 10),
           child: Center(child: CircleAvatar(radius: 25,
           backgroundImage: AssetImage('assets/avatar.jpg'),
           ),
           ),
         )
       ],
       elevation: 0,
       backgroundColor: Colors.white,
       bottom: PreferredSize(preferredSize: const Size.fromHeight(90),
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
         child: TextField(
           decoration: InputDecoration(
              border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(15)
             ),
             hintText: 'Search by name or number',
             prefixIcon: const Icon(Icons.search)
             ),
             ),     
       ),
       ),
      ) ,
    body: SafeArea(
      child: ListView(
          controller: _scrollController,
          children: [
           const Padding(
               padding: EdgeInsets.symmetric(horizontal: 16),
               child: Text(
                'Recent',
                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                 ),
             ),
          ListView.separated(
              controller: _scrollController,
            shrinkWrap: true,
              itemBuilder: (context, index){
                  return ListTile( 
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ContactDetailsView(contact: Contact(country: 'Ghana',
                        email: 'antwiwaa@gmail.com',
                        name: 'Akua Antwiwaa',
                        phone: '+233 26 661 3943',
                        region: 'Greater Accra'));
                      }));
                    } ,
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/teddy.jpeg'),
                ),
                title: const Text(
                  'Akua Antwiwaa', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text('+233 26 661 3943'),
                  trailing: const IconButton(onPressed: null, icon: Icon(Icons.more_horiz)),
    
            );
              }, 
              separatorBuilder: (context, index){
                return const  Divider(
                 indent: 25,
                  thickness: 2,
            );
              }, 
              itemCount: 3),
              const SizedBox(height: 15,),
               const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                 child: Text(
                  'Contacts',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
               ),
              GroupedListView<Map<String,String>, String>(
                shrinkWrap: true,
                elements: data,
              groupBy: (element) => element['name'].toString().substring(0,1),
              groupSeparatorBuilder: (String groupByValue) => 
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(groupByValue.substring(0,1),
                  textAlign: TextAlign.right,style: const TextStyle(
                    fontWeight: FontWeight.w600,fontSize: 18),),
                ),
              ) ,
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                children: [
                   ListTile( 
                     onTap: (){
                        Navigator.push(context, 
                           MaterialPageRoute(builder: (context){
                         return ContactDetailsView(contact: contact,);
      }));
                     },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/teddy.jpeg'),
                    ),
                    title: Text(
                      '${element['name']}', 
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(onPressed: null, icon: Icon(Icons.more_horiz)),
    
            ),
            const Divider(
             indent: 25,
             thickness: 2,
            )
                ],
              );
              },
              itemComparator: (item1, item2) => 
              item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
             ),  
           ],
        ),
    ),
  floatingActionButton: FloatingActionButton (
    backgroundColor: const Color(0xff1A4ADA),
      onPressed: (){
      
      },
      child: const Icon(Icons.add),
    ),
    );
  }
}