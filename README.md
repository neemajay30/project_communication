## Requirements
- **Ruby:** `3.4.2`
- **Rails:** `~> 8.0.1`
- **Node.js:** `18`
- **Database:** PostgreSQL

## Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/neemajay30/project_communication.git
   cd project_communication
   ```

2. **Install dependencies:**
   ```sh
   bundle install
   ```

3. **Install JavaScript dependencies:**
   ```sh
   yarn install
   ```

4. **Set up the database:**
   ```sh
   rails db:create db:migrate db:seed
   ```

## Run Application
```sh
bin/dev
```

Open `http://localhost:3000` in your browser.

Test User:
```
  email: 'testuser@gmail.com',
  password: "Test@123"
```

## Test
To run the test suite:
```sh
rspec
```