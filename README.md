# imageSensorModel

The objective of this project is to create a **functional model of an image sensor** (based on a photographic CCD sensor). It consists of a matrix of photoresistors, each one representing a pixel.
This was created only for **educationnal and demonstration purposes**, and is in no way designed to be used as a replacement for real photo sensor.

## Electronics:
All the electronics below are made for a 3*3 matrix, but you can easly increase the size and change the form factor (the matrix is not necessarily a square) by adjusting the xRes and yRes values in both scripts.
The electronics are based on an Arduino (I used the Uno but any with some analog inputs can be used). Here is the **electronic diagram of the model:**

<img src="https://raw.githubusercontent.com/nohehf/imageSensorModel/main/images/schema_bb.png" width="700" height="700" /> 
<img src="https://raw.githubusercontent.com/nohehf/imageSensorModel/main/images/schema.png" width="700" height="700" />

### Prototype build (9pixels, 3*3 image):
(The solderings are very poor but it works).

![First prototype build](https://raw.githubusercontent.com/nohehf/imageSensorModel/main/images/crappyPrototypeResized.jpg)
## Software:
The software is divided in two scripts: The **Arduino script** which reads the Analog values of each resistor in the matrix and send them in a particular format to the Serial port.
The **Processing script** then retrives the values via the Serial port (COM), map the values from 10bit to 8bit, and displays them on the screen. It also provides two sliders in order to adjust the contrast.

### Processing window:
![enter image description here](https://raw.githubusercontent.com/nohehf/imageSensorModel/main/images/softwareScreenshot.png)

