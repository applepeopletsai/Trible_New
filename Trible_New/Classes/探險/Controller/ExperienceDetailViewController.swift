//
//  ExperienceDetailViewController.swift
//  Trible_New
//
//  Created by Daniel on 2018/11/13.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class ExperienceDetailViewController: BaseViewController {
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var cycleView: LLCycleScrollView!
    @IBOutlet fileprivate weak var topView: UIView!
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet private weak var topViewHeight: NSLayoutConstraint!
    
    private let headerViewHeight: CGFloat = 300.0
    private var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        configureTableView()
        configureCycleView()
        configureTopViewHeight()
    }
    
    private func registerCell() {
        self.tableView.register(UINib(nibName: String(describing: ExperienceDetailCell_Info.self), bundle: nil), forCellReuseIdentifier: String(describing: ExperienceDetailCell_Info.self))
        self.tableView.register(UINib(nibName: String(describing: ExperienceDetailCell_SharerInfo.self), bundle: nil), forCellReuseIdentifier: String(describing: ExperienceDetailCell_SharerInfo.self))
        self.tableView.register(UINib(nibName: String(describing: ExperienceDetailCell_ExpDes.self), bundle: nil), forCellReuseIdentifier: String(describing: ExperienceDetailCell_ExpDes.self))
        self.tableView.register(UINib(nibName: String(describing: ExperienceDetailCell_Traffic.self), bundle: nil), forCellReuseIdentifier: String(describing: ExperienceDetailCell_Traffic.self))
        self.tableView.register(UINib(nibName: String(describing: ExperienceDetailCell_Evaluation.self), bundle: nil), forCellReuseIdentifier: String(describing: ExperienceDetailCell_Evaluation.self))
        self.tableView.register(UINib(nibName: String(describing: ExperienceDetailCell_Normal.self), bundle: nil), forCellReuseIdentifier: String(describing: ExperienceDetailCell_Normal.self))
        self.tableView.register(UINib(nibName: String(describing: ExperienceHomeTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ExperienceHomeTableViewCell.self))
    }
    
    private func configureTableView() {
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: headerViewHeight - 20, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -headerViewHeight)
        
        updateHeaderView()
    }
    
    private func configureCycleView() {
        cycleView.autoScrollTimeInterval = 3.0
        cycleView.coverImage = UIImage(named: "logo_salon_walker_132x132")
        cycleView.imageViewContentMode = .scaleAspectFill
        cycleView.scrollDirection = .horizontal
        cycleView.customPageControlStyle = .system
        cycleView.pageControlCurrentPageColor = .red
        cycleView.imagePaths = ["https://res.klook.com/image/upload/fl_lossy.progressive/q_auto/f_auto/blogtw/%E5%A5%A7%E5%9C%B0%E5%88%A9%E5%85%AD%E5%80%8B%E7%B5%95%E7%BE%8E%E5%B0%8F%E9%8E%AE01.jpg","https://pic.pimg.tw/enzoyoko/1435366958-3496907946_l.jpg","https://cdn-images-1.medium.com/max/2000/1*ePIkh-4m0GOYRMjr05DmUQ.jpeg"]
    }
    
    private func configureTopViewHeight() {
        self.topViewHeight.constant = 45 + ((safeArea().top == 0) ? statusBarHeight : safeArea().top)
    }
    
    fileprivate func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -headerViewHeight, width: tableView.bounds.width, height: headerViewHeight)
        if tableView.contentOffset.y < -headerViewHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
    }
    
    fileprivate func updateTopView(yPosition: CGFloat) {
        if yPosition >= 0 {
            self.topView.backgroundColor = UIColor(white: 1, alpha: 1)
            self.titleLabel.alpha = 1
        } else {
            let alpha = ((headerViewHeight + yPosition) / headerViewHeight) >= 1.0 ? 1.0 : ((headerViewHeight + yPosition) / headerViewHeight)
            self.topView.backgroundColor = UIColor(white: 1, alpha: alpha)
            self.titleLabel.alpha = alpha
        }
    }
    
    // MARK: Event Handler
    @IBAction private func reserveButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_Experience, bundle: nil).instantiateViewController(withIdentifier: String(describing: ImmediatelyReserveViewController.self)) as! ImmediatelyReserveViewController
        let naviVC = UINavigationController(rootViewController: vc)
        naviVC.isNavigationBarHidden = true
        self.present(naviVC, animated: true, completion: nil)
    }
}

extension ExperienceDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 4 {
            return 3
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceDetailCell_Info.identifier, for: indexPath) as! ExperienceDetailCell_Info
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceDetailCell_SharerInfo.identifier, for: indexPath) as! ExperienceDetailCell_SharerInfo
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceDetailCell_ExpDes.identifier, for: indexPath) as! ExperienceDetailCell_ExpDes
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceDetailCell_Traffic.identifier, for: indexPath) as! ExperienceDetailCell_Traffic
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceDetailCell_Evaluation.identifier, for: indexPath) as! ExperienceDetailCell_Evaluation
            cell.configureCellWith(indexPath: indexPath)
            return cell
        case 5,6,7:
            let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceDetailCell_Normal.identifier, for: indexPath) as! ExperienceDetailCell_Normal
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceHomeTableViewCell.identifier, for: indexPath) as! ExperienceHomeTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension ExperienceDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 8 {
            return experienceItemHeight_Normal + 40
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return (section == 7) ? 15.0 : 0.0
    }
}

extension ExperienceDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
        updateTopView(yPosition: scrollView.contentOffset.y)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        cycleView.autoScroll = false
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        cycleView.autoScroll = true
    }
}
