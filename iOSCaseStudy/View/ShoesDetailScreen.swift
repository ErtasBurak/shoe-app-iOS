//
//  ShoesDetailScreen.swift
//  iOSCaseStudy
//

//

import UIKit

class ShoesDetailScreen: UIViewController {
    
    var shoeImageView = UIImageView()
    var shoeTitleLabel = UILabel()
    var shoeDescriptionLabel = UILabel()
    var shoeDetailDescriptionLabel = UILabel()
    var shoePriceLabel = UILabel()
    
    let buttonAddToCart: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ADD TO CART", for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 17.0)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        //button.layer.borderWidth = 5.0
        //button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = UIColor.darkGray
        button.titleLabel?.textColor = UIColor.white
        //button.tintColor = UIColor.white
        button.layer.cornerRadius = 20.0
        return button
    }()

    override func viewDidLoad() {
        
        self.navigationController!.navigationBar.tintColor = UIColor.darkGray

        self.navigationController?.navigationBar.topItem?.title = ""
        
        view.backgroundColor = .white
        
        view.addSubview(shoeImageView)
        view.addSubview(shoeTitleLabel)
        view.addSubview(shoeDescriptionLabel)
        view.addSubview(shoeDetailDescriptionLabel)
        view.addSubview(shoePriceLabel)
        view.addSubview(buttonAddToCart)
        
        configureImageView()
        configureTitleLabel()
        configureDescriptionLabel()
        configurePriceLabel()
        configureDetailDescriptionLabel()
        
        setImageConstraints()
        setTitleConstraints()
        setDescriptionConstraints()
        setPriceConstraints()
        setButtonConstraints()
        setDetailDescriptionConstraints()
    }
    
    @objc func buttonClicked(){
        let alert = UIAlertController(title: "", message: "Would you like to add to cart?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
        
    func set(shoe:Shoe){
        shoeImageView.image = shoe.image
        shoeTitleLabel.text = shoe.product
        shoeDescriptionLabel.text = shoe.description
        shoeDetailDescriptionLabel.text = shoe.detailDescription
        shoePriceLabel.text = shoe.price
        
    }
    
    func configureImageView(){
        shoeImageView.layer.cornerRadius = 10
        shoeImageView.clipsToBounds = true
    }
    
    func configureTitleLabel(){
        shoeTitleLabel.numberOfLines = 0
        shoeTitleLabel.adjustsFontSizeToFitWidth = true
        shoeTitleLabel.font = UIFont.boldSystemFont(ofSize: 22)
    }
    
    func configureDescriptionLabel(){
        shoeDescriptionLabel.numberOfLines = 0
        shoeDescriptionLabel.clipsToBounds = true
        shoeDescriptionLabel.font = UIFont.italicSystemFont(ofSize: 16)
    }
    
    func configureDetailDescriptionLabel(){
        shoeDetailDescriptionLabel.numberOfLines = 0
        shoeDetailDescriptionLabel.clipsToBounds = true
        shoeDetailDescriptionLabel.font = shoeDescriptionLabel.font.withSize(12)
    }
    
    func configurePriceLabel(){
        shoePriceLabel.numberOfLines = 0
        shoePriceLabel.clipsToBounds = true
        shoePriceLabel.textColor = UIColor.black
        shoePriceLabel.font = shoePriceLabel.font.withSize(22)
        shoePriceLabel.font = UIFont.italicSystemFont(ofSize: 22)
    }
    
    func setImageConstraints(){
        shoeImageView.translatesAutoresizingMaskIntoConstraints = false
        shoeImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        shoeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        shoeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        shoeImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shoeImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setTitleConstraints(){
        shoeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        shoeTitleLabel.topAnchor.constraint(equalTo: shoeImageView.bottomAnchor,constant: 15).isActive = true
        shoeTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        shoeTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        shoeTitleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shoeTitleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setDescriptionConstraints(){
        shoeDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        shoeDescriptionLabel.topAnchor.constraint(equalTo: shoeImageView.bottomAnchor,constant: 45).isActive = true
        shoeDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        shoeDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        shoeDescriptionLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shoeDescriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func setDetailDescriptionConstraints(){
        shoeDetailDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        shoeDetailDescriptionLabel.topAnchor.constraint(equalTo: shoeImageView.bottomAnchor,constant: 90).isActive = true
        shoeDetailDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        shoeDetailDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        shoeDetailDescriptionLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shoeDetailDescriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func setPriceConstraints(){
        shoePriceLabel.translatesAutoresizingMaskIntoConstraints = false
        shoePriceLabel.topAnchor.constraint(equalTo: shoeImageView.bottomAnchor,constant: 13).isActive = true
        shoePriceLabel.leadingAnchor.constraint(equalTo: shoeTitleLabel.trailingAnchor,constant: 20).isActive = true
        shoePriceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        shoePriceLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        shoePriceLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func setButtonConstraints(){
        buttonAddToCart.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10).isActive = true
        buttonAddToCart.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        buttonAddToCart.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        buttonAddToCart.widthAnchor.constraint(equalToConstant: 70).isActive = true
        buttonAddToCart.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
