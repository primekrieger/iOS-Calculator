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
    input = [[NSMutableString alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)digitTap:(UIButton *)sender
{
    *currentNum = (*currentNum * 10) + [[sender currentTitle] intValue];

        //[input appendString:[sender currentTitle]];    // Append the tapped button text to current string
    
    
    if (currentNum == &num2)
    {
        result = [self calculate];
        
        if (commitFlag) {
            [input appendFormat:@"%g%c", temp, currentOperator];
            commitFlag = 0;
        }
        
        
    }
    else
    {
        result = num1;
    }
    
    resultLabel.text = [NSString stringWithFormat:@"%g", result];
    
    inputLabel.text = [NSString stringWithFormat:@"%@%g", input, *currentNum];
}

- (IBAction)operatorTap:(UIButton *)sender
{
    
        currentOperator = [[sender currentTitle] characterAtIndex:0];
    
        inputLabel.text = [NSString stringWithFormat:@"%@%g%c", input, *currentNum, currentOperator];
        temp = *currentNum;
        if (currentNum == &num2)
        {
            num1 = result;
            num2 = 0;
            resultLabel.text = [NSString stringWithFormat:@"%g", num1];
        }
        else
        {
            currentNum = &num2;
        }
    
    commitFlag = 1;
    
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
            return -1;
    }
}

- (IBAction)clear
{
    num1 = 0;
    num2 = 0;
    currentNum = &num1;
    input = nil;
    resultLabel.text = @"0";
    inputLabel.text = @"0";
}
- (IBAction)euqals
{
    [self clear];
    inputLabel.text = [NSString stringWithFormat:@"%g", result];
    resultLabel.text = @"Answer";
}

@end
