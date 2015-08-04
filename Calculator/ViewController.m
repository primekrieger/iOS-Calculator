//
//  ViewController.m
//  Calculator
//
//  Created by Diwakar Kamboj on 04/08/15.
//  Copyright (c) 2015 Nagarro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    currentNum = &num1; // Sets the pointer to point to first operand
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)digitTap:(UIButton *)sender
{
    *currentNum = (*currentNum * 10) + [[sender currentTitle] intValue];    // Updates input value in real time according to no. of times a digit is tapped
    
    if (currentNum == &num1)    // Operations for first operand
    {
        result = num1;
        inputLabel.text = [NSString stringWithFormat:@"%g", num1];
    }
    else    // Operations for second operand
    {
        result = [self calculate];
        inputLabel.text = [NSString stringWithFormat:@"%g%c%g", num1, currentOperator, num2];
    }
    
    resultLabel.text = [NSString stringWithFormat:@"%g", result];

}

- (IBAction)operatorTap:(UIButton *)sender
{
    
    currentOperator = [[sender currentTitle] characterAtIndex:0];   // Gets the value of operator tapped
    
    inputLabel.text = [NSString stringWithFormat:@"%g%c", result, currentOperator];

    num1 = result;  // Stores the result of operation in first operand
    
    if (currentNum == &num1)
        currentNum = &num2; // Set the current operand to second number
    else
        num2 = 0;   // Clears the value in second operand
    
}

- (float)calculate
{
    switch (currentOperator) {
        case '+':
            return num1 + num2;
            break;
            
        case '-':
            return num1 - num2;
            break;
            
        case '*':
            return num1 * num2;
            break;
            
        case '/':
            return num1 / num2;
            break;
            
        default:
            return 0;
    }
}

- (IBAction)clear
{
    num1 = num2 = result = 0;
    currentNum = &num1;
    resultLabel.text = @"0";
    inputLabel.text = @"0";
}

- (IBAction)euqals
{
    inputLabel.text = [NSString stringWithFormat:@"%g", result];
    resultLabel.text = @"Answer";
    num1 = num2 = 0;
    currentNum = &num1;
    
}

@end
