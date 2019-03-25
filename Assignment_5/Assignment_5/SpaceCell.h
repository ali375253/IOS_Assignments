//
//  SpaceCell.h
//  Assignment_5
//
//  Created by aliasagar abadani on 3/20/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpaceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *img;

@property (weak, nonatomic) IBOutlet UILabel *labelCountryName;
@property (weak, nonatomic) IBOutlet UILabel *labelPhoneCode;
@property (weak, nonatomic) IBOutlet UILabel *labelINR;


@end
