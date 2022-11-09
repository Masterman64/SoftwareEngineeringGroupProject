class ConvexAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Center(
          child: TextButton(
            child: Text(' '),
            onPressed: () => Navigator.of(context).pushNamed('/bar'),
          )),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.home, title: 'Home')
          TabItem(icon: Icons.refrigerator, title: 'Refrigerator'),
          TabItem(icon: Icons.pantry, title: 'Pantry'),
          TabItem(icon: Icons.profile, title: 'Profile')
        ],
        initialActiveIndex: 1,
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}