//
//  ViewController.h
//  Calculator
//
//  Created by Diwakar Kamboj on 04/08/15.
//  Copyright (c) 2015 Nagarro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    IBOutlet UILabel *inputLabel;
    IBOutlet UILabel *resultLabel;
    
    NSMutableString *input;
    float num1;
    float num2;
    float temp;
    float result;
    float *currentNum;
    int commitFlag;
    unichar currentOperator;
}

- (IBAction)digitTap:(UIButton *)sender;
- (IBAction)operatorTap:(UIButton *)sender;
- (float)calculate;
- (IBAction)clear;
- (IBAction)euqals;

@end

