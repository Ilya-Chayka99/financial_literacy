
class Course {
  String name;
  double complitedProcentage;
  String image;
  
  Course({
    required this.name,
    required this.complitedProcentage,
    required this.image
  });
}

List<Course> courses = [
  Course(
    name: 'name1', 
    complitedProcentage: .75, 
    image: 'lib/Assets/image/image-PhotoRoom.png-PhotoRoom (7).png'
  )
];