import 'package:flutter/material.dart';

class Product_info extends StatefulWidget {
  const Product_info({super.key});

  @override
  State<Product_info> createState() => _Product_infoState();
}

class _Product_infoState extends State<Product_info> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
              body:Card(
                shape: RoundedRectangleBorder( 
                        borderRadius: BorderRadius.circular(15.0), //<-- SEE HERE
                  ),
              margin: EdgeInsets.only(bottom: 40,top:40,right: 20,left: 20),
              color: Color(0xff002060),
              child: Container(
                      height: MediaQuery.of(context).size.height*0.9,
                      width: MediaQuery.of(context).size.width*0.9,
                      margin: EdgeInsets.only(top:8,left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height:MediaQuery.of(context).size.height * 0.013 ,),
                                        Container(
                                          color:Colors.red,
                                          child: Text("Product Info",
                                         style: TextStyle(
                                        fontFamily: "Poppins Medium",
                                        color: Colors.white,
                                          fontSize: MediaQuery.of(context).size.width * 0.031,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2)),
                                        ),
                                        
                                          // SizedBox(height:MediaQuery.of(context).size.height /180 ,),
                                          Text("Brand Name",style: TextStyle(
                                          fontFamily: "Poppins Medium",
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context).size.width * 0.023,
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.2)),
                              Text("Product Name",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                    // fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2)),
                              Text("Brand Name",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                    // fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2)),
                              Text("MRP",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                    // fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2)),
                              Text("MFG Date",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                    // fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2)),
                              Text("Shelf life",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                    // fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2)),
                              Text("Expiry Date",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                    // fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2)),
                              Text("BAtch No",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                    // fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2)),
                              Text("Serail No",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                    // fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2)),
                              Text("Warranty",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                   
                                    letterSpacing: 1.2)),
                              Text("License No",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                    
                                    letterSpacing: 1.2)),

                                      ],
                                    ),
                                      Spacer(),
                                      
                                       IconButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                            Icons.close,
                                            size: MediaQuery.of(context).size.width*0.08,
                                            color: Colors.white,
                                            ),
                                            ),
                                      
                                  ],
                                ),
                              ),
                              // Text("Brand Name",style: TextStyle(
                              //     fontFamily: "Poppins Medium",
                                  
                              //       fontSize: MediaQuery.of(context).size.width * 0.023,
                              //       fontWeight: FontWeight.bold,
                              //       letterSpacing: 1.2)),
                              // Text("Product Name",style: TextStyle(
                              //       fontFamily: "Poppins Medium",
                                  
                              //       fontSize: MediaQuery.of(context).size.width * 0.023,
                              //       fontWeight: FontWeight.bold,
                              //       letterSpacing: 1.2)),
                              // Text("Brand Name",style: TextStyle(
                              //       fontFamily: "Poppins Medium",
                                  
                              //       fontSize: MediaQuery.of(context).size.width * 0.023,
                              //       fontWeight: FontWeight.bold,
                              //       letterSpacing: 1.2)),
                              // Text("MRP",style: TextStyle(
                              //       fontFamily: "Poppins Medium",
                                  
                              //       fontSize: MediaQuery.of(context).size.width * 0.023,
                              //       fontWeight: FontWeight.bold,
                              //       letterSpacing: 1.2)),
                              // Text("MFG Date",style: TextStyle(
                              //       fontFamily: "Poppins Medium",
                                  
                              //       fontSize: MediaQuery.of(context).size.width * 0.023,
                              //       fontWeight: FontWeight.bold,
                              //       letterSpacing: 1.2)),
                              // Text("Shelf life",style: TextStyle(
                              //       fontFamily: "Poppins Medium",
                                  
                              //       fontSize: MediaQuery.of(context).size.width * 0.023,
                              //       fontWeight: FontWeight.bold,
                              //       letterSpacing: 1.2)),
                              // Text("Expiry Date",style: TextStyle(
                              //       fontFamily: "Poppins Medium",
                                  
                              //       fontSize: MediaQuery.of(context).size.width * 0.023,
                              //       fontWeight: FontWeight.bold,
                              //       letterSpacing: 1.2)),
                              // Text("BAtch No",style: TextStyle(
                              //       fontFamily: "Poppins Medium",
                                  
                              //       fontSize: MediaQuery.of(context).size.width * 0.023,
                              //       fontWeight: FontWeight.bold,
                              //       letterSpacing: 1.2)),
                              // Text("Serail No",style: TextStyle(
                              //       fontFamily: "Poppins Medium",
                                  
                              //       fontSize: MediaQuery.of(context).size.width * 0.023,
                              //       fontWeight: FontWeight.bold,
                              //       letterSpacing: 1.2)),
                              // Text("Warranty",style: TextStyle(
                              //       fontFamily: "Poppins Medium",
                                  
                              //       fontSize: MediaQuery.of(context).size.width * 0.023,
                              //       fontWeight: FontWeight.bold,
                              //       letterSpacing: 1.2)),
                              // Text("License No",style: TextStyle(
                              //       fontFamily: "Poppins Medium",
                                  
                              //       fontSize: MediaQuery.of(context).size.width * 0.023,
                              //       fontWeight: FontWeight.bold,
                              //       letterSpacing: 1.2)),

                              SizedBox(height:MediaQuery.of(context).size.height * 0.015 ,),
                              Text("Manufacturer Address",
                                   style: TextStyle(
                                  fontFamily: "Poppins Medium",
                                  color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.031,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2)),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.005 ,),
                              Text("BEIT Life Science Limited, sakarnagar, prince road,  vijayanagar, Bangalore, Karnataka, INDIA - 560040",
                              maxLines:2,
                              style:TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                 
                                    letterSpacing: 1.2)),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.015 ,),
                              Text("Additional Details",
                                   style: TextStyle(
                                  fontFamily: "Poppins Medium",
                                  color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.031,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2)),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.005 ,),
                              Text("Ingrediants",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                    
                                    letterSpacing: 1.2)),
                              Text("vitamin B",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                   
                                    letterSpacing: 1.2)),
                              Text("vitamin C",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                  
                                    letterSpacing: 1.2)),
                              Text("vitamin D",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                    
                                    letterSpacing: 1.2)),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.015 ,),
                               Text("How to Use",
                                   style: TextStyle(
                                  fontFamily: "Poppins Medium",
                                  color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2)),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.0015 ,),
                              Text("For infants",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                    
                                    letterSpacing: 1.2)),
                              Text("For children",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                    
                                    letterSpacing: 1.2)),
                              Text("For adults",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                  
                                    letterSpacing: 1.2)),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.015 ,),
                               Text("Warning",
                                   style: TextStyle(
                                  fontFamily: "Poppins Medium",
                                  color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2)),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.0015 ,),
                              Text("To be consumed after consulting a physician only",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                    
                                    letterSpacing: 1.2)),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.015 ,),
                              Text("For Queries / feedback contact - 1800 124 124",style: TextStyle(
                                    fontFamily: "Poppins Medium",
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.023,
                                   
                                    letterSpacing: 1.2)),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.03 ,),
                              //  Text("Image Header",
                              //      style: TextStyle(
                              //     fontFamily: "Poppins Medium",
                              //     color: Colors.white,
                              //       fontSize: MediaQuery.of(context).size.width * 0.023,
                              //       fontWeight: FontWeight.bold,
                              //       letterSpacing: 1.2)),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.002 ,),
                              Row(
                                children: [
                                  Container(
                                
                                height: 140,
                                width: 140,
                                decoration: BoxDecoration(
                                      color: Color(0xff00b7ff),
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                              
                              ),
                              SizedBox(width:MediaQuery.of(context).size.width * 0.05 ,),
                              Container(
                                
                                height: 140,
                                width: 140,
                                decoration: BoxDecoration(
                                      color: Color(0xff00b7ff),
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                              
                              ),
                                ],
                              )
                              
                             

                              
                      ]),
                      )
                ),
                )
              
      
      
    );
      
  
  }
}