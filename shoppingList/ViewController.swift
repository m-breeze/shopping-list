//
//  ViewController.swift
//  shoppingList
//
//  Created by Marina Khort on 16.08.2020.
//  Copyright © 2020 Marina Khort. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

	var shoppingList = [String]()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
		}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return shoppingList.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
		cell.textLabel?.text = shoppingList[indexPath.row]
		return cell
	}
	
	@objc func addTapped() {
		let ac = UIAlertController(title: "Что вы хотите купить?", message: nil, preferredStyle: .alert)
		ac.addTextField()
		let okayAction = UIAlertAction(title: "ОК", style: .default) { [weak self, weak ac] action in
			guard let text = ac?.textFields?[0].text else { return }
			self?.submit(text)
			}
		ac.addAction(okayAction)
		present(ac, animated:  true)
	}
	
	@objc func refresh() {
		shoppingList.removeAll()
		tableView.reloadData()
	}
	
	func submit(_ text: String) {
		shoppingList.insert(text, at: 0)
		let indexPath = IndexPath(row: 0, section: 0)
		tableView.insertRows(at: [indexPath], with: .left)
	}
	
//	@objc func shareTapped() {
//		let list = shoppingList.joined(separator: "\n")
//		let ac = UIActivityViewController(activityItems: [shoppingList], applicationActivities: [])
//		ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
//		present(ac, animated:  true)
//	}
	
	
	//check if the word isn't misspelled
//	func isReal(word: String) -> Bool {
//		let checker = UITextChecker()
//		let range = NSRange(location: 0, length: word.utf16.count)
//		let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "ru")
//		return misspelledRange.location == NSNotFound
//	}
}

