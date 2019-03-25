//
//  ViewController_Signin.h
//  Assignment_2
//
//  Created by aliasagar abadani on 3/17/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController_SignUp : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *Male;
@property (weak, nonatomic) IBOutlet UIButton *Female;
- (IBAction)toggleMaleRadioButton:(UIButton *)sender;
- (IBAction)toggleFemaleRadioButton:(UIButton *)sender;
- (IBAction)OpenSignIn:(UIButton *)sender;


@end
