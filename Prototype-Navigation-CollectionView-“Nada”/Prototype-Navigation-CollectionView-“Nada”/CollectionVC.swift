//
//  CollectionVC.swift
//  prototype-Navigation-colloction"BushraO-Shrooq"
//
//  Created by Bushra alatwi on 25/04/1443 AH.
//

import UIKit

//private let reuseIdentifier = "LabelCell"
private let reuseIdentifier = String(describing: LabelCell.self)

class CollectionVC: UICollectionViewController {
 
    let items:[Item] = [
        
        Item(name: "Zero", description: "Description item zero"),
        Item(name: "One", description: "Description item one"),
        Item(name: "Two", description: "Description item two"),
        Item(name: "Three", description: "Description item three"),
        Item(name: "Four", description: "Description item four"),
        Item(name: "Five", description: "Description item five"),
        Item(name: "Six", description: "Description item six"),
        Item(name: "Seven", description: "Description item seven")
]

    var currentItem: Item?
    //var numberOfHorizontalCells
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        
        print("#file - #function")
        print(" - reuseIdetifier: \(reuseIdentifier)")
        
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        
        collectionView.register(nib,
                                forCellWithReuseIdentifier: reuseIdentifier)
        
        configureSize(numberOfHorizontalCells: 4 ,marginBetweenCells: 5)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        if let labelCell = cell as? LabelCell {
        labelCell.titelLabel.text = items[indexPath.row] .name
        }
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentItem = items[indexPath.row]
        performSegue(withIdentifier: "show_detail", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? DetailVC {
         
           destinationVC.item = currentItem
     }
}

}


extension CollectionVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            return layout.itemSize
        }else{
            
            //return CGsize (width: 0  haight: 0)
            return .zero
            
        }
        
        
    }
    private func configureSize(numberOfHorizontalCells: CGFloat,
                               marginBetweenCells: CGFloat){
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        else{
            return
        }
       
        print(" - numberOfHorizontalCells: \(numberOfHorizontalCells)")
        print("\n\n \(#file) - \(#function)")
        
        print(" - marginBetweenCells: \(marginBetweenCells)")
        
        
        // * Cell size *
        // let framewidth: CGFloat = 400
        let frameWidth = collectionView.frame.width
        print(" - frameWidth: \(frameWidth)")
        
        
        
        
        
        let totalMarginBetweenCells:CGFloat =
            marginBetweenCells * (numberOfHorizontalCells - 1)
        print(" - totalMarginBetweenCells: \(totalMarginBetweenCells)")
        
        let marginPerCell: CGFloat
            = totalMarginBetweenCells / numberOfHorizontalCells
        
        let cellWidth = frameWidth / numberOfHorizontalCells - marginPerCell
        print(" - cellWidth: \(cellWidth)")
        
        let cellHeight = cellWidth
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = marginPerCell
        
        // layout.estimatedItemSize = CGSize(width: 0, height: 0)
        layout.estimatedItemSize = .zero
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        
        print(" - layout.itemSize: \(layout.itemSize)")
    }
}
