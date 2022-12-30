import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Insurance extends StatefulWidget {
  @override
  _InsuranceState createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  final List<String> names = <String>[
    'Bajaj Allianz',
    'ICICI Lombard',
    'HDFC ERGO',
    'Tata AIG',
    'SBI General Insurance',
    'Kotak Mahindra',
    'Max Bupa',
    'Aditya Birla Capital'
  ];

  final List<String> urls = <String>[
    'https://www.bajajallianz.com/',
    'https://www.icicilombard.com/',
    'https://www.hdfcergo.com/',
    'https://www.tataaig.com/health-insurance',
    'https://www.sbigeneral.in/',
    'https://www.kotakgeneralinsurance.com/health-insurance/',
    'https://www.maxbupa.com/health-insurance-plans/',
    'https://www.adityabirlacapital.com/healthinsurance/'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Insurances',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromRGBO(243, 207, 207, 2),
      ),
      backgroundColor: Colors.green[300],
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  height: 70,
                  margin: EdgeInsets.fromLTRB(20, 7, 20, 7),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => launch(urls[index]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Get Insurance from: (${names[index]})',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
