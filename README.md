# imageSensorModel

The objective of this project is to create a **functional model of an image sensor** (based on a photographic CCD sensor). It consists of a matrix of photoresistors, each one representing a pixel.
This was created only for **educationnal and demonstration purposes**, and is in no way designed to be used as a replacement for real photo sensor.

## Electronics:
The electronics are based on an Arduino (I used the Uno but any with some analog inputs can be used). Here is the **electronic diagram of the model:**

**TO DO**

### My prototype build (9pixels, 3*3 image):
(The solderings are very poor but it works).
![First prototype build](https://raw.githubusercontent.com/nohehf/imageSensorModel/main/images/crappyPrototype.jpg)
## Software:
The software is divided in two scripts: The **Arduino script** which reads the Analog values of each resistor in the matrix and send them in a particular format to the Serial port.
The **Processing script** then retrives the values via the Serial port (COM), map the values from 10bit to 8bit, and displays them on the screen. It also provides two sliders in order to adjust the contrast.

### Processing window:
![enter image description here](https://raw.githubusercontent.com/nohehf/imageSensorModel/main/images/softwareScreenshot.png)

