//
//  ViewController.h
//  Assignment_1
//
//  Created by aliasagar abadani on 3/15/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UITextField *textField;
    IBOutlet UIButton *showButton;
    IBOutlet UILabel *showLabel;
}
@property (weak, nonatomic) IBOutlet UILabel *showText;

- (IBAction)showTextOnLabel;
@end

