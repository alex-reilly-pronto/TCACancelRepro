import XCTest
@testable import TCARepro
import ComposableArchitecture

@MainActor
final class TCAReproTests: XCTestCase {
    func testExample() async throws {
      let store = TestStore(
        initialState: TestReducer.State(),
        reducer: TestReducer()
      )
      
      let task = await store.send(.first)
      
      await store.receive(.second)
      await store.receive(.third)
      await task.cancel()
    }
}
