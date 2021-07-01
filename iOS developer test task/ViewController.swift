import UIKit
import SnapKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    var tableView = UITableView()
    let ident = "myCell"
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
        downloadJSON {
            self.tableView.reloadData()
        }
    }
    
    
    
    
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.countries = try JSONDecoder().decode([Country].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch {
                    print("JSON error")
                }
            }
        }.resume()

        
    }
    
    

    
    func createTable() {
        
        self.title = "Countries"
        
        self.tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ident)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(tableView)
    }
    
    //Mark: UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ident, for: indexPath)
        
               
        cell.textLabel?.text = countries[indexPath.row].name
        cell.detailTextLabel?.text = "test"
        
        
        let label = UILabel.init(frame: CGRect(x:0,y:0,width:200,height:20))
        label.text = "Capital is \(countries[indexPath.row].capital.capitalized)"
        cell.accessoryView = label
        
        
        return cell
    }
    
    
    
    //Mark: UITableViewDataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}




