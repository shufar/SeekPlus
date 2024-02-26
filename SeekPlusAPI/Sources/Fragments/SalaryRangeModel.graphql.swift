// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct SalaryRangeModel: SeekPlusAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment SalaryRangeModel on SalaryRange { __typename min max }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { SeekPlusAPI.Objects.SalaryRange }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("min", Int?.self),
    .field("max", Int?.self),
  ] }

  public var min: Int? { __data["min"] }
  public var max: Int? { __data["max"] }
}
