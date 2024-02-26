// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct JobModel: SeekPlusAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment JobModel on Job { __typename _id positionTitle description salaryRange { __typename ...SalaryRangeModel } location industry haveIApplied }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { SeekPlusAPI.Objects.Job }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("_id", String?.self),
    .field("positionTitle", String?.self),
    .field("description", String?.self),
    .field("salaryRange", SalaryRange?.self),
    .field("location", Int?.self),
    .field("industry", Int?.self),
    .field("haveIApplied", Bool?.self),
  ] }

  public var _id: String? { __data["_id"] }
  public var positionTitle: String? { __data["positionTitle"] }
  public var description: String? { __data["description"] }
  public var salaryRange: SalaryRange? { __data["salaryRange"] }
  public var location: Int? { __data["location"] }
  public var industry: Int? { __data["industry"] }
  public var haveIApplied: Bool? { __data["haveIApplied"] }

  /// SalaryRange
  ///
  /// Parent Type: `SalaryRange`
  public struct SalaryRange: SeekPlusAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SeekPlusAPI.Objects.SalaryRange }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(SalaryRangeModel.self),
    ] }

    public var min: Int? { __data["min"] }
    public var max: Int? { __data["max"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var salaryRangeModel: SalaryRangeModel { _toFragment() }
    }
  }
}
