import 'package:flutter/material.dart';
import 'package:flutter_instagram_search_ui/models/user.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    ));

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final List<User> _users = [
    User('Christin Hume', 'christinhume', 'assets/images/christin-hume.jpg',
        true, true, true),
    User('Stefan Stefancik', 'stefan2cik', 'assets/images/stefan-stefancik.jpg',
        false, true, true),
    User('Sergio De Paula', 'paulads', 'assets/images/sergio-de-paula.jpg',
        false, true, false),
    User('Gian Cescon', 'giancescon', 'assets/images/gian-cescon.jpg', true,
        true, false),
    User('Mubariz Mehdizadeh', 'mubariz',
        'assets/images/mubariz-mehdizadeh.jpg', false, false, false),
    User('Jonas Kakaroto', 'jonask', 'assets/images/jonas-kakaroto.jpg', true,
        true, true),
    User('Jeffery Erhunse', 'jefferyerhunse',
        'assets/images/jeffery-erhunse.jpg', true, false, false),
    User('Karl Magnuson', 'karlmagnuson', 'assets/images/karl-magnuson.jpg',
        false, false, false),
    User('Molly Blackbird', 'mollybb', 'assets/images/molly-blackbird.jpg',
        false, false, true),
    User('Ethan Hoover', 'ehoover', 'assets/images/ethan-hoover.jpg', false,
        false, true),
    User('Noah Silliman', 'noahsilliman', 'assets/images/noah-silliman.jpg',
        false, false, false),
    User('Drew Dizzy Graham', 'ddgraham', 'assets/images/drew-dizzy-graham.jpg',
        true, false, false),
    User('Craig Mckay', 'craigkay', 'assets/images/craig-mckay.jpg', false,
        false, false),
  ];

  late List<User> displayUsers;
  late TextEditingController _searchController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    displayUsers = _users;
    _searchController = TextEditingController();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 1);
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      leading: const Icon(
        Icons.arrow_back,
      ),
      titleSpacing: 0,
      title: Container(
        margin: const EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
            color: const Color(0xff262626),
            borderRadius: BorderRadius.circular(6)),
        child: TextField(
          onChanged: (v) {
            setState(() {
              displayUsers = v != ''
                  ? _users.where((u) => u.username.contains(v)).toList()
                  : _users;
            });
          },
          controller: _searchController,
          style: GoogleFonts.inter(
              color: const Color(0xffF7F7F7),
              fontSize: 14,
              fontWeight: FontWeight.w500),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              isCollapsed: true,
              hintText: 'Search',
              hintStyle: GoogleFonts.inter(
                  color: const Color(0xff8E8E8E),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              suffixIconConstraints: const BoxConstraints(
                  minWidth: 36, maxWidth: 36, minHeight: 36, maxHeight: 36),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              suffixIcon: _searchController.text.isNotEmpty
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _searchController.text = '';
                          displayUsers = _users;
                        });
                      },
                      child: const Icon(Icons.close, color: Color(0xffF7F7F7)))
                  : null),
        ),
      ),
    );
  }

  //
  // @afifcodes
  // afifcodes.vercel.app/flutter
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(),
      body: DefaultTabController(
        length: 5,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              TabBar(
                  controller: _tabController,
                  indicatorColor: const Color(0xffF7F7F7),
                  labelPadding: EdgeInsets.zero,
                  tabs: [
                    Tab(
                      child: Text(
                        'Top',
                        style: GoogleFonts.inter(fontSize: 12),
                      ),
                    ),
                    Tab(
                        child: Text('Accounts',
                            style: GoogleFonts.inter(fontSize: 12))),
                    Tab(
                        child: Text('Audio',
                            style: GoogleFonts.inter(fontSize: 12))),
                    Tab(
                        child: Text('Tags',
                            style: GoogleFonts.inter(fontSize: 12))),
                    Tab(
                        child: Text('Places',
                            style: GoogleFonts.inter(fontSize: 12))),
                  ]),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Center(
                      child: Text('Top Result',
                          style: GoogleFonts.inter(color: Colors.white)),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.only(bottom: 24),
                      physics: const BouncingScrollPhysics(),
                      itemCount: displayUsers.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 6),
                          child: Row(
                            children: [
                              Container(
                                height: 64,
                                width: 64,
                                decoration: displayUsers[index].isHaveSnap
                                    ? const BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.pink,
                                              Colors.orange
                                            ],
                                            stops: [
                                              0.4,
                                              0.7
                                            ],
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft),
                                      )
                                    : null,
                                child: Container(
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              displayUsers[index].image),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(displayUsers[index].username,
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xffF7F7F7))),
                                      displayUsers[index].isVerified
                                          ? const Icon(
                                              Icons.verified,
                                              color: Colors.blue,
                                              size: 14,
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                  Text(
                                    displayUsers[index].name,
                                    style: GoogleFonts.inter(
                                      color: const Color(0xff8E8E8E),
                                    ),
                                  ),
                                  displayUsers[index].isFollowing
                                      ? Text(
                                          'Followed by afifcodes + 1 more',
                                          style: GoogleFonts.inter(
                                              fontSize: 12,
                                              color: const Color(0xff8E8E8E)),
                                        )
                                      : const SizedBox()
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    Center(
                      child: Text('Audio Result',
                          style: GoogleFonts.inter(color: Colors.white)),
                    ),
                    Center(
                      child: Text('Tags Result',
                          style: GoogleFonts.inter(color: Colors.white)),
                    ),
                    Center(
                      child: Text('Places Result',
                          style: GoogleFonts.inter(color: Colors.white)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
