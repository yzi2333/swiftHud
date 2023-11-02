//
//  HomeWalletTableViewCell.swift
//  Tw
//
//  Created by y on 2023/10/16.
//

import UIKit

class HomeWalletTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init? (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }

    
    private var tempModel:MainWalletModel?
    
    var model : MainWalletModel {
        set {
            tempModel = newValue

            //在这里给cell里的属性赋值
            self.nameLabel.text = model.name
            self.addressLabel.text = model.address
            self.timeLabel.text = model.time
//            print(!model.isObserve)
            self.observeImageView.isHidden = !model.isObserve
            self.observeLabel.isHidden = !model.isObserve
        }
        get {
            return (self.tempModel)!
        }
        
    }

    /// 初始化控件
    func setupView()  {
        self.backgroundColor = .clear
        
        self.setupContent()
        
    }

    func setupContent() {
        
        self.addSubviews(bgView, nameLabel, addressLabel, timeLabel, observeImageView,observeLabel)
        
        bgView.snp.makeConstraints { make in
            make.left.right.equalTo(0)
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(20 + 12)
            make.left.equalTo(16)
            make.width.equalTo(self.bounds.width/2)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.right.equalTo(-16)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.bottom.equalTo(-20 - 12)
        }
        
        observeImageView.snp.makeConstraints { make in
            make.right.equalTo(0)
            make.bottom.equalTo(-12)
            make.width.equalTo(64)
            make.height.equalTo(28)
        }
        
        observeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(observeImageView.snp.centerY)
            make.right.equalTo(-16)
        }
        
        bgView.addGradientLayerWithCorner(cornerRadius: 10, lineWidth: 1, colors: [UIColor.colorWithHex(hexStr: "282A37").cgColor,UIColor.colorWithHex(hexStr: "282A37", alpha: 0.1).cgColor])
        
    }
    
    lazy var bgView:UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.text = "钱包名称"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var addressLabel:UILabel = {
        let label = UILabel()
        label.text = "TPRgeqF23kNJTNzH5nqDhbReTrAwL8AxbL"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var timeLabel:UILabel = {
        let label = UILabel()
        label.text = "2023-10-16 19:51:56"
        label.textColor = .colorWithHex(hexStr: "6D6E77")
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    lazy var observeImageView:UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "TW_Home_Observe"))
        return imageview
    }()
    
    lazy var observeLabel:UILabel = {
        let label = UILabel()
        label.text = "观察"
        label.textColor = .colorWithHex(hexStr: "F64D6C")
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()


}
