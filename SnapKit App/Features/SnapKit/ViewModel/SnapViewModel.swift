//
//  SnapViewModel.swift
//  SnapKit App
//
//  Created by NomoteteS on 6.01.2023.
//

import Foundation

protocol ISnapViewModel {
    func fetchItems()
    func changeLoading()
    
    var characters: [Result] { get set }
    var snapService: ISnapService { get }
    
    var snapOutPut: SnapOutPut? {get}
    
    func setDelegate(output: SnapOutPut)
}

final class SnapViewModel: ISnapViewModel {
    var snapOutPut: SnapOutPut?
    
    func setDelegate(output: SnapOutPut) {
        snapOutPut = output
    }
    
    var characters: [Result] = []
    private var isLoading = false
    let snapService: ISnapService
    
    init() {
        snapService = SnapService()
    }
    
    func fetchItems() {
        changeLoading()
        snapService.fetchAllDatas { [weak self] (response) in
            self?.changeLoading()
            self?.characters = response ?? []
            self?.snapOutPut?.saveDatas(values: self?.characters  ?? [] )
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        snapOutPut?.changeLoading(isLoad: isLoading)
    }

}
