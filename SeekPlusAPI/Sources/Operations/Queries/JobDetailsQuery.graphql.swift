// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class JobDetailsQuery: GraphQLQuery {
  public static let operationName: String = "JobDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query JobDetails($jobId: String!) { job(id: $jobId) { __typename ...JobModel } }"#,
      fragments: [JobModel.self, SalaryRangeModel.self]
    ))

  public var jobId: String

  public init(jobId: String) {
    self.jobId = jobId
  }

  public var __variables: Variables? { ["jobId": jobId] }

  public struct Data: SeekPlusAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SeekPlusAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("job", Job?.self, arguments: ["id": .variable("jobId")]),
    ] }

    public var job: Job? { __data["job"] }

    /// Job
    ///
    /// Parent Type: `Job`
    public struct Job: SeekPlusAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SeekPlusAPI.Objects.Job }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(JobModel.self),
      ] }

      public var _id: String? { __data["_id"] }
      public var positionTitle: String? { __data["positionTitle"] }
      public var description: String? { __data["description"] }
      public var salaryRange: SalaryRange? { __data["salaryRange"] }
      public var location: Int? { __data["location"] }
      public var industry: Int? { __data["industry"] }
      public var haveIApplied: Bool? { __data["haveIApplied"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var jobModel: JobModel { _toFragment() }
      }

      /// Job.SalaryRange
      ///
      /// Parent Type: `SalaryRange`
      public struct SalaryRange: SeekPlusAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { SeekPlusAPI.Objects.SalaryRange }

        public var min: Int? { __data["min"] }
        public var max: Int? { __data["max"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var salaryRangeModel: SalaryRangeModel { _toFragment() }
        }
      }
    }
  }
}
