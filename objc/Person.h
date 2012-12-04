#import <Foundation/Foundation.h>

@interface Person : NSObject
{
        float heightInMetres;
        int weightInKilos;
}
@property float heightInMetres;
@property int weightInKilos;

- (float)bodyMassIndex;
@end
