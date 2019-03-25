//
//  SpaceCell.m
//  Assignment_5
//
//  Created by aliasagar abadani on 3/20/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import "SpaceCell.h"

@implementation SpaceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void) updateCellWithCountryName:(NSString *)countryName countryCode:(NSString *)countryCode phoneCode:(NSString *)phoneCode inr:(NSString *)inr image:(NSString *)img{
    self.imageView.image=[UIImage imageNamed:img];
    NSString *country=[NSString stringWithFormat:@"%@%s%@%s",countryName," (",countryCode,")"];
    self.labelCountryName.text=country;
    self.labelPhoneCode.text=phoneCode;
    self.labelINR.text=inr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
