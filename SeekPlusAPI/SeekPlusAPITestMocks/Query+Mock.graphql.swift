// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import SeekPlusAPI

public class Query: MockObject {
  public static let objectType: ApolloAPI.Object = SeekPlusAPI.Objects.Query
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Query>>

  public struct MockFields {
    @Field<GetJobsResponse>("active") public var active
    @Field<Job>("job") public var job
    @Field<GetJobsResponse>("jobs") public var jobs
  }
}

public extension Mock where O == Query {
  convenience init(
    active: Mock<GetJobsResponse>? = nil,
    job: Mock<Job>? = nil,
    jobs: Mock<GetJobsResponse>? = nil
  ) {
    self.init()
    _setEntity(active, for: \.active)
    _setEntity(job, for: \.job)
    _setEntity(jobs, for: \.jobs)
  }
}
