import 'package:dostavka_pc/drawer.dart';
import 'package:flutter/material.dart';
import 'package:masked_text_field/masked_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreditCardsPage extends StatefulWidget {
  const CreditCardsPage({super.key});

  @override
  State<CreditCardsPage> createState() => _CreditCardsPageState();
}

class _CreditCardsPageState extends State<CreditCardsPage> {
  TextEditingController cardNumber = TextEditingController();
  TextEditingController dataCard = TextEditingController();
  TextEditingController ccv = TextEditingController();
  TextEditingController cardName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('CreditCards-' + userInfo.currentUser!.email.toString()).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        final snap = snapshot.data!.docs;
        return snap.isEmpty == true ? Column(
          children: [
            _buildTitleSection(
              title: "Payment Details",
              subTitle: "How would you like to pay ?"),
            const SizedBox(
              height: 15,
            ),
            _buildAddCardButton(
            icon: const Icon(Icons.add),
            color: const Color(0xFF081603),
            context: context,
            cardData: dataCard,
            cardName: cardName,
            cardNumbers: cardNumber,
            ccv: ccv,
            user: userInfo
          )
          ],
        ) : ListView.builder(
          itemCount: snap.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildCreditCard(
                color: const Color.fromARGB(255, 9, 9, 67),
                cardExpiration: snap[index]['DataCard'],
                cardHolder: snap[index]['Name'],
                cardNumber: snap[index]['NumberCard'],
                context: context),
            _buildAddCardButton(
              icon: const Icon(Icons.add),
              color: const Color(0xFF081603),
              context: context,
              cardData: dataCard,
              cardName: cardName,
              cardNumbers: cardNumber,
              ccv: ccv,
              user: userInfo
            ),

            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
          },
        );
      },
    );
  }
}

Column _buildTitleSection({@required title, @required subTitle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16.0),
          child: Center(
            child: Text(
              '$title',
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )),
      Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
          child: Center(
            child: Text(
              '$subTitle',
              style: const TextStyle(fontSize: 21, color: Colors.white),
            ),
          ))
    ],
  );
}

Card _buildCreditCard(
    {required Color color,
    required String cardNumber,
    required String cardHolder,
    required String cardExpiration,
    required BuildContext context}) {
  return Card(
    elevation: 4.0,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
    child: InkWell(
      onTap: () {
        showModalBottomSheet(
          elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          context: context, 
          builder: (BuildContext context) {
            return Container(
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  const Icon(Icons.check_circle, color: Colors.green, size: 100,),
                  const SizedBox(height: 30,),
                  const Center(
                    child: Text('The payment was successful', style: TextStyle(fontSize: 25),),
                  ),
                  const SizedBox(height: 15,),
                  ElevatedButton(
                    
                    onPressed: () {
                      Navigator.pushNamed(context, '/shop');
                    }, 
                    child: Text('Go store', style: TextStyle(fontSize: 25),))
                ],
              ),
            );
          }
        );
      },
      child: Container(
      height: 200,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildLogosBlock(),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              cardNumber,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontFamily: 'CourrierPrime'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildDetailsBlock(
                label: 'CARDHOLDER',
                value: cardHolder,
              ),
              _buildDetailsBlock(label: 'VALID THRU', value: cardExpiration),
            ],
          ),
        ],
      ),
    ),
    )
  );
}

Row _buildLogosBlock() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Image.network(
        "https://i.imgur.com/8M4146m.png",
        color: Colors.white,
        height: 30,
        width: 30,
      ),
      Image.network(
        "https://i.imgur.com/UNup62k.png",
        height: 70,
        width: 70,
      ),
    ],
  );
}

Column _buildDetailsBlock({required String label, required String value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
            color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
      ),
      Text(
        value,
        style: const TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      )
    ],
  );
}

Container _buildAddCardButton({
  required Icon icon,
  required Color color,
  required BuildContext context,
  required TextEditingController cardData,
  required TextEditingController cardName,
  required TextEditingController cardNumbers,
  required TextEditingController ccv,
  required FirebaseAuth user,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 24.0),
    alignment: Alignment.center,
    child: FloatingActionButton(
      elevation: 2.0,
      onPressed: () {
        showModalBottomSheet(
            backgroundColor: const Color.fromARGB(255, 59, 74, 92),
            context: context,
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            builder: (BuildContext context) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: MaskedTextField(
                      textFieldController: cardName,
                      onChange: (String value) {
                        print(value);
                      },
                      mask: '',
                      inputDecoration: InputDecoration(
                        hintText: "DAVLETSHIN BULAT",
                        hintStyle: const TextStyle(color: Colors.white),
                        label: const Text(
                          "Entry name, surname",
                        ),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 233, 241, 243)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 233, 241, 243))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 233, 241, 243))),
                        prefixIcon: const Icon(
                          Icons.abc,
                          color: Color.fromARGB(255, 233, 241, 243),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: MaskedTextField(
                      textFieldController: cardNumbers,
                      onChange: (String value) {
                        print(value);
                      },
                      mask: 'xxxx xxxx xxxx xxxx',
                      maxLength: 19,
                      inputDecoration: InputDecoration(
                        hintText: "0000 0000 0000 0000",
                        hintStyle: const TextStyle(color: Colors.white),
                        label: const Text(
                          "Entry numbers card",
                        ),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 233, 241, 243)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 233, 241, 243))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 233, 241, 243))),
                        prefixIcon: const Icon(
                          Icons.credit_card_rounded,
                          color: Color.fromARGB(255, 233, 241, 243),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: MaskedTextField(
                          textFieldController: cardData,
                          onChange: (String value) {
                            print(value);
                          },
                          mask: 'xx/xx',
                          maxLength: 5,
                          inputDecoration: InputDecoration(
                            hintText: "dd/mm",
                            hintStyle: const TextStyle(color: Colors.white),
                            label: const Text(
                              "Entry data",
                            ),
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 233, 241, 243)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 233, 241, 243))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 233, 241, 243))),
                            prefixIcon: const Icon(
                              Icons.calendar_month,
                              color: Color.fromARGB(255, 233, 241, 243),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: MaskedTextField(
                          textFieldController: ccv,
                          onChange: (String value) {
                            print(value);
                          },
                          mask: 'xxx',
                          maxLength: 3,
                          inputDecoration: InputDecoration(
                            hintText: "000",
                            hintStyle: const TextStyle(color: Colors.white),
                            label: const Text(
                              "Entry CCV",
                            ),
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 233, 241, 243)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 233, 241, 243))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 233, 241, 243))),
                            prefixIcon: const Icon(
                              Icons.visibility_off,
                              color: Color.fromARGB(255, 233, 241, 243),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_card_sharp),
                    color: Colors.white,
                    iconSize: 50,
                    onPressed: () {
                      FirebaseFirestore.instance.collection('CreditCards-' + userInfo.currentUser!.email.toString()).add(
                    {
                      'Name': cardName.text,
                      'NumberCard': cardNumbers.text,
                      'DataCard': cardData.text,
                      'CCV': ccv.text
                    }
                  );
                  Navigator.pushNamed(context, '/payment');
                    },
                  ),
                ],
              );
            });
      },
      backgroundColor: color,
      mini: false,
      child: icon,
    ),
  );
}