// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ActiveJobListQuery: GraphQLQuery {
  public static let operationName: String = "ActiveJobList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ActiveJobList($limit: Int, $page: Int) { active(limit: $limit, page: $page) { __typename page size hasNext total jobs { __typename ...JobModel } } }"#,
      fragments: [JobModel.self, SalaryRangeModel.self]
    ))

  public var limit: GraphQLNullable<Int>
  public var page: GraphQLNullable<Int>

  public init(
    limit: GraphQLNullable<Int>,
    page: GraphQLNullable<Int>
  ) {
    self.limit = limit
    self.page = page
  }

  public var __variables: Variables? { [
    "limit": limit,
    "page": page
  ] }

  public struct Data: SeekPlusAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SeekPlusAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("active", Active?.self, arguments: [
        "limit": .variable("limit"),
        "page": .variable("page")
      ]),
    ] }

    public var active: Active? { __data["active"] }

    /// Active
    ///
    /// Parent Type: `GetJobsResponse`
    public struct Active: SeekPlusAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SeekPlusAPI.Objects.GetJobsResponse }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("page", Int?.self),
        .field("size", Int?.self),
        .field("hasNext", Bool?.self),
        .field("total", Int?.self),
        .field("jobs", [Job?]?.self),
      ] }

      public var page: Int? { __data["page"] }
      public var size: Int? { __data["size"] }
      public var hasNext: Bool? { __data["hasNext"] }
      public var total: Int? { __data["total"] }
      public var jobs: [Job?]? { __data["jobs"] }

      /// Active.Job
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

        /// Active.Job.SalaryRange
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
}
