// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import SeekPlusAPI

public class GetJobsResponse: MockObject {
  public static let objectType: ApolloAPI.Object = SeekPlusAPI.Objects.GetJobsResponse
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<GetJobsResponse>>

  public struct MockFields {
    @Field<Bool>("hasNext") public var hasNext
    @Field<[Job?]>("jobs") public var jobs
    @Field<Int>("page") public var page
    @Field<Int>("size") public var size
    @Field<Int>("total") public var total
  }
}

public extension Mock where O == GetJobsResponse {
  convenience init(
    hasNext: Bool? = nil,
    jobs: [Mock<Job>?]? = nil,
    page: Int? = nil,
    size: Int? = nil,
    total: Int? = nil
  ) {
    self.init()
    _setScalar(hasNext, for: \.hasNext)
    _setList(jobs, for: \.jobs)
    _setScalar(page, for: \.page)
    _setScalar(size, for: \.size)
    _setScalar(total, for: \.total)
  }
}
