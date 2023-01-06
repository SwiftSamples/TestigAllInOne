
import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var k12Data: PostModel? {
        didSet {
            DispatchQueue.main.async{
                self.paginationTable.reloadData()
            }
        }
    }
    
    @IBOutlet weak var paginationTable: UITableView!
    
    override func viewDidLoad() {
        paginationTable.delegate = self
        paginationTable.dataSource = self
        paginationTable.reloadData()
        testServiceCall()
    }
    
    
    func testServiceCall(){
        
        let paramet = ["keyword": "",
                       "grade": "",
                       "school": "",
                       "tag": "",
                       "type": "Peer",
                       "page_no": "1"]
        
        let request = RequestObject(params: paramet, method: .post, path: "https://projects.axionitech.com/k12/preview/api/student/peer-k12admin-post", isTokenNeed: true, vc: self)
        WebService.sharedInstance.serviceCall(PostModel.self, with: request) { (response, error) in
            
            print("API response \(response)")
    }
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableview", for: indexPath) as! TestTableview
        cell.titleLbl.text = "ttt"
        return cell
    }
    
}


class TestTableview: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}



struct PostResponse: Codable {
    let job, name, id, createdAt: String
}
