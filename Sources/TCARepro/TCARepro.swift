import ComposableArchitecture

public struct TestReducer: ReducerProtocol {
  public struct State: Equatable {}
  public enum Action {
    case first
    case second
    case third
    case forth
  }
  
  public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    switch action {
    case .first:
      print("first")
      return .run { send in
        await send(.second)
      }
    case .second:
      print("second")
      return .run { send in
        await send(.third)
      }
    case .third:
      print("third")
      return .run { send in
        await send(.forth)
      }
    case .forth:
      print("forth")
      return .run { send in
        await send(.first)
      }
    }
  }
}
