//
//  Coordinator Pattern.swift
//  FirstCIDemo
//
//  Created by Anand Upadhyay on 02/03/23.
//

import Foundation
import UIKit

//class MainCoordinator: Coordinator {
//
//    var navigationController: UINavigationController
//
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//
//    func eventOccurred(with type: Event) {
//        switch type {
//        case .didTapAlbums:
//            var albumsTableViewController: UITableViewController & Coordinating = AlbumTableViewController()
//            albumsTableViewController.coordinator = self
//            navigationController.pushViewController(albumsTableViewController, animated: true)
//
//        case .didTapAlbumCell:
//            var photoTableViewController: UITableViewController & Coordinating = PhotoTableViewController()
//            photoTableViewController.coordinator = self
//            navigationController.pushViewController(photoTableViewController, animated: true)
//
//        case .didTapPhotoCell:
//            var detailsViewController: UIViewController & Coordinating = DetailsViewController()
//            detailsViewController.coordinator = self
//            navigationController.pushViewController(detailsViewController, animated: true)
//
//        case .didTapPosts:
//            var postsTableViewController: UITableViewController & Coordinating = PostTableViewController()
//            postsTableViewController.coordinator = self
//            navigationController.pushViewController(postsTableViewController, animated: true)
//
//        case .didTapPostCell:
//            var commentTableViewController: UITableViewController & Coordinating = CommentTableViewController()
//            commentTableViewController.coordinator = self
//            navigationController.pushViewController(commentTableViewController, animated: true)
//
//
//        }
//    }
//
//    func start() {
//        var challengeViewController: UITableViewController & Coordinating = ChallengeViewController()
//        challengeViewController.coordinator = self
//        navigationController.setViewControllers([challengeViewController], animated: false)
//    }
//
//
//}
 

//class ChallengeViewController: UITableViewController, Coordinating {
//
//    var coordinator: Coordinator?
//
//    let userViewModel = UserViewModel()
//
//    var users = [User]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableView.dataSource = self
//        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
//        tableView.rowHeight = 233
//
//        userViewModel.fillUsers { data in
//            self.users = data
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
//    }
//}
//
//// MARK: - TableView DataSource
//
//extension ChallengeViewController {
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return users.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserTableViewCell
//
//        let user = users[indexPath.row]
//        cell.selectionStyle = .none
//        cell.id = user.id
//
//        cell.initialsLabel.text = String(user.name.prefix(2))
//        cell.nameLabel.text = user.name
//        cell.userNameLabel.text = user.username
//        cell.emailLabel.text = user.email
//        cell.phoneLabel.text = user.phone
//        cell.delegate = self
//        cell.backgroundColor = indexPath.row % 2 == 0 ? .white : UIColor(white: 0.667, alpha: 0.2)
//        return cell
//    }
//}
//
//// MARK: - Navigation
//
//extension ChallengeViewController: UserTableViewCellDelegate {
//
//    func didTapAlbums(with userId: Int, by name: String) {
//        coordinator?.eventOccurred(with: .didTapAlbums)
//
//    }
//
//    func didTapPosts(with userId: Int, by name: String) {
//        coordinator?.eventOccurred(with: .didTapPosts)
//  }
//}
//
//#Coordinator
//import UIKit
//
//enum Event {
//    case didTapAlbums, didTapPosts, didTapAlbumCell, didTapPhotoCell, didTapPostCell
//}
//
//protocol Coordinator {
//    var navigationController: UINavigationController { get set }
//
//    func eventOccurred(with type: Event)
//
//    func start()
//}
//
//protocol Coordinating {
//    var coordinator: Coordinator? { get set }
//}
