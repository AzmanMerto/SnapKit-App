//
//  SnapViewController.swift
//  SnapKit App
//
//  Created by NomoteteS on 3.01.2023.
//

import UIKit
import SnapKit

protocol SnapOutPut {
    func changeLoading(isLoad: Bool)
    func saveDatas(values: [Result])
}

final class SnapViewController: UIViewController {
    private let labelTitle: UILabel = UILabel()
    private let tableView: UITableView = UITableView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    private lazy var result: [Result] = []
    
    lazy var viewModel : ISnapViewModel = SnapViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.fetchItems()
    }
    
    func configure() {
        view.addSubview(labelTitle)
        view.addSubview(tableView)
        view.addSubview(indicator)
        
        drawDesign()
        makeTableView()
        makeIndicator()
        makeLabel()
    }
    
    func drawDesign() {
        tableView.delegate = self
        tableView.dataSource = self
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.labelTitle.text = "VB10"
            self.indicator.color = .red
        }
        indicator.startAnimating()
    }
    
}

extension SnapViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = result[indexPath.row].name ?? ""
        
        return cell
    }
    
    
}

extension SnapViewController: SnapOutPut{
    func changeLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func saveDatas(values: [Result]) {
        result = values
        tableView.reloadData()
    }
    
    
}

extension SnapViewController {
    private func makeTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(labelTitle)
        }
    }
    
    private func makeLabel() {
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    private func makeIndicator() {
        indicator.snp.makeConstraints { make in
            make.height.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
            make.top.equalTo(labelTitle)
        }
    }

}
