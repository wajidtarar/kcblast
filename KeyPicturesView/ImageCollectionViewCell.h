//
//  ImageCollectionViewCell.h
//  TraitWare
//
//  Created by Ruvato on 19/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *BadgeImage;
@property (weak, nonatomic) IBOutlet UIImageView *KeyImage;
@property (strong, nonatomic)NSString *imageId;
@property (assign, nonatomic)Boolean isSelected;
@end
