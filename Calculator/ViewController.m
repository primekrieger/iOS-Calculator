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
    //input = [[NSMutableString alloc] init];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)digitTap:(UIButton *)sender
{
    if (!input)    // Check whether the NSMutableString to be set as label text has been initialized or not
    {
        input = [[NSMutableString alloc] initWithString:[sender currentTitle]];    // Initialize the string with the tapped button text
        inputLabel.textAlignment = NSTextAlignmentRight;    // Set text alignment to left
    }
    
    else
    {
        [input appendString:[sender currentTitle]];    // Append the tapped button text to current string
    }
    
    inputLabel.text = input;
    
    *currentNum = (*currentNum * 10) + [[sender currentTitle] intValue];
    
    if (currentNum == &num2)
    {
        result = [self calculate];
        resultLabel.text = [NSString stringWithFormat:@"%g", result];
    }
    
    operatorAppendFlag = 1;
}

- (IBAction)operatorTap:(UIButton *)sender
{
    currentOperator = [[sender currentTitle] characterAtIndex:0];
    
    if (operatorAppendFlag) {
        [input appendString:[sender currentTitle]];
        inputLabel.text = input;
        operatorAppendFlag = 0;
    }
    
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

@end
