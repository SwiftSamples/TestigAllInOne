// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let postModel = try? JSONDecoder().decode(PostModel.self, from: jsonData)

import Foundation

// MARK: - PostModel
struct PostModel: Codable {
    let jsonrpc: String
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let postData: PostData
}

// MARK: - PostData
struct PostData: Codable {
    let pageCount, perPage, postCount: Int
    let postDetails: [PostDetail]
    let imagePath: String

    enum CodingKeys: String, CodingKey {
        case pageCount = "page_count"
        case perPage = "per_page"
        case postCount = "post_count"
        case postDetails = "post_details"
        case imagePath = "image_path"
    }
}

// MARK: - PostDetail
struct PostDetail: Codable {
    let id, userID: Int
    let postDate, postDetailDescription: String
    let postedBy: PostedBy
    let status: Status
    let createdAt, updatedAt: String
    let getPostLikeCount, isMyLike, isMyFollowed: Int
    let getPostHashtag: [GetPostHashtag]
    let getPostLike: [GetPostLike]
    let getUserDetails: GetUserDetails
    let getPostImage: [GetPostImage]
    let getlLastComment: GetlLastComment?
    let ismylikedpostloggedin, ismyfollowpostloggedin: GetPostLike?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case postDate = "post_date"
        case postDetailDescription = "description"
        case postedBy = "posted_by"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case getPostLikeCount = "get_post_like_count"
        case isMyLike = "is_my_like"
        case isMyFollowed = "is_my_followed"
        case getPostHashtag = "get_post_hashtag"
        case getPostLike = "get_post_like"
        case getUserDetails = "get_user_details"
        case getPostImage = "get_post_image"
        case getlLastComment = "getl_last_comment"
        case ismylikedpostloggedin, ismyfollowpostloggedin
    }
}

// MARK: - GetPostHashtag
struct GetPostHashtag: Codable {
    let id, postMasterID, tagMasterID: Int
    let createdAt, updatedAt: String
    let getTagDetails: GetTagDetails

    enum CodingKeys: String, CodingKey {
        case id
        case postMasterID = "post_master_id"
        case tagMasterID = "tag_master_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case getTagDetails = "get_tag_details"
    }
}

// MARK: - GetTagDetails
struct GetTagDetails: Codable {
    let id: Int
    let tag: String
    let type: TypeEnum
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, tag, type
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

enum TypeEnum: String, Codable {
    case p = "P"
}

// MARK: - GetPostImage
struct GetPostImage: Codable {
    let id, postMasterID: Int
    let fileType: Status
    let file, createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case postMasterID = "post_master_id"
        case fileType = "file_type"
        case file
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

enum Status: String, Codable {
    case a = "A"
    case i = "I"
}

// MARK: - GetPostLike
struct GetPostLike: Codable {
    let id: Int
    let postMasterID: Int?
    let userID: Int
    let createdAt, updatedAt: String
    let followedTo: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case postMasterID = "post_master_id"
        case userID = "user_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case followedTo = "followed_to"
    }
}

// MARK: - GetUserDetails
struct GetUserDetails: Codable {
    let id: Int
    let userID, name, email, username: String
    let slug, phone, parentName: String
    let userType: UserType
    let gender: Gender
    let profilePic: String?
    let dob, grade, schoolName, schoolLocation: String
    let emailVcode, phoneVcode: JSONNull?
    let status: Status
    let isEmailVerified: IsEmailVerified
    let isPhoneVerified: Is
    let facilitatorType: Status
    let expertise, experience, facilitatorBio: String?
    let studentBio: String
    let location: String?
    let totalNoOfReviews: Int
    let avgReview: String
    let emailVerifiedAt: JSONNull?
    let platform: Status
    let totPost, totalFollowers, totalFollowing, subscriptionID: Int
    let isSubscribed: Is
    let subscriptionEndDate: String
    let blockReason: JSONNull?
    let isApproved: PostedBy
    let reason, approvedDate, approvedBy: JSONNull?
    let loginStatus: Status
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case name, email, username, slug, phone
        case parentName = "parent_name"
        case userType = "user_type"
        case gender
        case profilePic = "profile_pic"
        case dob, grade
        case schoolName = "school_name"
        case schoolLocation = "school_location"
        case emailVcode = "email_vcode"
        case phoneVcode = "phone_vcode"
        case status
        case isEmailVerified = "is_email_verified"
        case isPhoneVerified = "is_phone_verified"
        case facilitatorType = "facilitator_type"
        case expertise, experience
        case facilitatorBio = "facilitator_bio"
        case studentBio = "student_bio"
        case location
        case totalNoOfReviews = "total_no_of_reviews"
        case avgReview = "avg_review"
        case emailVerifiedAt = "email_verified_at"
        case platform
        case totPost = "tot_post"
        case totalFollowers = "total_followers"
        case totalFollowing = "total_following"
        case subscriptionID = "subscription_id"
        case isSubscribed = "is_subscribed"
        case subscriptionEndDate = "subscription_end_date"
        case blockReason = "block_reason"
        case isApproved = "is_approved"
        case reason
        case approvedDate = "approved_date"
        case approvedBy = "approved_by"
        case loginStatus = "login_status"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

enum Gender: String, Codable {
    case f = "F"
    case m = "M"
}

enum PostedBy: String, Codable {
    case u = "U"
}

enum IsEmailVerified: String, Codable {
    case n = "N"
}

enum Is: String, Codable {
    case y = "Y"
}

enum UserType: String, Codable {
    case s = "S"
}

// MARK: - GetlLastComment
struct GetlLastComment: Codable {
    let id, postMasterID, userID: Int
    let date, comment, type: String
    let commentID: Int
    let createdAt, updatedAt: String
    let getUserDetails: GetUserDetails

    enum CodingKeys: String, CodingKey {
        case id
        case postMasterID = "post_master_id"
        case userID = "user_id"
        case date, comment, type
        case commentID = "comment_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case getUserDetails = "get_user_details"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
