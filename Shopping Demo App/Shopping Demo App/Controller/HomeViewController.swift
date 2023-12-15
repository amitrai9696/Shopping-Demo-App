//
//  HomeViewController.swift

//
//  Created by amit on 03/11/23.
//  Copyright © 2023 amit. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
     var viewModel = productviewmodel()
   
    @IBOutlet weak var productTableview: UITableView!
    override func viewDidLoad() {
    
        self.navigationItem.setHidesBackButton(true, animated: true)
        super.viewDidLoad()
       configuration()
     productTableview.dataSource = self
        productTableview.delegate = self
       pullrefresh()
    }
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
               navigationController?.popViewController(animated: true)
    }
    
    @objc func Pulltorefresh (sender: UIRefreshControl){
        let elementcount = viewModel.product.count
        sender.endRefreshing()
       productTableview.reloadData()
        
    }
    func pullrefresh(){
        let refresh = UIRefreshControl()
        refresh.attributedTitle = NSAttributedString(string: "Loading..")
               refresh.addTarget(self, action: #selector(Pulltorefresh (sender:)), for: .valueChanged)
               productTableview.refreshControl = refresh
    }
}

    extension HomeViewController {
        
        func configuration()  {
productTableview.register(UINib(nibName: "productViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
            
            initViewModel()
            obsereEvent()
        }
        func initViewModel (){
            viewModel.fachproduct()
        }
        func obsereEvent()  {
            viewModel.eventHandler = { [weak self] event in
                guard let self = self else{ return }
                
                switch event {
                case .loading:
                    //indicator show
                    print("product loading")
                    
                case .stopLoading:
                    //indicator hide
                    print("stop loading")
                case.dataLoaded:
                    DispatchQueue.main.async {
                        self.productTableview.reloadData()
                    }
                case.error(let error):
                    print(error)
              
                }
                
            }
        }
    }
extension HomeViewController :UITableViewDataSource,UITableViewDelegate {
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard  let cell = productTableview.dequeueReusableCell(withIdentifier: "Cell") as? productViewCell else {return UITableViewCell()}
        let product = viewModel.product[indexPath.row]
        cell.product = product
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC:ProductViewController = storyboard?.instantiateViewController(identifier: "ProductViewController")as! ProductViewController
          let product = viewModel.product[indexPath.row]
        
        VC.category = product.category
        VC.Description = product.description
        VC.Price = product.price
        VC.rating = product.rating.rate
        VC.image = product.image
        VC.Title  = product.title
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
}
