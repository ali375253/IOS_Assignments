//
//  ViewController.h
//  Assignment_6
//
//  Created by aliasagar abadani on 3/21/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    //NSMutableArray *employeesArray;
}
@property(strong,retain)NSMutableArray *employeesArray;
@property(strong,retain)NSMutableArray *empImageArray;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;



@end

