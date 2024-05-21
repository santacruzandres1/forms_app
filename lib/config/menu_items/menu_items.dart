
class MenuItems {
final String title;
final String subtitle;
final String route;

const MenuItems({required this.title, required this.subtitle, required this.route});
}

const appMenuItems = <MenuItems>[
MenuItems(
  title: 'Cubit', 
  subtitle: 'Gestor de estado simple', 
  route: '/cubit'),
  MenuItems(
  title: 'Bloc', 
  subtitle: 'Gestor de estado Bloc', 
  route: '/bloc'),
];