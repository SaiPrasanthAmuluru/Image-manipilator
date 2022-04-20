#  Image Editing Task

The whole Code is seperated into 3 different pages
1. Main home page where there is a only upload button on click will display a dialog box to open pikc image from camera or from the photos
2. Editing page where the options to manioulate the image is provided. 
   a) Flip Horizontally
   b) Flip Vertically
   c) Rotate
   d) Crop

3) Crop image page where the image is cropped as needed.
   
   The crop page is handled seperately from other manipulations as it need a seperate view to implement the handling of crop
All the image manipulatio is done with Core Graphics.

For every manipulation the image bit map is changed and saved as per the manipultaion performed and it is saved into the device.

From crop page while coming back the Protocol named  "ImageCropDelegate" is used to send back the cropped image and is implemented in view will disappear.
After all is done the used is sent back to Home page with the upload image button.

No memory leaks were found when profiled using the Instruments.

Refrences followed for implememting the image manipulation

Rotate is from my native project.

Flipping image :-
https://stackoverflow.com/questions/52835045/how-to-flip-image-horizontally-to-save-flipped-in-photo-album

Crop image :-

https://developer.apple.com/documentation/coregraphics/cgimage/1454683-cropping

https://medium.com/@basselezzeddine/image-crop-view-in-ios-4125c0aafe4d
