//
//  CellController.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 30/04/2023.
//

import UIKit

public struct CellController {
    
    let id: AnyHashable
    let dataSource: UITableViewDataSource
    let delegate: UITableViewDelegate?
    let dataSourcePrefetching: UITableViewDataSourcePrefetching?
    
    public init(id: AnyHashable, _ dataSource: UITableViewDataSource & UITableViewDelegate & UITableViewDataSourcePrefetching) {
        self.id = id
        self.dataSource = dataSource
        self.delegate = dataSource
        self.dataSourcePrefetching = dataSource
    }
    
    public init(id: AnyHashable, _ dataSource: UITableViewDataSource) {
        self.id = id
        self.dataSource = dataSource
        self.delegate = nil
        self.dataSourcePrefetching = nil
    }
    
    public init(id: AnyHashable, _ dataSource: UITableViewDataSource, _ delegate: UITableViewDelegate) {
        self.id = id
        self.dataSource = dataSource
        self.delegate = delegate
        self.dataSourcePrefetching = nil
    }
    
}

extension CellController: Equatable {
    public static func == (lhs: CellController, rhs: CellController) -> Bool {
        lhs.id == rhs.id
    }
}

extension CellController: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
