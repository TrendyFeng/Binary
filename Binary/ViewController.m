//
//  ViewController.m
//  Binary
//
//  Created by C on 2020/4/14.
//  Copyright © 2020 TrendyFeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *resultlabel;
@property (weak, nonatomic) IBOutlet UITextField *text;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditChanged:)name:UITextFieldTextDidChangeNotification object:self.text];

}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self
                                                   name:UITextFieldTextDidChangeNotification
                                                 object:self.text];
}

-(void)textFiledEditChanged:(id)notification{
    self.resultlabel.text = [self binaryNumberStringFromIntegerNumber:[self.text.text intValue]];
}


- (NSString *)binaryNumberStringFromIntegerNumber:(NSUInteger )number{

    NSMutableString *resultStr = [NSMutableString string];
    if (number == 1 || number == 0) {
        return [NSString stringWithFormat:@"%ld",number];
    }
     //递归、拼接
    while (number/2) {
        NSUInteger singleNumber = number % 2;
        NSString *singleStr = [NSString stringWithFormat:@"%ld",singleNumber];
        [resultStr insertString:singleStr atIndex:0];
        number = number/2;
        if (number/2 == 0) {
            NSString *devStr = [NSString stringWithFormat:@"%ld",number];
            [resultStr insertString:devStr atIndex:0];
        }
    }
    return resultStr;
}

@end
