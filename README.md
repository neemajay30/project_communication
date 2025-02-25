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

## Enhancement Points
1. Maintain a change history for all project fields.
2. Use Hotwire to enable real-time conversations and status updates.
3. Allow editing and deletion of comments, with notifications for each action.
4. Implement user-wise authorization to control permissions.
5. Enforce validation rules for project state transitions.