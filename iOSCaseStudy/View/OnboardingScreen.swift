//
//  OnboardingScreen.swift
//  iOSCaseStudy
//

//

import UIKit
import TransitionTreasury
import TransitionAnimation

class ViewController: UIViewController {
    
    public var shoeProduct = [String]()
    public var shoePrice = [String]()
    public var shoeDescription = [String]()
    public var shoeImages = [UIImage]()

    let persistenceManager: PersistenceManager

    init(persistenceManager: PersistenceManager){
        self.persistenceManager = persistenceManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let titlelabel=UILabel()
        titlelabel.text = "Trendy Shoes for \nEvery \nFeet"
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        titlelabel.adjustsFontSizeToFitWidth = true
        titlelabel.numberOfLines = 0
        titlelabel.textAlignment = .left
        titlelabel.font = UIFont.boldSystemFont(ofSize: 40.0)
        titlelabel.textColor = UIColor.darkGray
        return titlelabel
    }()
    
    let imageShoe: UIImageView = {
        
        let firstScreenImage = "img_Nike-Shoe"
        let image = UIImage(named: firstScreenImage)
        let imageView = UIImageView(image: image!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        
        let descriptionlabel = UILabel()
        descriptionlabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionlabel.text = "This is the address you are looking for to \nfind the latest fashion and the most useful \nshoes suitable for everywhere."
        descriptionlabel.textColor = UIColor.darkGray
        descriptionlabel.numberOfLines = 0
        descriptionlabel.textAlignment = .center
        return descriptionlabel
    }()
    
    let buttonStart: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("START", for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 28.0)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        //button.layer.borderWidth = 5.0
        //button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = UIColor.darkGray
        button.titleLabel?.textColor = UIColor.white
        //button.tintColor = UIColor.white
        button.layer.cornerRadius = 40.0
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        createShoe()
//        getShoes()
        
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(imageShoe)
        view.addSubview(descriptionLabel)
        view.addSubview(buttonStart)
        
        setupLayout()
        
        
        func setupLayout(){
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 10).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
            titleLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
            
            imageShoe.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
            imageShoe.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            imageShoe.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            imageShoe.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor).isActive = true
            imageShoe.widthAnchor.constraint(equalToConstant: 800).isActive = true
            imageShoe.heightAnchor.constraint(equalToConstant:800).isActive = true
            
            descriptionLabel.topAnchor.constraint(equalTo: imageShoe.bottomAnchor).isActive = true
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            descriptionLabel.bottomAnchor.constraint(equalTo: buttonStart.topAnchor).isActive = true
            descriptionLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
            descriptionLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
            
            buttonStart.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10).isActive = true
            buttonStart.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
            buttonStart.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
            buttonStart.widthAnchor.constraint(equalToConstant: 100).isActive = true
            buttonStart.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
        }
        
        
        
        
    }
    
    @objc func buttonClicked(){
        let mainScreenController = MainScreen()
        navigationController?.tr_pushViewController(mainScreenController, method: TRPushTransitionMethod.fade, completion: nil)
    }
    //create Core Data Object
    func createShoe(){
        let shoe1 = Shoes_(context: persistenceManager.context)
        shoe1.product = "Nike"
        shoe1.description_ = "Air Jordan 13"
        shoe1.detaildescription = "Get MJ's confidence in the Air Jordan 13 Navy. Representing strength and coolness in a stylish silhouette, the dimpled mesh Navy upper features glow-in-the-dark reflective threads."
        shoe1.price = "$300"
        shoe1.image = "img_Nike-Shoe"

        persistenceManager.save()

        
    }

    func getShoes(){

        //guard let shoes = try! persistenceManager.context.fetch(Shoes_.fetchRequest()) as? [Shoes_] else {return}

        let shoes = persistenceManager.fetch(Shoes_.self)

        shoes.forEach({print($0.product)})



    }

}

