//
//  testViewController.m
//  TraitWare
//
//  Created by Waqar on 5/2/13.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    toggle = NO;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testAction:(id)sender {
    

    NSLog(@"checkButtonAction title = %@", self.testButton.titleLabel.text);
    self.testButton.titleLabel.text = @"abc";
    NSLog(@"checkButtonAction title = %@", self.testButton.titleLabel.text);

    
   // [self.testButton setTitle:@"abcsdkj" forState:UIControlStateNormal];
    if(toggle == NO){
        
        [self.testButton setImage:[UIImage imageNamed:@"uicheckbox_checked@2x.png"] forState:UIControlStateNormal];
        toggle = YES;
    } else{
        [self.testButton setImage:[UIImage imageNamed:@"uicheckbox_unchecked@2x.png"] forState:UIControlStateNormal];

        toggle = NO;

    }
}
@end
