//
//  mycell.h
//  Assignment_6
//
//  Created by aliasagar abadani on 3/22/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mycell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *employeeIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *positionLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
