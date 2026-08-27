library(keras)

# Load Fashion MNIST
data <- dataset_fashion_mnist()

x_train <- data$train$x / 255
y_train <- data$train$y
x_test  <- data$test$x / 255
y_test  <- data$test$y

# Add channel dimension
x_train <- array(x_train, c(dim(x_train), 1))
x_test  <- array(x_test, c(dim(x_test), 1))

# Six-layer CNN
model <- keras_model_sequential() |>
  layer_conv_2d(32, c(3,3), activation="relu",
                input_shape=c(28,28,1)) |>
  layer_max_pooling_2d(c(2,2)) |>
  layer_conv_2d(64, c(3,3), activation="relu") |>
  layer_max_pooling_2d(c(2,2)) |>
  layer_flatten() |>
  layer_dense(10, activation="softmax")

model |> compile(
  optimizer="adam",
  loss="sparse_categorical_crossentropy",
  metrics="accuracy"
)

model |> fit(x_train, y_train, epochs=5, validation_split=0.1)

# Predict two images
pred <- model |> predict(x_test[1:2,,,])
print(apply(pred, 1, which.max) - 1)
print(y_test[1:2])