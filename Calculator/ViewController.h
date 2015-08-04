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
    
    float num1;
    float num2;
    float result;
    float *currentNum;  // Pointer to whether the number being entered is first or the second operand
    unichar currentOperator;    // Holds the currently selected operator
}

- (IBAction)digitTap:(UIButton *)sender;
- (IBAction)operatorTap:(UIButton *)sender;
- (float)calculate;
- (IBAction)clear;
- (IBAction)euqals;

@end

