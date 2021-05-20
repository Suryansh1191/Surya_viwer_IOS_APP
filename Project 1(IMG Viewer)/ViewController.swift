 	//
//  ViewController.swift
//  Project 1(IMG Viewer)
//
//  Created by suryansh Bisen on 15/05/21.
//

import UIKit

class ViewController: UITableViewController {
    var picture = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "First Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        

        let fm = FileManager.default
        let  path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items{
            if item.hasPrefix("nss") {
                // this is a picture to load
                picture.append(item)
            }
        }
        
       //print(picture)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picture.count;
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = picture[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController{
            vc.selectedImage = picture[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

