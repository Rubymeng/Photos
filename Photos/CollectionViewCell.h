//
//  CollectionViewCell.h
//  Photos
//
//  Created by tyhmeng on 16/10/25.
//  Copyright © 2016年 tyhmeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (nonatomic,copy) NSString *imageName;
@property (nonatomic,strong) NSIndexPath *indexPath;


@end
