Image Progress Bar
================

create your custom progress bar using only few images.

Some exemples you can create:
![progress bar exemples](https://raw.github.com/martin-magakian/ImageProgressBar/master/exemples.png)


How to use
================

1 - Create progress images
---------
You need to create a minimum of two pictures.

The First one:
![progress bar empty](https://raw.github.com/martin-magakian/ImageProgressBar/master/ImageProgressBar/Images/avancement_bar_0@2x.png)

The second on:
![progress bar feeding](https://raw.github.com/martin-magakian/ImageProgressBar/master/ImageProgressBar/Images/avancement_bar_99@2x.png)

If you want you can change the last displayed image:
![progress bar full](https://raw.github.com/martin-magakian/ImageProgressBar/master/ImageProgressBar/Images/avancement_bar_100@2x.png)


2 - Inherit from ImageProgressBar
---------

Create a class "LinearProgressBar" who inherit from "ImageProgressBar"

	@interface LinearProgressBar : ImageProgressBar
	@end


Set the correct image resource name:
	@implementation LinearProgressBar
	
	-(void) createEmptyFeedAndFull{
		empty = [[ImageResizer alloc] initWithImage:[UIImage imageNamed:@"avancement_bar_0.png"] progressType:progressTypeRightToLeft];
		feed = [[ImageResizer alloc] initWithImage:[UIImage imageNamed:@"avancement_bar_99.png"] progressType:progressTypeLeftToRight];
		full = [[ImageResizer alloc] initWithImage:[UIImage imageNamed:@"avancement_bar_100.png"] progressType:progressTypeLeftToRight];
	}
	
	@end


progressType will ask for a progress bar who will be filled up from left to right.
You can also choose from bottom to top.


3 - Easy to use
---------

	LinearProgressBar *linear = [[[LinearProgressBar alloc] init] autorelease];
	[linear setProgress:60];
	[self.view addSubview:linear];

Contact
=========
Developed by Martin Magakian
dev.martin.magakian@gmail.com


License
=========
MIT License (MIT)
