#import "Person.h"

@implementation Person

@synthesize heightInMetres, weightInKilos;

- (float)bodyMassIndex
{
  float h = [self heightInMetres];
  return [self weightInKilos] / (h * h);
}
@end
