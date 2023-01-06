
import UIKit

class SecondViewController: UIViewController {

    
    var k12Data: PostModel?
    
    @IBOutlet weak var paginationTable: UITableView!
    
    override func viewDidLoad() {
        testServiceCall()
    }
    
    func testServiceCall(){
        
        let paramet = ["keyword": "",
                       "grade": "",
                       "school": "",
                       "tag": "",
                       "type": "Peer",
                       "page_no": "1"] as [String : Any]
        
        let request = RequestObject(params: paramet, method: .post, path: "https://projects.axionitech.com/k12/preview/api/student/peer-k12admin-post", isTokenNeed: true, vc: self)
        WebService.sharedInstance.serviceCall(PostModel.self, with: request) { (response, error) in
            print("API response \(response)")
    }
    }
}
