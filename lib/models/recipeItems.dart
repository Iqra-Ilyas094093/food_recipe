List<String> itemTypes = [
  'Breakfast','Lunch','Dinner','Snack','CheatMenu'
];

class RecipeItems {
  final String image, name, woner, wonerName, reviews;
  final int carb;
  final double rate;
  final int calorie, fat, protein, weight;
  final bool fav;

  RecipeItems({
    required this.image,
    required this.wonerName,
    required this.woner,
    required this.name,
    required this.fav,
    required this.reviews,
    required this.rate,
    required this.calorie,
    required this.fat,
    required this.weight,
    required this.protein,
    required this.carb,
  });
}

List<RecipeItems> recipeItems = [
  RecipeItems(
    woner:
    "assets/images/ownerImages/Salad_mix_owner.webp",
    wonerName: "Natasha Evelyn",
    image: 'assets/images/sald-mix.png',
    name: 'Salad Mix',
    rate: 4,
    calorie: 320,
    reviews: "24",
    weight: 300,
    fat: 16,
    protein: 12,
    fav: true,
    carb: 30,
  ),
  RecipeItems(
    woner:
    "assets/images/ownerImages/Shrimp_kale_owner.jpg",
    wonerName: "Natasha Evelyn",
    image: 'assets/images/ShrimpKale.png',
    name: 'Shrimp Kale',
    rate: 4,
    calorie: 2200,
    reviews: "33",
    weight: 200,
    fat: 30,
    protein: 15,
    fav: false,
    carb: 15,
  ),

  RecipeItems(
    woner:
    "assets/images/ownerImages/Chicken_Salad_owner.jpg",
    wonerName: "Ms Saladian",
    image: 'assets/images/ckicken-salad.png',
    name: 'Chicken Salad',
    rate: 4.3,
    weight: 250,
    calorie: 240,
    reviews: "100",
    fav: false,
    fat: 30,
    protein: 15,
    carb: 15,
  ),
  RecipeItems(
    image: 'assets/images/mushroomSalad.png',
    name: 'Mushroom salad',
    rate: 5.0,
    wonerName: "Mr/Ms Mushroom",
    woner:
    "assets/images/ownerImages/mushroom_salad_owner.webp",
    fav: true,
    weight: 200,
    calorie: 320,
    reviews: "Prakash Subedi",
    fat: 30,
    protein: 15,
    carb: 15,
  ),
  RecipeItems(
    image: 'assets/images/grilled-chicken-salad.jpg',
    name: 'Grilled Chicken Salad',
    rate: 4.5,
    fav: true,
    woner:
    "assets/images/ownerImages/Grilled_Chicken_Salad_owner.jpg",
    weight: 400,
    calorie: 420,
    wonerName: "Ramesh Shahi",
    reviews: "50",
    fat: 50,
    protein: 30,
    carb: 15,
  ),
  RecipeItems(
    image: 'assets/images/thaiSalad.png',
    name: 'Thai Salad',
    rate: 4.9,
    fav: false,
    reviews: '52',
    wonerName: "Hari Prasad",
    weight: 200,
    calorie: 120,
    woner:
    "assets/images/ownerImages/thai_salad_owner.jpg",
    fat: 50,
    protein:16,
    carb: 30,
  ),
];