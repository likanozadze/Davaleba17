//
//  MainViewController.swift
//  Davaleba17
//
//  Created by Lika Nozadze on 10/29/23.
//

import UIKit

class MainViewController: UIViewController {
    
    var movieImageView = UIImageView()
    var movieTitleLabel = UILabel()
    
    private let images: [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
        UIImage(named: "6")!,
        UIImage(named: "7")!,
        UIImage(named: "8")!,
        UIImage(named: "9")!,
        UIImage(named: "10")!,
    ]
    private let movieTitles: [String] = [
        "Barbie",
        "Five Nights at Freddy's",
        "Killers of the Flower Moon",
        "Home alone",
        "The Godfather",
        "The Dark Knight",
        "12 Angry Men",
        "Pulp Fiction",
        "Fight Club",
        "Inception"
    ]


    //MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = true
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        self.navigationItem.title = "Movie List"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(didTapPlusButton))
        
        setupSubviews()
        setTableViewDelegates()
        setTableViewConstraints()
        registerTableViewCells()
        configureMovieImageView()
        configureMovieTitleLabel()
        setMovieImageViewConstraints()
    }
    
    // MARK: -  Methods
    
    func setupSubviews() {
        view.addSubview(tableView)
        view.addSubview(stackView)
        view.addSubview(movieImageView)
        view.addSubview(movieTitleLabel)
    }
    
    
    private func registerTableViewCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    func configureMovieImageView() {
        movieImageView.layer.cornerRadius = 10
        movieImageView.clipsToBounds = true
    }
    
    
    func configureMovieTitleLabel() {
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    
    func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    func setMovieImageViewConstraints() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            movieImageView.heightAnchor.constraint(equalToConstant: 80),
            movieImageView.widthAnchor.constraint(equalTo: movieImageView.heightAnchor, multiplier: 16/9)
        ])
        
    }
    
    func setTableViewDelegates() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("The TableView could not dequeue a CustomCell in ViewContoller.")
        }
        
        let image = self.images[indexPath.row]
                let title = self.movieTitles[indexPath.row]
                cell.configure(with: image, and: title)
                return cell
    }
    
    @objc private func didTapPlusButton() {
        let addNewItemViewController = AddNewItemToListViewController(movieTitle: "")
        self.navigationController?.pushViewController(addNewItemViewController, animated: true)
    }
    
}


