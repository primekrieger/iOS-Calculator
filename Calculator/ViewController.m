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
    currentNum = &num1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)digitTap:(UIButton *)sender
{
    *currentNum = (*currentNum * 10) + [[sender currentTitle] intValue];
    
    if (currentNum == &num1)
    {
        result = num1;
        inputLabel.text = [NSString stringWithFormat:@"%g", num1];
    }
    else
    {
        result = [self calculate];
        inputLabel.text = [NSString stringWithFormat:@"%g%c%g", num1, currentOperator, num2];
    }
    
    resultLabel.text = [NSString stringWithFormat:@"%g", result];
    
    
    

}

- (IBAction)operatorTap:(UIButton *)sender
{
    
    currentOperator = [[sender currentTitle] characterAtIndex:0];
    
    inputLabel.text = [NSString stringWithFormat:@"%g%c", result, currentOperator];

    num1 = result;
    
    if (currentNum == &num1)
        currentNum = &num2;
    else
        num2 = 0;
    
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
