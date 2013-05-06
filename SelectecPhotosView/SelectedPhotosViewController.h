//
//  SelectedPhotosViewController.h
//  TraitWare
//
//  Created by Ruvato on 15/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectedPhotosViewController;
@protocol SelectedPhotosViewControllerDelegate <NSObject>

-(void)callKeyConfirmViewController:(BOOL)type;

@end

@interface SelectedPhotosViewController : UIViewController
- (IBAction)HomeAction:(id)sender;
@property (strong, nonatomic) id<SelectedPhotosViewControllerDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;
@property (weak, nonatomic) IBOutlet UIButton *backHomeBtn;

@property (strong,nonatomic)NSMutableArray *photos;

@end
