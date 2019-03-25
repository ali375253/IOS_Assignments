//
//  ViewController.m
//  Assignment_4
//
//  Created by aliasagar abadani on 3/19/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    operatorPressed=FALSE;
    firstValue=NULL;
    secondValue=NULL;
    outputString=NULL;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearLabelOutput:(id)sender {
    operatorPressed=FALSE;
    _labelOutput.text=@"0";
    firstValue=NULL;
    secondValue=NULL;
    outputString=NULL;
}

- (IBAction)addition:(id)sender {
    op='+';
    operatorPressed=TRUE;
    optr=@"+";
    if(outputString!=NULL){
        firstValue=outputString;
    }
    NSString *displayString=[NSString stringWithFormat:@"%@%@",firstValue,optr];
    _labelOutput.text=displayString;
}

- (IBAction)substraction:(id)sender {
    op='-';
    operatorPressed=TRUE;
    optr=@"-";
    if(outputString!=NULL){
        firstValue=outputString;
    }
    NSString *displayString=[NSString stringWithFormat:@"%@%@",firstValue,optr];
    _labelOutput.text=displayString;
}

- (IBAction)multiplication:(id)sender {
    op='*';
    operatorPressed=TRUE;
    optr=@"*";
    if(outputString!=NULL){
        firstValue=outputString;
    }
    NSString *displayString=[NSString stringWithFormat:@"%@%@",firstValue,optr];
    _labelOutput.text=displayString;
}

- (IBAction)division:(id)sender {
    op='/';
    operatorPressed=TRUE;
    optr=@"/";
    if(outputString!=NULL){
        firstValue=outputString;
    }
    NSString *displayString=[NSString stringWithFormat:@"%@%@",firstValue,optr];
    _labelOutput.text=displayString;
}

- (IBAction)equal:(id)sender {
    double output=0;
    switch (op) {
        case '+':
            output=[firstValue doubleValue] + [secondValue doubleValue];
            break;
        case '-':
            output=[firstValue doubleValue] - [secondValue doubleValue];
            break;
        case '*':
            output=[firstValue doubleValue] * [secondValue doubleValue];
            break;
        case '/':
            output=[firstValue doubleValue] / [secondValue doubleValue];
            break;
        default:
            break;
    }
    outputString=[NSString stringWithFormat:@"%f",output];
    _labelOutput.text=outputString;
    operatorPressed=FALSE;
    firstValue=NULL;
    secondValue=NULL;
}

-(IBAction)dotPressed:(UIButton*)sender{
    if(operatorPressed==FALSE){
        if(firstValue==NULL){
            outputString=NULL;
            firstValue=[NSString stringWithFormat:@"%s","0."];
            _labelOutput.text=firstValue;
        }
        else{
            firstValue=[NSString stringWithFormat:@"%@%s",firstValue,"."];
            _labelOutput.text=firstValue;
        }
    }
    else{
        if(secondValue==NULL){
            secondValue=[NSString stringWithFormat:@"%s","0."];
            NSString *displayString=[NSString stringWithFormat:@"%@%@%@",firstValue,optr,secondValue];
            _labelOutput.text=displayString;
        }
        else{
            secondValue=[NSString stringWithFormat:@"%@%s",secondValue,"."];
            NSString *displayString=[NSString stringWithFormat:@"%@%@%@",firstValue,optr,secondValue];
            _labelOutput.text=displayString;
        }
    }
}

-(IBAction)numberPressed:(UIButton*)sender{
    int tag=sender.tag;
    if(operatorPressed==FALSE){
        if(firstValue==NULL){
            outputString=NULL;
            firstValue=[NSString stringWithFormat:@"%i",tag];
            _labelOutput.text=firstValue;
        }
        else{
            firstValue=[NSString stringWithFormat:@"%@%i",firstValue,tag];
            _labelOutput.text=firstValue;
        }
    }
    else{
        if(secondValue==NULL){
            secondValue=[NSString stringWithFormat:@"%i",tag];
            NSString *displayString=[NSString stringWithFormat:@"%@%@%@",firstValue,optr,secondValue];
            _labelOutput.text=displayString;
        }
        else{
            secondValue=[NSString stringWithFormat:@"%@%i",secondValue,tag];
            NSString *displayString=[NSString stringWithFormat:@"%@%@%@",firstValue,optr,secondValue];
            _labelOutput.text=displayString;
        }
    }
}
@end
