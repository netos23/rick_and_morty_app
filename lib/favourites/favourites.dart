import 'package:redux/redux.dart';

Set<int> addReducer(Set<int> state, AddAction action) {
  state.add(action.id);
  return Set.of(state);
}

Set<int> removeReducer(Set<int> state, RemoveAction action) {
  state.remove(action.id);
  return Set.of(state);
}

final appReducer = combineReducers<Set<int>>([
  TypedReducer<Set<int>, AddAction>(addReducer),
  TypedReducer<Set<int>, RemoveAction>(removeReducer),
]);

sealed class Action {
  final int id;

  Action(this.id);
}

final class AddAction extends Action {
  AddAction(super.id);
}

final class RemoveAction extends Action {
  RemoveAction(super.id);
}
