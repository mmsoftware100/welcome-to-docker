Certainly! Below is a simple example of a Dockerfile for a PHP application. This example assumes you have a basic PHP script (`index.php`) in the same directory as the Dockerfile:

1. **Create a file named `Dockerfile` with the following content:**

    ```Dockerfile
    # Use the official PHP image
    FROM php:7.4-apache

    # Set the working directory to /var/www/html
    WORKDIR /var/www/html

    # Copy the current directory contents into the container at /var/www/html
    COPY . /var/www/html

    # Expose port 80
    EXPOSE 80
    ```

2. **Create a simple `index.php` file in the same directory:**

    ```php
    <?php
    echo "Hello, Docker World!";
    ?>
    ```

3. **Build the Docker image:**

    Open a terminal in the directory containing both the `Dockerfile` and `index.php` and run the following command to build the Docker image:

    ```bash
    docker build -t my-php-app .
    ```

    This command builds the Docker image using the specified Dockerfile (`.` indicates the current directory) and tags it with the name `my-php-app`.

4. **Run the Docker container:**

    After the build is complete, you can run the Docker container:

    ```bash
    docker run -p 8080:80 my-php-app
    ```

    This command maps port 8080 on your local machine to port 80 in the Docker container.

5. **Access the PHP application:**

    Open your web browser and go to http://localhost:8080. You should see the output "Hello, Docker World!".

This is a basic example, and in a real-world scenario, you might need additional configurations and dependencies depending on your PHP application. The key components in the Dockerfile are setting up the Apache web server and copying the PHP files into the appropriate directory.