//
//  KeyPicturesViewController.h
//  TraitWare
//
//  Created by Ruvato on 15/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "keyPhotoConfirmViewController.h"
#import "WebServicesManager.h"


#import "AppDelegate.h"


@interface KeyPicturesViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,keyPhotoConfirmViewControllerDelegate,WebServicesManagerDelegate,UIScrollViewDelegate>
{
    NSMutableArray *objPhotosArray;
    NSMutableArray *photoKey;
    WebServicesManager *apiManager;
    
    AppDelegate *appDelegate;

    
}
- (IBAction)ResetSelection:(id)sender;
- (IBAction)ContinueAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *headerLable;
@property (weak, nonatomic) IBOutlet UILabel *detailLable;
@property (weak, nonatomic) IBOutlet UITextView *MsgTextView;
@property (weak, nonatomic) IBOutlet UICollectionView *PicturesCollectionView;
@property (weak, nonatomic) IBOutlet UIButton *continueBtn;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;

@property (weak, nonatomic) IBOutlet UIButton *resetBtn;

@end
