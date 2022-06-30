//
//  ResultViewController.swift
//  Lesson12HomeworkTask2
//
//  Created by Виталий on 2.04.22.
//

import UIKit

class ResultViewController: UIViewController {
   
    private var users = [UserRacer]()
    private var arrayNamesOfDirectory = [String]()
    private var tableView: UITableView!
    private var stringDate: String!

    // MARK: - ViewControllerLifeCycle
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        guard var arrayNames = getNames() else {
            assertionFailure("No names")
            return
        }
        if arrayNames.count > 0 {
            if arrayNames.contains(".DS_Store") {
                arrayNames.remove(at: arrayNames.firstIndex(of: ".DS_Store")!)
            }
        }
        arrayNamesOfDirectory = arrayNames
        for name in arrayNamesOfDirectory {
            guard let user = loadData(path: name) else {
                assertionFailure("No user")
                return
            }
            users.append(user)
        }
        users = users.sorted { user1, user2 in
            user1.userTime! > user2.userTime!
        }
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = UIScreen.main.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    // MARK: - PrivateMetods
    // MARK: -
    private func loadData(path: String) -> UserRacer? {
        let documentsUrl = documentsUrl()
        let userResultUrl = documentsUrl?.appendingPathComponent(path)
        guard let userResultUrl = userResultUrl else {
            assertionFailure("No result url")
            return nil
        }
        let data = FileManager.default.contents(atPath: userResultUrl.path)
        guard let data = data else {
            assertionFailure("No data")
            return nil
        }
        let user = try? JSONDecoder().decode(UserRacer.self, from: data)
        return user
    }
    private func getNames() -> [String]? {
        let url = documentsUrl()
        guard let url = url else {
            assertionFailure("No url")
            return nil
        }
        let fileNames = try? FileManager.default.contentsOfDirectory(atPath: url.path)
        guard let fileNames = fileNames else {
            assertionFailure("No filenames")
            return nil
        }
        return fileNames
    }
    private func documentsUrl() -> URL? {
        let fileManager = FileManager.default
        let url = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return url
    }
}
// MARK: - Extension
// MARK: -

extension ResultViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = users[indexPath.row]
        let date = user.userDate
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yy HH:mm"
        if let date = date {
            stringDate = formatter.string(from: date)
        }
        cell.textLabel?.text = stringDate + " " + user.userName! + " " + user.userAge! +
        " Result: " + String(user.userTime!) + "s. " + String(user.userDistance!) + "m."
        return cell
    }
}
