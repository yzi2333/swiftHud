//
//  HomeBottomView.swift
//  Tw
//
//  Created by y on 2023/10/16.
//

import UIKit

class HomeBottomView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    let cellIdentifier:String = "HomeWalletCell"
//    var cellDataArray:Array<MainWalletModel>
    
//    lazy var cellDataArray:Array<MainWalletModel> = {
//        let array = Array<MainWalletModel>()
////        walletTableView.reloadData()
//        return array
//    }()
    
    private var tmpArray:Array<MainWalletModel>? = []
    
    var cellDataArray: Array<MainWalletModel> {
        set {
            tmpArray = newValue
            walletTableView.reloadData()

        }
        get {
            return (self.tmpArray)!
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:HomeWalletTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeWalletTableViewCell
        cell.selectionStyle = .none
        let model = cellDataArray[indexPath.row]
        cell.model = model
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90 + 24
    }
    

//    func initData(array:Array<MainWalletModel>) {
//        cellDataArray = array
//    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
        
    }
    
    lazy var leftLabel:UILabel = {
        let label = UILabel()
        label.text = "我的钱包"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var searchImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "TW_Home_Search"))
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    lazy var searchControl:UIControl = {
        let control = UIControl()
        control.backgroundColor = .clear
        control.addTarget(self, action: #selector(searchControlAction), for: .touchUpInside)
        return control
    }()

    lazy var walletTableView:UITableView = {
        let tableView = UITableView.init()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = kFitWidth(200)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeWalletTableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    
    // -----------------------searchView-----------------------
    lazy var searchView:UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.isHidden = true
        return view
    }()
    
    
    
    // -----------------------searchView-----------------------
    
    /// 初始化控件
    func setupView()  {
        self.backgroundColor = .clear
        
        self.setupContent()
        
    }
    
    func setupContent() {
        
        self.addSubviews(leftLabel, searchImageView, searchControl, walletTableView, searchView)
        
        leftLabel.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.top.equalTo(36)
        }
        
        searchImageView.snp.makeConstraints { make in
            make.centerY.equalTo(leftLabel.snp.centerY)
            make.right.equalTo(-20)
            make.width.height.equalTo(20)
        }
        
        searchControl.snp.makeConstraints { make in
            make.bottom.equalTo(searchImageView.snp.bottom)
            make.right.equalTo(0)
            make.width.height.equalTo(40)
        }
        
        walletTableView.snp.makeConstraints { make in
            make.top.equalTo(leftLabel.snp.bottom).offset(12)
            make.left.bottom.equalTo(16)
            make.right.bottom.equalTo(-16)
        }
        
        searchView.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(48)
        }
    }
    

    @objc func searchControlAction() {
        print("33333333333333")
        
        if searchView.isHidden{
            searchView.fadeIn(duration: 0.3)
            UIView.animate(withDuration: 0.3) {
                self.leftLabel.snp.updateConstraints { make in
                    make.top.equalTo(72)
                }
            }
        }else{
            searchView.fadeOut(duration: 0.3)
            UIView.animate(withDuration: 0.3) {
                self.leftLabel.snp.updateConstraints { make in
                    make.top.equalTo(16)
                }
            }
        }
        

    }
}
