//
//  HomeTopView.swift
//  Tw
//
//  Created by y on 2023/10/16.
//

import UIKit

protocol HomeTopViewDelegate:NSObjectProtocol{
    func walletClick()
}

class HomeTopView: UIView {

    weak var delegate: HomeTopViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
        
    }

    /// 初始化控件
    func setupView()  {
        self.backgroundColor = .clear
        
        self.setupContent()
        
    }
    
    func setupContent() {
        self.addSubviews(topTitle, rightImageView, rightControl, detailBgImageView, nameLabel, trxCountLabel, usdtCountLabel,addressLabel,energyLabel,energyCountLabel,bandwidthLabel,bandwidthCountLabel)
        
        topTitle.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.top.equalTo(kUIStatusBarHeight + 21)
        }
        
        rightImageView.snp.makeConstraints { make in
            make.centerY.equalTo(topTitle.snp.centerY)
            make.right.equalTo(-16)
            make.height.width.equalTo(20)
        }
        
        rightControl.snp.makeConstraints { make in
            make.bottom.equalTo(rightImageView.snp.bottom)
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.left.equalTo(rightImageView.snp.left)
        }
        
        detailBgImageView.snp.makeConstraints { make in
            make.top.equalTo(kUIStatusBarHeight + 77)
            make.left.equalTo(24)
            make.right.equalTo(-24)
            make.height.equalTo(180)
        }
        
        // ---------------------detail------------------
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(kUIStatusBarHeight + 77 + 24)
            make.left.equalTo(24 + 24)
            make.width.equalTo(kUIScreenWidth - 96)
        }
        
        trxCountLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.equalTo(nameLabel.snp.left)
            make.width.equalTo(kUIScreenWidth - 96)
        }
        
        usdtCountLabel.snp.makeConstraints { make in
            make.top.equalTo(trxCountLabel.snp.bottom).offset(10)
            make.left.equalTo(nameLabel.snp.left)
            make.width.equalTo(kUIScreenWidth - 96)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(usdtCountLabel.snp.bottom).offset(12)
            make.left.equalTo(nameLabel.snp.left)
            make.width.equalTo(kUIScreenWidth - 96)
        }
        
        energyLabel.snp.makeConstraints { make in
            make.top.equalTo(addressLabel.snp.bottom).offset(12)
            make.left.equalTo(nameLabel.snp.left)
        }
        
        energyCountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(energyLabel.snp.centerY)
            make.left.equalTo(energyLabel.snp.right).offset(10)
        }
        
        bandwidthLabel.snp.makeConstraints { make in
            make.centerY.equalTo(energyLabel.snp.centerY)
            make.left.equalTo(energyCountLabel.snp.right).offset(24)
        }
        
        bandwidthCountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(energyLabel.snp.centerY)
            make.left.equalTo(bandwidthLabel.snp.right).offset(10)
        }
        
        // ---------------------detail------------------
    }
    

    
    lazy var detailBgImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "TW_Home_DetailBg"))
        imageView.backgroundColor = .clear
        return imageView
    }()

    lazy var topTitle: UILabel = {
        let label = UILabel()
        label.text = "近期使用钱包"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "TW_Home_Wallet")
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    lazy var rightControl: UIControl = {
        let control = UIControl()
        control.backgroundColor = .clear
        control.addTarget(self, action: #selector(rightControlAction), for: .touchUpInside)
        return control
    }()

    // ---------------------detail------------------
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        if #available(iOS 15, *) {
            label.text = String(localized: "Home_Wallet")
        } else {
            // Fallback on earlier versions
            label.text = NSLocalizedString("Home_Wallet", comment: "Home_Wallet")
        }
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var trxCountLabel:UILabel = {
        let label = UILabel()
        label.text = "0 TRX"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var usdtCountLabel:UILabel = {
        let label = UILabel()
        label.text = "0 USDT"
        label.textColor = UIColor.colorWithHex(hexStr: "AEA0FF")
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var addressLabel:UILabel = {
        let label = UILabel()
        label.text = "TPRgeqF23kNJTNzH5nqDhbReTrAwL8AxbL"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    lazy var energyLabel:UILabel = {
        let label = UILabel()
        label.text = "能量"
        label.textColor = UIColor.colorWithHex(hexStr: "00B678")
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    lazy var energyCountLabel:UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    lazy var bandwidthLabel:UILabel = {
        let label = UILabel()
        label.text = "带宽"
        label.textColor = UIColor.colorWithHex(hexStr: "00B678")
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    lazy var bandwidthCountLabel:UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()

    // ---------------------detail------------------
    

    //  钱包管理
    @objc func rightControlAction(){
        print("222222222")
//        if self.delegate != nil && (self.delegate?.responds(to: Selector.init(("walletClick:"))))! {
//            print("999")
//            self.delegate?.walletClick()
//        }
        
        //调用代理方法
        if delegate != nil
        {
            print("120")
            delegate?.walletClick()
        }

        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
///在此方法中更新子控件的frame或添加约束
//        self.button.snp.makeConstraints { (make) in
//            make.trailing.equalTo(self).offset(-30)
//            make.width.equalTo(120)
//            make.height.equalTo(48)
//            make.centerY.equalTo(self)
//        }
        
        
    }
    

}
