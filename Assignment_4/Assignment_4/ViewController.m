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
    equation=NULL;
    equalPressed=FALSE;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearLabelOutput:(id)sender {
    _labelOutput.text=@"0";
    equation=NULL;
    equalPressed=FALSE;
}

- (IBAction)addition:(id)sender {
    if(equation==NULL){
        equation=[NSString stringWithFormat:@"%s","0+"];
        _labelOutput.text=equation;
    }
    else{
        if([equation hasSuffix:@"+"] || [equation hasSuffix:@"-"] || [equation hasSuffix:@"*"] || [equation hasSuffix:@"/"]){
            equation = [equation substringToIndex:[equation length] - 1];
        }
        equation=[NSString stringWithFormat:@"%@%s",equation,"+"];
        _labelOutput.text=equation;
        equalPressed=FALSE;
    }
}

- (IBAction)substraction:(id)sender {
    if(equation==NULL){
        equation=[NSString stringWithFormat:@"%s","0-"];
        _labelOutput.text=equation;
    }
    else{
        if([equation hasSuffix:@"+"] || [equation hasSuffix:@"-"] || [equation hasSuffix:@"*"] || [equation hasSuffix:@"/"]){
            equation = [equation substringToIndex:[equation length] - 1];
        }
        equation=[NSString stringWithFormat:@"%@%s",equation,"-"];
        _labelOutput.text=equation;
        equalPressed=FALSE;
    }
}

- (IBAction)multiplication:(id)sender {
    if(equation==NULL){
        equation=[NSString stringWithFormat:@"%s","0*"];
        _labelOutput.text=equation;
    }
    else{
        if([equation hasSuffix:@"+"] || [equation hasSuffix:@"-"] || [equation hasSuffix:@"*"] || [equation hasSuffix:@"/"]){
            equation = [equation substringToIndex:[equation length] - 1];
        }
        equation=[NSString stringWithFormat:@"%@%s",equation,"*"];
        _labelOutput.text=equation;
        equalPressed=FALSE;
    }
}

- (IBAction)division:(id)sender {
    if(equation==NULL){
        equation=[NSString stringWithFormat:@"%s","0/"];
        _labelOutput.text=equation;
    }
    else{
        if([equation hasSuffix:@"+"] || [equation hasSuffix:@"-"] || [equation hasSuffix:@"*"] || [equation hasSuffix:@"/"]){
            equation = [equation substringToIndex:[equation length] - 1];
        }
        equation=[NSString stringWithFormat:@"%@%s",equation,"/"];
        _labelOutput.text=equation;
        equalPressed=FALSE;
    }
}

- (IBAction)equal:(id)sender {
    if(equation != NULL){
        NSExpression *expr=[NSExpression expressionWithFormat:equation];
        NSNumber *output=[expr expressionValueWithObject:nil context:nil];
        NSString *outputStr=[output stringValue];
        _labelOutput.text=outputStr;
        equation=outputStr;
        equalPressed=TRUE;
    }

}

-(IBAction)dotPressed:(UIButton*)sender{
    if(equation==NULL || (equation != NULL && equalPressed==TRUE)){
        equation=[NSString stringWithFormat:@"%s","0."];
        _labelOutput.text=equation;
        equalPressed=FALSE;
    }
    else{
        if([equation hasSuffix:@"."]){
            
        }
        else{
            equation=[NSString stringWithFormat:@"%@%s",equation,"."];
            _labelOutput.text=equation;
        }
        
    }
}

-(IBAction)numberPressed:(UIButton*)sender{
    int tag=sender.tag;
    if(equation==NULL || (equation != NULL && equalPressed==TRUE)){
        equation=[NSString stringWithFormat:@"%i",tag];
        _labelOutput.text=equation;
        equalPressed=FALSE;
    }
    else{
        equation=[NSString stringWithFormat:@"%@%i",equation,tag];
        _labelOutput.text=equation;
    }
}
@end
