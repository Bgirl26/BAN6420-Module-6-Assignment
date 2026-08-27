# BAN6420-Module-6-Assignment
# GUIDE ON HOW THIS CODE WORKS IN PYTHON
Import the necessary libraries: The libraries imported will handle the following
Fashion MNIST dataset contains 70,000 grayscale images of clothing and fashion items. Each image has a size of 28 × 28 pixels and belongs to one of 10 categories.
The CNN learns visual patterns from the training images and uses those patterns to predict the class of previously unseen test images.

The main purpose of this assignment is to:
•	Load the Fashion MNIST dataset using Keras.
•	Normalize the image pixel values.
•	Reshape the images to make them suitable for a CNN.
•	Build a six-layer CNN using Keras.
•	Compile the model using the Adam optimizer.
•	Train the model for five epochs.
•	Evaluate the model using test data.
•	Make predictions for at least two test images.
•	Compare the predicted classes with their actual classes.


Step 1: 
In this step, I first imported the necessary libaries
Import TensorFlow and Keras
import tensorflow as tf
from tensorflow.keras import layers, models
TensorFlow provides the machine learning framework, while Keras provides a high-level interface for creating the neural network.
The layers module provides CNN layers such as:
•	Conv2D
•	MaxPooling2D
•	Flatten
•	Dense
The models module is used to create the neural network model.

Step 2:
In this step, the MNIST Dataset is loaded and split into training and test datasets.
Load the Fashion MNIST Dataset
(x_train, y_train), (x_test, y_test) = tf.keras.datasets.fashion_mnist.load_data()
This downloads and loads the dataset.
The data is divided into:
•	x_train – training images
•	y_train – training labels
•	x_test – testing images
•	y_test – testing labels
The model uses the training data to learn and the test data to evaluate how well it performs on unseen images.

Step3. 
In this step, the data is standardized to ensure that the training and test datasets are split in a way that minimizes error, enabling accurate image generation.
Normalize the Images
x_train, x_test = x_train/255.0, x_test/255.0
Image pixels originally have values between 0 and 255.
Dividing by 255 changes the values to a range between 0 and 1.
For example:
0   → 0.0
128 → 0.502
255 → 1.0
Normalization helps the neural network train more efficiently and can improve numerical stability.

Step 4:
Reshape the Images
x_train = x_train[..., None]
x_test = x_test[..., None]
The original images have the shape:
28 × 28
A CNN expects an additional channel dimension.
Therefore, the images become:
28 × 28 × 1
The 1 represents the single grayscale channel.

CNN Architecture
This assignment describes this, as a six-layer CNN because six main layers are explicitly defined.
Layer 1: Convolutional Layer
layers.Conv2D(32, (3,3), activation='relu', input_shape=(28,28,1))
This layer applies 32 filters, each with a size of 3 × 3, to the input images.
The convolution operation identifies useful visual patterns such as:
•	Edges
•	Shapes
•	Textures
•	Simple object features
The ReLU (Rectified Linear Unit) activation function introduces non-linearity.

Layer 2: Max Pooling
layers.MaxPooling2D((2,2))
Max pooling reduces the spatial size of the feature maps.
A 2 × 2 pooling window is used to retain the most important feature from each region.
Benefits include:
•	Reducing computation
•	Reducing the number of parameters
•	Helping the model focus on important features

Layer 3: Second Convolutional Layer
layers.Conv2D(64, (3,3), activation='relu')
The second convolutional layer uses 64 filters.
It can learn more complex features from the patterns identified by the first convolutional layer.
For example, the first layer may detect simple edges, while later layers can combine these features to recognize more complex shapes.

Layer 4: Second Max Pooling Layer
layers.MaxPooling2D((2,2))
This layer again reduces the spatial dimensions of the feature maps.
It helps make the network more computationally efficient while retaining important information.

Layer 5: Flatten Layer
layers.Flatten()
The convolutional layers produce multidimensional feature maps.
Flatten() converts these feature maps into a one-dimensional vector.
This allows the extracted features to be passed to the final classification layer.

Layer 6: Dense Output Layer
layers.Dense(10, activation='softmax')
The output layer contains 10 neurons, one for each Fashion MNIST class.
The softmax activation converts the outputs into probabilities.
For example, a prediction could look conceptually like:
T-shirt/top:  0.02
Trouser:      0.01
Pullover:     0.05
Dress:        0.03
Coat:         0.04
Sandal:       0.01
Shirt:        0.10
Sneaker:      0.02
Bag:          0.03
Ankle boot:   0.69
The class with the highest probability becomes the predicted class.

# GUIDE ON HOW THIS CODE WORKS ON R
Assignment Guide: This project uses R and Keras to build a six-layer Convolutional Neural Network (CNN) for classifying images from the Fashion MNIST dataset.
The model is trained to recognize 10 different categories of fashion items, such as shirts, shoes, trousers, and bags.
Requirements:
Install R and the required Keras package:
install.packages("keras")
library(keras)
You also need a working TensorFlow/Keras backend.
Dataset
The Fashion MNIST dataset contains:
•	60,000 training images
•	10,000 test images
•	Image size: 28 × 28 pixels
•	10 clothing categories
•	Grayscale images
The images are normalized by dividing pixel values by 255.
CNN Architecture
The model contains six main layers:
•	Convolutional layer – 32 filters
•	Max-pooling layer
•	Convolutional layer – 64 filters
•	Max-pooling layer
•	Flatten layer
•	Dense output layer – 10 classes
The ReLU activation function is used in the convolutional layers, while Softmax is used for classification.
Model Training
The model is compiled using:
•	Optimizer: Adam
•	Loss: Sparse Categorical Crossentropy
•	Metric: Accuracy
•	Epochs: 5
•	Validation split: 10%
Prediction
After training, the model predicts the classes of the first two test images.
pred <- model |> predict(x_test[1:2,,,])

print(apply(pred, 1, which.max) - 1)
print(y_test[1:2])
The first output represents the model's predicted classes, while the second output represents the actual classes.
Expected Result
The predictions should be integer labels from 0 to 9. Comparing the predicted labels with the actual labels shows whether the CNN correctly classified the two images.
How to Run
•	Open the R script in RStudio.
•	Install and load Keras.
•	Ensure the TensorFlow backend is configured.
•	Run the script.
•	Wait for the CNN to train for five epochs.
•	View the predicted and actual labels for the two test images.
Conclusion
The project demonstrates how Convolutional Neural Networks can be implemented in R using Keras for image classification. The same approach can later be adapted to classify other types of images, including user profile images, provided an appropriate labeled dataset is available.



