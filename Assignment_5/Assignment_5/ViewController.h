//
//  ViewController.h
//  Assignment_5
//
//  Created by aliasagar abadani on 3/20/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpaceCell.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@end

