//
//  keyPhotoConfirmViewController.m
//  TraitWare
//
//  Created by Ruvato on 19/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import "keyPhotoConfirmViewController.h"
#import "ImageCollectionViewCell.h"
#import "PhotosClass.h"
#import "CommonMethods.h"
@interface keyPhotoConfirmViewController ()

@end

@implementation keyPhotoConfirmViewController

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
    
     appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];

    
    apiManager = [[WebServicesManager alloc] init];
    apiManager.delegate = self;
    [self.continueBtn setImage:[UIImage imageNamed:@"continueBtnDisable.png"] forState:UIControlStateDisabled];
    [self.continueBtn setImage:[UIImage imageNamed:@"continueBtnUnSelected.png"] forState:UIControlStateNormal];
    
    [self.resetBtn setImage:[UIImage imageNamed:@"reloadBtnUnSelected.png"] forState:UIControlStateDisabled];
    [self.resetBtn setImage:[UIImage imageNamed:@"reloadBtnSelected.png"] forState:UIControlStateHighlighted];
    
    NSString *lable = @"four";
    if([[[CommonMethods getValueFromUserDefaultForKey:@"photoAuthSettings"] objectForKey:@"keyLength"] intValue]==6)
    {
        lable = @"six";
    }
    else if([[[CommonMethods getValueFromUserDefaultForKey:@"photoAuthSettings"] objectForKey:@"keyLength"] intValue]==5)
    {
        lable = @"five";
    }
    self.detailLable.text = [NSString stringWithFormat:@"Please select %@ pictures, in the same order in which you just selected",lable];
    _tryNumber = 0;
    [self.continueBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    self.PicturesCollectionView.delegate = self;
    self.PicturesCollectionView.dataSource = self;
  
    photoKey = [[NSMutableArray alloc] init];
    self.PicturesCollectionView.allowsMultipleSelection = YES;
   [CommonMethods setUpPageController1:self.pageController size:0];

}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"Confirm Key Picture";
    self.navigationItem.hidesBackButton = YES;
    //[self.PicturesCollectionView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"SelectedPhotoView" ])
    {
        
        SelectedPhotosViewController *objSelectedPhoto = segue.destinationViewController;
        objSelectedPhoto.delegate = self;
        NSMutableArray *photosList = [[NSMutableArray alloc] init];
        for(NSString *photoId in photoKey)
        {
            
            for(PhotosClass *photo in self.objPhotosArray)
            {
                if([photo.photoUuid isEqualToString:photoId])
                {
                    [photosList addObject:photo.photo];
                }
            }
            
        }
        objSelectedPhoto.photos = photosList;
        
        
    }
}


#pragma mark UICollectionViewDelegates
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //return self.objPhotosArray.count;
    NSLog(@"photosonrim view  count = %i", [appDelegate.imagesArray count]);

    [appDelegate.imagesArray count];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return 1;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ImageCollectionViewCell *cell = (ImageCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSLog(@"indexPath.row: %i", indexPath.row);

    UIImage *curImage = [appDelegate.imagesArray objectAtIndex:indexPath.row];
    
    if(curImage == nil){
        NSLog(@"curimage == nil");
    }else{
        NSLog(@" curimage != nil");
    }
    cell.KeyImage.image = curImage;
//
//    UIImage * result;
//    NSString *urlString = [appDelegate.imagesLinks objectAtIndex:indexPath.row];
//    NSLog(@"urlString: %@", urlString);
//    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString: @"http://kcblastapp.com/getImage.php?img=upload/images/11-03%20Leather%20and%20Lace.jpg&type=thumb"]];
//    result = [UIImage imageWithData:data];
//    
//    if(data == nil){
//        NSLog(@"urlString: ni lni il");
//        
//    } else{
//        NSLog(@"urlString:  ono non ono n o");
//        
//    }
//    cell.KeyImage.image = result;
//    
    
//    ImageCollectionViewCell *cell = (ImageCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
//    PhotosClass *objPhoto = [self.objPhotosArray objectAtIndex:indexPath.row];
//    if(objPhoto.photo ==nil)
//    {
//        cell.KeyImage.image = [UIImage imageNamed:@"placeholder.png"];
//        NSMutableArray *data = [NSMutableArray arrayWithObjects:objPhoto,indexPath, nil];
//        [self performSelectorInBackground:@selector(loadImageInBackground:) withObject:data];
//    }
//    else
//    {
//        cell.KeyImage.image = objPhoto.photo;
//    }
//    cell.imageId = objPhoto.photoUuid;
//    cell.isSelected = NO;
//    cell.BadgeImage.image = nil;
//    if(photoKey.count > 0)
//    {
//        for (int i = 0; i<photoKey.count; i++) {
//            
//            if([[photoKey objectAtIndex:i] isEqualToString:objPhoto.photoUuid])
//            {
//                cell.isSelected = YES;
//                cell.BadgeImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"Image0%d.png",i+1]];
//            }
//            
//            
//        }
//        
//        
//    }

    return cell;
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    
   return UIEdgeInsetsMake(5, 10, 5, 10);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ImageCollectionViewCell *cell = (ImageCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    if(photoKey.count < [[[CommonMethods getValueFromUserDefaultForKey:@"photoAuthSettings"] objectForKey:@"keyLength"] intValue])
    {
        
        cell.isSelected = YES;
        [photoKey addObject:cell.imageId];
        cell.BadgeImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"Image0%d.png",photoKey.count]];
    }
    else
    {
        
        [self.PicturesCollectionView deselectItemAtIndexPath:indexPath animated:NO];
    }
    if(photoKey.count >=[[[CommonMethods getValueFromUserDefaultForKey:@"photoAuthSettings"] objectForKey:@"keyLength"] intValue])
    {
        NSLog(@"continueBtn.enabled");
        self.continueBtn.enabled = YES;
        
    }
    
    
    
    
    
}


