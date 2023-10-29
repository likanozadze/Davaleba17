//
//  AddNewItemToListViewController.swift
//  Davaleba17
//
//  Created by Lika Nozadze on 10/29/23.
//

import UIKit

class AddNewItemToListViewController: UIViewController {
    
    
    // MARK: - Properties
    private let movieLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [movieLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.backgroundColor = .systemGroupedBackground
        stackView.layer.cornerRadius = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        return stackView
    }()
    
    
    var movieTitle: String?
    init(movieTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.movieTitle = movieTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemPurple
        self.navigationItem.title = "AddNewItemToListViewController"
       
        setupSubviews()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() {
        guard let movie = movieTitle else { return }
        movieLabel.text = movie
    }
    
    private func setupSubviews() {
        view.addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
}
    
