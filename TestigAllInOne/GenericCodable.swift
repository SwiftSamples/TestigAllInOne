

import Foundation
import Alamofire
import UIKit

class GeneralResponse<T: Codable>: Codable {
    var jsonrpc: String
    var result: T?
    let error: ErrorClass?
}

// MARK: - ErrorClass
struct ErrorClass: Codable {
    let code, message, meaning: String?
}

struct RequestObject {
    var params: [String: Any]?
    var method: HTTPMethod
    var path: String
    var isTokenNeed: Bool = false
    var vc: UIViewController?
}

class WebService {
    
    private let decoder: JSONDecoder
    static let sharedInstance = WebService()

    
    
    public init(_ decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
    
    public func serviceCall<T: Codable>(_ objectType: T.Type,
                                        with request: RequestObject,
                                        completion: @escaping  (T?, Error?) -> Void)  {

        AF.request(request.path, method: request.method, parameters: request.params, encoding: JSONEncoding.default, headers: request.isTokenNeed ? ["Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvcHJvamVjdHMuYXhpb25pdGVjaC5jb21cL2sxMlwvcHJldmlld1wvYXBpXC9sb2dpbi1mYWNpbGl0YXRvciIsImlhdCI6MTY3MjkwNTEwMSwiZXhwIjoyNDYxMzA1MTAxLCJuYmYiOjE2NzI5MDUxMDEsImp0aSI6InJiOEdHckpEdE5HaVJ4T08iLCJzdWIiOjIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.FiNzFeAnkc8Gu0Ac1HgosOrfTXHnVl8YBWzYQEzbXc4", "Accept": "application/json"] : ["" : ""])
            .responseJSON { response in

                switch response.result {
                case .success(_):
                    print("only json respopnse \(response)")
                    do {
                        let data = response.data
                        let responseData  = try self.decoder.decode(T.self, from: data ?? Data())
                        completion(responseData, nil)

                    } catch {
                        completion(nil, error)
                        print("in catch \(error.localizedDescription)")
                    }
                case .failure(let AFError):
                    let error = AFError
                    print(error.localizedDescription)
                    print("failure error: \(error)")
                }
            }
    }
}

