import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './signin.dart';
import '../utils/style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0,);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for(int i=0; i<_numPages; i++) {
      list.add(
        i == _currentPage 
          ? _indicator(true, i) 
          : _indicator(false, i)
      );
    }
    return list;
  }
  Widget _indicator(bool isActive, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500,), 
            curve: Curves.ease,
          );
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150,),
        margin: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        height: 9,
        width: isActive ? 36 : 20,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Color(0xFF7B51D3),
          borderRadius: BorderRadius.circular(12),

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.65, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      print('Skip');
                    },
                    child: Text(
                      _currentPage != _numPages - 1 ? 'Skip' : '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 520,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage('assets/img/onboarding-01.png'),
                                width: MediaQuery.of(context).size.width * 0.65,
                                height: MediaQuery.of(context).size.width * 0.65,
                              ),
                            ),
                            SizedBox(height: 30,),
                            Text(
                              'Connet people \narround the world',
                              style: titleStyle,
                            ),
                            SizedBox(height: 15,),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: subtitleStyle,
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage('assets/img/onboarding-02.png'),
                                width: MediaQuery.of(context).size.width * 0.65,
                                height: MediaQuery.of(context).size.width * 0.65,
                              ),
                            ),
                            SizedBox(height: 30,),
                            Text(
                              'Get a new experience \nof imagination',
                              style: titleStyle,
                            ),
                            SizedBox(height: 15,),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: subtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage('assets/img/onboarding-03.png'),
                                width: MediaQuery.of(context).size.width * 0.65,
                                height: MediaQuery.of(context).size.width * 0.65,
                              ),
                            ),
                            SizedBox(height: 30,),
                            Text(
                              'Connet people \narround the world',
                              style: titleStyle,
                            ),
                            SizedBox(height: 15,),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: subtitleStyle,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),

                _currentPage != _numPages - 1
                  ? Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: FlatButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500,), 
                            curve: Curves.ease,
                          );
                        }, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ) : SizedBox.shrink(),

              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1 
        ? Container(
          height: 65,
          width: double.infinity,
          color: Colors.white,
          child: GestureDetector(
            onTap: () => print('Get started'),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 5,),
                child: Text(
                  'Get started',
                  style: TextStyle(
                    color: Color(0xFF5B16D0),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ) : SizedBox.shrink(),
    );
  }
}
