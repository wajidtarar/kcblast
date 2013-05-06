//
//  SelectedPhotosViewController.m
//  TraitWare
//
//  Created by Ruvato on 15/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import "SelectedPhotosViewController.h"

@interface SelectedPhotosViewController ()

@end

@implementation SelectedPhotosViewController

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
    [self.backHomeBtn setImage:[UIImage imageNamed:@"backHomeBtnUnSelected.png"] forState:UIControlStateNormal];
    [self.backHomeBtn setImage:[UIImage imageNamed:@"backHomeBtnSelected.png"] forState:UIControlStateHighlighted];
	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    
    self.navigationItem.hidesBackButton = YES;
    self.image1.image = [self.photos objectAtIndex:0];
    self.image2.image = [self.photos objectAtIndex:1];
    self.image3.image = [self.photos objectAtIndex:2];
    self.image4.image = [self.photos objectAtIndex:3];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)HomeAction:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    //[[[self presentingViewController] presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    [self.delegate callKeyConfirmViewController:YES];
  
    
}
@end
