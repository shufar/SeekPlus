// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import SeekPlusAPI

public class Job: MockObject {
  public static let objectType: ApolloAPI.Object = SeekPlusAPI.Objects.Job
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Job>>

  public struct MockFields {
    @Field<String>("_id") public var _id
    @Field<String>("description") public var description
    @Field<Bool>("haveIApplied") public var haveIApplied
    @Field<Int>("industry") public var industry
    @Field<Int>("location") public var location
    @Field<String>("positionTitle") public var positionTitle
    @Field<SalaryRange>("salaryRange") public var salaryRange
  }
}

public extension Mock where O == Job {
  convenience init(
    _id: String? = nil,
    description: String? = nil,
    haveIApplied: Bool? = nil,
    industry: Int? = nil,
    location: Int? = nil,
    positionTitle: String? = nil,
    salaryRange: Mock<SalaryRange>? = nil
  ) {
    self.init()
    _setScalar(_id, for: \._id)
    _setScalar(description, for: \.description)
    _setScalar(haveIApplied, for: \.haveIApplied)
    _setScalar(industry, for: \.industry)
    _setScalar(location, for: \.location)
    _setScalar(positionTitle, for: \.positionTitle)
    _setEntity(salaryRange, for: \.salaryRange)
  }
}
