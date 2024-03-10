// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import SeekPlusAPI

public class SalaryRange: MockObject {
  public static let objectType: ApolloAPI.Object = SeekPlusAPI.Objects.SalaryRange
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<SalaryRange>>

  public struct MockFields {
    @Field<Int>("max") public var max
    @Field<Int>("min") public var min
  }
}

public extension Mock where O == SalaryRange {
  convenience init(
    max: Int? = nil,
    min: Int? = nil
  ) {
    self.init()
    _setScalar(max, for: \.max)
    _setScalar(min, for: \.min)
  }
}
