import 'dart:math' as math;
// import 'package:dio/dio.dart';
// import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';



// import 'package:custom_check_box/custom_check_box.dart';
import 'package:Veots/screens/login.dart';
import 'package:Veots/screens/register_with_email.dart';

import 'package:Veots/screens/register_with_phone.dart';
import 'package:flutter/material.dart';
// import 'package:searchfield/searchfield.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Pre_Register_ extends StatefulWidget {
  Pre_Register_({
    super.key,
    required this.Link,
    required this.location_on
  });
  final String Link;
  final bool location_on;
  // import 'dart:math' as math;

  @override
  State<Pre_Register_> createState() => Pre_Register_State();
}

class Pre_Register_State extends State<Pre_Register_> {
  
 
  String? CountryName;
  void dispose() {
    _searchController.dispose();
    focus.dispose();
    super.dispose();
  }

  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // countries = data.map((e) => Country.fromMap(e)).toList();
    print('--------------');
print(widget.Link);
print(widget.location_on);
print('----------------');
  }

  final _formKey = GlobalKey<FormState>();

  final focus = FocusNode();
  List<Country> countries = [];
  Country _selectedCountry = Country.init();

  bool containsCountry(String text) {
    final Country? result = countries.firstWhere(
        (Country country) => country.name.toLowerCase() == text.toLowerCase(),
        orElse: () => Country.init());

    if (result!.name.isEmpty) {
      return false;
    }
    return true;
  }


  String idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }
  
  

  bool IsPhone = false;
  bool NoPhone = false;
  TextEditingController _Others = TextEditingController();
  @override
  Widget build(BuildContext context)
   {
     
    double width=MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;
    bool someBooleanValue = true;

    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: ((context) => Login(mainLink: widget.Link,location_on: widget.location_on,))),
            (Route<dynamic> route) => false,
          );

          return true;
        },
        child:SafeArea(
      child: 
    Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpeg'), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),

        SingleChildScrollView(
            child: Column(
          children: [
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height * 0.60,
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.4,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Column(
                    children: [
                      Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      
                          Container(
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.05
                                ,
                                left: MediaQuery.of(context).size.width * 0.05),
                                
                            child: Text(
                              "Select your Country",
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontFamily: "Poppins Medium",
                                color: Colors.black,
                                // fontStyle: FontStyle.italic, 
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                            ),
                          ),
                        
                      
                    
                     SizedBox(height: MediaQuery.of(context).size.height*0.01,),
Container(
  height: 70,
  child: DropdownSearch<String>(
    
            
            
            searchBoxStyle:TextStyle(
                                                    color:
                                                        const Color(0xFF4d4c4c),
                                                    fontFamily:
                                                        "Poppins Medium",
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            45),
            showSelectedItem:false,
            mode: Mode.DIALOG,
            searchBoxDecoration: InputDecoration(
                                              fillColor:
                                                  const Color(0xFFfafafa),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color: const Color(
                                                        0xFFfafafa)),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color: const Color(
                                                        0xFFfafafa)),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              filled: true,
                                              // fillColor: const Color(0xFF1E1E1E),
                                            ),
            dropdownSearchDecoration: InputDecoration(
                                              fillColor:
                                                  const Color(0xFFfafafa),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color: const Color(
                                                        0xFFfafafa)),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color: const Color(
                                                        0xFFfafafa)),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              filled: true,
                                              // fillColor: const Color(0xFF1E1E1E),
                                            ),
            //to show search box
            showSearchBox: true,
            // showSelectedItem: true,
            //list of 
            //showSelectedItem:false, items
            items: [
             "Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Central African Republic", "Chad", "Chile", "China", "Colombia", "Comoros", "Congo (Democratic Republic of the)", "Congo (Republic of the)", "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Eswatini", "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Ivory Coast", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar (Burma)", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Korea", "North Macedonia", "Norway", "Oman", "Pakistan", "Palau", "Palestine", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Romania", "Russia", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Korea", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Sweden","Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States of America", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City (Holy See)", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe"


            ],
            label: "Country",
            onChanged: (newValue){
              CountryName=newValue;
              print("COuntry Name assigned to country name variable");
              print(CountryName);
            },
          
            //show selected item
            // selectedItem: "India",
          ),
),
           SizedBox(height: MediaQuery.of(context).size.height*0.01,),
        
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular((4.0)),
                                  color: Colors.red.shade500),
                              child: MaterialButton(
                                // color: Colors.amber,
                                onPressed: () {
                               if(CountryName==null)
                               {
                                   showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Error",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                content: Text('Please provide your country to proceed'),
              );
            });
                               }
                               else{
if (CountryName=="India") {
                                    (Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Register_with_phone_(Link: widget.Link,location_on: widget.location_on,)),
                                    ));
                                  }

                                  else{
                                  (Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Register_with_Email_(Link: widget.Link,location_on: widget.location_on,Country: CountryName!.toString(),)
                                    ),
                                  ));

                                            }

                               }
                                            // ROUTE TO EMAIL VERIFICATION
                                },
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    
                                    "Next",
                                    style: TextStyle(color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins Medium"),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      
                     
                            //
                        
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                          padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              0),
                          child: Container(
                            // color: Colors.blue,
                            // width: MediaQuery.of(context).size.width / 3.0,
                            // height:20 ,
                            child: 
                                
                               FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "Already have an account?",
                                  style: TextStyle(color: Colors.black,
                                //  fontWeight: FontWeight.w900,
                                  fontFamily: "Poppins Medium"),
                                  
                                ),
                              ),
                            
                          )),
                      
                    
                            Container(
                              // color: Colors.blue,
                              // width: MediaQuery.of(context).size.width / 2.0,
                              height:MediaQuery.of(context).size.height*0.05,
                              // margin: EdgeInsets.only(
                              //   right: MediaQuery.of(context).size.width * 0.1
                              //   ,
                              //   left: MediaQuery.of(context).size.width * 0.1),
                                

                              child: TextButton(
                                // color: Colors.amber,
                                onPressed: (){
                                  Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: ((context) => Login(mainLink: widget.Link,location_on: widget.location_on,))),
            (Route<dynamic> route) => false,
          );
                                },
                                child:  FittedBox
                                (
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                              "Log In",
                              style: TextStyle(
                                // fontWeight: FontWeight.w900,
                                fontFamily: "Poppins Medium",
                                color:  const Color(0xFF1a0bbe),
                                // fontStyle: FontStyle.italic, 
                               
                              ),
                            ),
                                )
                                
                              ),
                            )
                            ],
                      ),
                     
                  ],
                  )
                ),
              ),
            ),
          ],
        )
        )        // comment section & recommended videos
      ],
    )
    ));
  }

  Widget buildFittedWidthText(String text) => Container(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width / 2.5,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
  Widget buildFittedWidthText2(String text) => Container(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width / 8,
        child: FittedBox(
          child: Text(text),
        ),
      );
  Widget buildFittedWidthText3(String text) => Container(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width / 8,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
}
//
class CountryDetail extends StatefulWidget {
  final Country? country;

  CountryDetail({Key? key, required this.country}) : super(key: key);
  @override
  _CountryDetailState createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  Widget dataWidget(String key, int value) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$key:'),
          SizedBox(
            width: 16,
          ),
          Flexible(
            child: Text(
              '$value',
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          alignment: Alignment.center,
          child: Text(
            widget.country!.name,
            style: TextStyle(fontSize: 40),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        dataWidget('Population:', widget.country!.population),
        dataWidget('Density', widget.country!.density),
        dataWidget('Land Area (in Km\'s)', widget.country!.landArea)
      ],
    );
  }
}
class Country {
  final String name;
  final int population;
  final int landArea;
  final int density;
  Country(this.name, this.population, this.landArea, this.density);

  Country.init()
      : name = '',
        population = 0,
        landArea = 0,
        density = 0;

  Country.fromMap(Map<String, Object> map)
      : name = map['country'] as String,
        population = map['population'] as int,
        landArea = map['land Area'] as int,
        density = map['density'] as int;
}

