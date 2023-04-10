//
//  ViewController.swift
//  ToDoListRealm
//
//  Created by Алексей Щукин on 03.04.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

// MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerConfiguration()
        topListOfTodoViewConfiguration()
        collectionViewConfiguration()
        makeDelegates()
        navigationBarConfiguration()
        addButtonConfiguration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.updateTodos()
        collectionView.reloadData()
    }
    
// MARK: - Private Proparties
    private let viewModel = MainModelView()
    
    private let collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private let topListOfTodoView : TopListOfTodoView = {
        let view = TopListOfTodoView()
        return view
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plus-circle"), for: .normal)
        button.addTarget(self, action: #selector(addTodo), for: .touchUpInside)
        button.setTitleShadowColor(.systemGray, for: .normal)
        button.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 4.0
        button.layer.cornerRadius = 4.0
        button.layer.masksToBounds = false
        return button
    }()
}

// MARK: - Delegates
extension ViewController{
    
    private func makeDelegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - View Configurations
extension ViewController{
    
    private func collectionViewConfiguration(){
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(topListOfTodoView.snp.bottom).offset(20)
            make.bottom.equalTo(view.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.showsVerticalScrollIndicator = false
    }
    
    private func viewControllerConfiguration(){
        view.backgroundColor = .white
    }
    
    private func navigationBarConfiguration(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIImageView(image: UIImage(named: "TO DO LIST")!))
        //navigationItem.rightBarButtonItem = UIBarButtonItem(customView: UIImageView(image: UIImage(named: "settings")!))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func topListOfTodoViewConfiguration(){
        view.addSubview(topListOfTodoView)
        topListOfTodoView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(16)
        }
    }
    
    private func addButtonConfiguration(){
        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.bottom.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(20)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.toDos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.configure(with: viewModel.toDos[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let toDoViewController = TodoViewController()
        toDoViewController.modalPresentationStyle = .fullScreen
        toDoViewController.configure(with: viewModel.toDos[indexPath.row])
        navigationController?.pushViewController(toDoViewController, animated: true)
    }
}

// MARK: - Button Targets
extension ViewController{
    
    @objc func addTodo(){
        let addTodoViewController = AddTodoViewController()
        addTodoViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(addTodoViewController, animated: true)
    }
}
