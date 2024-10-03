<a name="readme-top"></a>

# POKEDEX APP

<br />

Welcome to the Pokedex App, a dynamic web application designed for Pokemon trainers! This app allows trainers to explore a comprehensive database of Pokemon and catch their favorites.

Table of Contents:

<ol>
  <li><a href="#features">Features</a></li>
  <li><a href="#demo">Demo</a></li>
  <li>
    <a href="#getting-started">Getting Started</a>
    <ul>
      <li><a href="#option-1">Option 1: Using Docker</a></li>
      <li><a href="#option-2">Option 2: Local Installation</a></li>
    </ul>
  </li>
  <li><a href="#running-tests">Running Tests</a></li>
</ol>

## Features <a name="features"></a>

* *Search Functionality:* Trainers can easily search for Pokemon by name or type, making it simple to find their desired creatures.
* *Catch Pokemon:* Users can catch Pokemon and add them to their personal collection with a friendly alias for each catch.
* *User Authentication:* Secure registration and login process to keep user data safe.
* *User-Friendly Interface:* Intuitive design for a seamless experience while exploring the world of Pokemon.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Demo <a name="demo"></a>

<b>Admin flow:</b>

```sh
email: admin@pokedex.com
password: 123123
```

https://github.com/user-attachments/assets/28934144-fe3b-43a0-b763-ddee12790541

<b>Trainer flow:</b>

https://github.com/user-attachments/assets/e31e6f73-9ee1-4991-b778-e65cfabbf9bb

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started <a name="getting-started"></a>

You can set up and run this application using Docker and Docker Compose or by installing the necessary dependencies on your local machine. Choose the setup that best suits your environment.

### Option 1: Using Docker <a name="option-1"></a>

This method requires Docker and Docker Compose to be installed on your system.

1. Clone the repository:

```sh
git clone https://github.com/gabo1359/RAVN-RailsChallenge-V1
cd RAVN-RailsChallenge-V1
```

2. Build and run the application with Docker Compose:
 
```sh
docker compose up --build
```

This command builds the Docker image if it's not already built and starts the containers defined in your `docker-compose.yml` file.

3. Initial setup

Before you can use the application, you'll need to set up and prepare the database. This can be done by accessing the bash shell of your web application container:

```sh
docker compose exec web bash
```

Once inside the container, run:

```sh
bin/setup
```

This command is a way to set up or update your development environment automatically, checking for dependencies and preparing the database.

Your app should now be fully set up and accessible at `http://localhost:3000`.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Option 2: Local Installation  <a name="option-2"></a>

This method requires Ruby, Rails, and SQLite to be installed on your local machine.

Prerequisites:
* Ruby 3.3.5
* Rails 7.2.1
* SQLite

1. Clone the repository:

```sh
git clone https://github.com/gabo1359/RAVN-RailsChallenge-V1
cd RAVN-RailsChallenge-V1
```

2. Install dependencies:

```sh
bundle install
```

3. Setup the database:

```sh
rails db:prepare
```

4. Run the application:

```sh
bin/dev
```

Visit `http://localhost:3000` in your browser to view the app.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Running Tests <a name="running-tests"></a>

To run tests, navigate to the root of your project directory and execute:

```sh
bundle exec rails test
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

