//
//  ImageCollectionHeaderView.h
//  FlickrImageSearchApp
//
//  Created by Raunak Talwar on 19/05/19.
//  Copyright © 2019 Raunak Talwar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageCollectionHeaderViewDelegate <NSObject>
    -(void)searchImagesWithText:(NSString *)searchText;
@end

@interface ImageCollectionHeaderView : UICollectionReusableView<UISearchBarDelegate>
    @property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
    @property (weak, nonatomic) id<ImageCollectionHeaderViewDelegate> delegate;
@end

