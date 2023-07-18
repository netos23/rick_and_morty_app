
class Event{}


Map<Type,Handler> callbacks = {};

void test<T extends Event>(Handler<T> callback){
  callbacks[T] = callback;
}


class Handler<T extends Event>{
  void handle(T events){

  }
}