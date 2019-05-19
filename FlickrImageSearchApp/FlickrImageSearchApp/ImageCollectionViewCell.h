//
//  ImageCollectionViewCell.h
//  FlickrImageSearchApp
//
//  Created by Raunak Talwar on 19/05/19.
//  Copyright © 2019 Raunak Talwar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic, strong) ImageModel *viewModel;
@end

NS_ASSUME_NONNULL_END
