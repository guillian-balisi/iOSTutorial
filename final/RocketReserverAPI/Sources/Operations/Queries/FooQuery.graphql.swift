// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class FooQuery: GraphQLQuery {
  public static let operationName: String = "Foo"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Foo($includeCurrentUserAwards: Boolean = false) { postsInfoByIds { __typename ... on Post { awardings { __typename total } } awardings @include(if: $includeCurrentUserAwards) { __typename awardingByCurrentUser { __typename id } } } }"#
    ))

  public var includeCurrentUserAwards: GraphQLNullable<Bool>

  public init(includeCurrentUserAwards: GraphQLNullable<Bool> = false) {
    self.includeCurrentUserAwards = includeCurrentUserAwards
  }

  public var __variables: Variables? { ["includeCurrentUserAwards": includeCurrentUserAwards] }

  public struct Data: RocketReserverAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("postsInfoByIds", [PostsInfoById]?.self),
    ] }

    public var postsInfoByIds: [PostsInfoById]? { __data["postsInfoByIds"] }

    /// PostsInfoById
    ///
    /// Parent Type: `PostInfo`
    public struct PostsInfoById: RocketReserverAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Interfaces.PostInfo }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .inlineFragment(AsPost.self),
        .include(if: "includeCurrentUserAwards", .field("awardings", [Awarding]?.self)),
      ] }

      public var awardings: [Awarding]? { __data["awardings"] }

      public var asPost: AsPost? { _asInlineFragment() }

      /// PostsInfoById.Awarding
      ///
      /// Parent Type: `AwardingTotal`
      public struct Awarding: RocketReserverAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.AwardingTotal }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("awardingByCurrentUser", [AwardingByCurrentUser]?.self),
        ] }

        public var awardingByCurrentUser: [AwardingByCurrentUser]? { __data["awardingByCurrentUser"] }

        /// PostsInfoById.Awarding.AwardingByCurrentUser
        ///
        /// Parent Type: `Awarding`
        public struct AwardingByCurrentUser: RocketReserverAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Awarding }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", String.self),
          ] }

          public var id: String { __data["id"] }
        }
      }

      /// PostsInfoById.AsPost
      ///
      /// Parent Type: `Post`
      public struct AsPost: RocketReserverAPI.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = FooQuery.Data.PostsInfoById
        public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Post }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("awardings", [Awarding]?.self),
        ] }

        public var awardings: [Awarding]? { __data["awardings"] }

        /// PostsInfoById.AsPost.Awarding
        ///
        /// Parent Type: `AwardingTotal`
        public struct Awarding: RocketReserverAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.AwardingTotal }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("total", Int.self),
          ] }

          public var total: Int { __data["total"] }

          public var ifIncludeCurrentUserAwards: IfIncludeCurrentUserAwards? { _asInlineFragment() }

          /// PostsInfoById.AsPost.Awarding.IfIncludeCurrentUserAwards
          ///
          /// Parent Type: `AwardingTotal`
          public struct IfIncludeCurrentUserAwards: RocketReserverAPI.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = FooQuery.Data.PostsInfoById.AsPost.Awarding
            public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.AwardingTotal }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              FooQuery.Data.PostsInfoById.Awarding.self,
              FooQuery.Data.PostsInfoById.AsPost.Awarding.self
            ] }

            public var awardingByCurrentUser: [AwardingByCurrentUser]? { __data["awardingByCurrentUser"] }
            public var total: Int { __data["total"] }
          }
        }
      }
    }
  }
}