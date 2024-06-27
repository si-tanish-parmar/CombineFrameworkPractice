//
//  ProductViewModel.swift
//  CombineFrameworkPractice
//
//  Created by Tanish Parmar on 27/06/24.
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    @Published var products: [ProductModel] = []

    func fetchProducts() {
        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            if let products = try? JSONDecoder().decode([ProductModel].self, from: data) {
                DispatchQueue.main.async {
                    self.products = products
                }
            }
        }.resume()
    }
}

