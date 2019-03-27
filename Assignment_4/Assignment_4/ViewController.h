//
//  ViewController.h
//  Assignment_4
//
//  Created by aliasagar abadani on 3/19/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    bool operatorPressed;
    char op;
    NSString *equation;
    bool equalPressed;
    NSString *firstValue;
    NSString *secondValue;
    NSString *optr;
    NSString *outputString;
}
@property (weak, nonatomic) IBOutlet UILabel *labelOutput;
- (IBAction)clearLabelOutput:(id)sender;
- (IBAction)addition:(id)sender;
- (IBAction)substraction:(id)sender;
- (IBAction)multiplication:(id)sender;
- (IBAction)division:(id)sender;
- (IBAction)equal:(id)sender;

-(IBAction)dotPressed:(UIButton*)sender;
-(IBAction)numberPressed:(UIButton*)sender;

@end

