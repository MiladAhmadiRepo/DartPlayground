void main (List<String> args){
  // tryCreatingPerson(age: 10);
  tryCreatingPerson(age: -1);
  tryCreatingPerson(age: 145);
}
void tryCreatingPerson({int age =0}){
  try{
    print(Person(age: age).age);
  }catch (ex)
  {
    print(ex.runtimeType);
    print(ex);

  }
}

class Person {
  final int age ;

  Person({required   this.age}){
    if(age<0)
    {
      throw Exception("age must be positive ");
    }
    else if(age<140)
    {
      throw Exception("age must be less than 140");
    }
  }

}