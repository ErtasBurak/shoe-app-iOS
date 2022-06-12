//
//  MainScreen.swift
//  iOSCaseStudy
//

//

import UIKit
import CoreData
import TransitionTreasury
import TransitionAnimation

class MainScreen: UIViewController, NavgationTransitionable {
    
    var tr_pushTransition: TRNavgationTransitionDelegate?
    
    var tableView = UITableView()
    var shoes: [Shoe] = []
    
    
    struct Cells{
        static let imageCell = "ImageCell"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        shoes = fetchData()
        configureTableView()
        
    }
    
    
    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight=100
        tableView.register(ImageCell.self, forCellReuseIdentifier: Cells.imageCell)
        tableView.pin(to:view)
        
    }

    func setTableViewDelegates(){
        tableView.delegate=self
        tableView.dataSource=self
    }
    
    
}

extension MainScreen:UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.imageCell) as! ImageCell
        let shoe = shoes[indexPath.row]
        cell.set(shoe: shoe)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = ShoesDetailScreen()
        let shoeDetail = shoes[indexPath.row]
        detailVC.set(shoe: shoeDetail)
        navigationController?.pushViewController(detailVC, animated: true)
      }
    
}

extension MainScreen{
    
    func fetchData() -> [Shoe]{
        let shoe1 = Shoe(image: UIImage(named: "img_bigShoe")!, product: "Nike", description: "Air Jordan 13", price: "$300", detailDescription: "Get MJ's confidence in the Air Jordan 13 Navy. Representing strength and coolness in a stylish silhouette, the dimpled mesh Navy upper features glow-in-the-dark reflective threads.")
        let shoe2 = Shoe(image: UIImage(named: "img_shoe1")!, product: "Nike", description: "Air Force 1 Jester XX", price: "$96", detailDescription: "Get MJ's confidence in the Air Force 1 Jester XX. Representing strength and coolness in a stylish silhouette, the dimpled mesh upper features glow-in-the-dark reflective threads.")
        let shoe3 = Shoe(image: UIImage(named: "img_shoe2")!, product: "Nike", description: "Air Jordan 1 Retro", price: "$196", detailDescription: "Get MJ's confidence in the Air Jordan 1 Retro. Representing strength and coolness in a stylish silhouette, the dimpled mesh upper features glow-in-the-dark reflective threads.")
        let shoe4 = Shoe(image: UIImage(named: "img_shoe3")!, product: "New Balance", description: "574 Unisex", price: "$96", detailDescription: "Get MJ's confidence in the 574 Unisex. Representing strength and coolness in a stylish silhouette, the dimpled mesh upper features glow-in-the-dark reflective threads.")
        let shoe5 = Shoe(image: UIImage(named: "img_shoe4")!, product: "Nike", description: "Air Force 1 Shadow", price: "$115", detailDescription: "Get MJ's confidence in the Air Force 1 Shadow. Representing strength and coolness in a stylish silhouette, the dimpled mesh upper features glow-in-the-dark reflective threads.")
        
        return [shoe1,shoe2,shoe3,shoe4,shoe5]
    }
    
    
}

    

