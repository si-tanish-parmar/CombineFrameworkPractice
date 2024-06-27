//
//  ViewController.swift
//  CombineFrameworkPractice
//
//  Created by Tanish Parmar on 27/06/24.
//

import Foundation
import Combine
import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    private var viewModel = ProductViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialUI()
        bindData()
        viewModel.fetchProducts()
    }
    
    private func setupInitialUI(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ProductsTblCell", bundle: nil), forCellReuseIdentifier: "ProductsTblCell")
    }
    
    private func bindData(){
        viewModel.$products.didSet.sink { value in
            self.tableView.reloadData()
        }.store(in: &cancellables)
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTblCell", for: indexPath) as? ProductsTblCell else {return UITableViewCell()}
        let product = viewModel.products[indexPath.row]
        cell.productNumber?.text = "Product Number: \(product.id)"
        cell.productPrice?.text = "Product Price: \(product.price)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