-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.PicturesCollectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
}

#pragma mark scrollviewDelegates
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.PicturesCollectionView.frame.size.width;
    int page = lroundf(self.PicturesCollectionView.contentOffset.x / pageWidth);
    NSLog(@"currentPage:%d",page);
    self.pageController.currentPage = page;

}

#pragma mark HelpingMethods
-(BOOL)containKey:(NSString *)pId
{
    for(NSString *photoId in photoKey)
    {
        if([photoId isEqualToString:pId])
        {
            NSLog(@"photoId %@ key%@",photoId,pId);
            return YES;
        }
    }
    return NO;
}
#pragma mark Actions
- (IBAction)ResetSelection:(id)sender {
    
    [photoKey removeAllObjects];
    [self.PicturesCollectionView reloadData];
}
- (IBAction)ContinueAction:(id)sender
{
    NSLog(@"ContinueAction key confirm");
    _tryNumber++;
        for(NSString *photoId in photoKey)
        {
            
            for (int i=0; i<self.lastKey.count; i++) {
                
                //NSLog(@"for i = %i", i);
                if(![[photoKey objectAtIndex:i] isEqualToString:[self.lastKey objectAtIndex:i]])
                {
                    [CommonMethods showAlert:@"Message" message:@"PhotoAuth Mismatch - Try Again"];
                    NSLog(@"ContinueAction if");
                    if(_tryNumber == 3){
                    
                        
                        
                        //[self dismissViewControllerAnimated:NO completion:nil ];
                        [self.delegate callKeyControllView:YES];
                        [self.navigationController popToRootViewControllerAnimated:YES];
                        return;
                    } else{
                        NSLog(@"ContinueAction else");
                        self.continueBtn.enabled = NO;
                        [photoKey removeAllObjects];
                        [self.PicturesCollectionView reloadData];
                        return;
                        //break;
                    }
                }
                
            }
        }
    
    //[_secondPassArray insertObject:[NSString stringWithFormat:@"%i", buttonSelected.tag] atIndex: index];
    
  
            //[[PersistedDataManager sharedInstance] savePhotoAuthData:[self convertNSMutalbeArrayToNSData:_secondPassArray]];
    
    
    
    [CommonMethods setUserDefaultValue:self.lastKey forKey:@"photoAuthKey"];
    
    [self performSegueWithIdentifier:@"SelectedPhotoView" sender:self];
        
    
}
-(void)loadImageInBackground:(id)data
{
    [apiManager getPhotoAuthImage:[data objectAtIndex:0] forIndexPath:[data objectAtIndex:1]];
}
#pragma SelectedPhotoDelegate
-(void)callKeyConfirmViewController:(BOOL)type
{
    popView = YES;
    [self.delegate callKeyControllView:YES];
    //[self dismissViewControllerAnimated:NO completion:nil];
}
#pragma mark webServicesDelegate
-(void)imageLoaded:(UIImage *)image forIndexPath:(NSIndexPath *)indexPath response:(BOOL)response
{
    if(response)
    {
        ImageCollectionViewCell *cell = (ImageCollectionViewCell*)[self.PicturesCollectionView cellForItemAtIndexPath:indexPath];
        cell.KeyImage.image = image;
    }
}
@end
