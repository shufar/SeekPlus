// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import SeekPlusAPI

public class Mutation: MockObject {
  public static let objectType: ApolloAPI.Object = SeekPlusAPI.Objects.Mutation
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Mutation>>

  public struct MockFields {
    @Field<Bool>("apply") public var apply
    @Field<String>("auth") public var auth
  }
}

public extension Mock where O == Mutation {
  convenience init(
    apply: Bool? = nil,
    auth: String? = nil
  ) {
    self.init()
    _setScalar(apply, for: \.apply)
    _setScalar(auth, for: \.auth)
  }
}
