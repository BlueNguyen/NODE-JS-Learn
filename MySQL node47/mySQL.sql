# Tạo Database 
CREATE DATABASE node47
USE node47

# Tạo table users
CREATE TABLE users(
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    age INT,
    pass_word VARCHAR(255)
)

-- Insert 5 users into the users table
INSERT INTO users (full_name, email, pass_word) VALUES
('John Doe', 'john.doe@example.com', 'password123'),
('Jane Smith', 'jane.smith@example.com', 'password123'),
('Emily Davis', 'emily.davis@example.com', 'password123'),
('David Brown', 'david.brown@example.com', 'password123'),
('Charlotte Wright', 'charlotte.wright@example.com', 'password123')

# Viết câu query để get Data
SELECT * FROM users
SELECT full_name AS 'Họ tên', email FROM users


-- Insert 20 users into the users table
INSERT INTO users (full_name, email, age, password) VALUES
('John Doe', 'john.doe@example.com', 28, 'password123'),
('Jane Smith', 'jane.smith@example.com', 32, 'qwerty2023'),
('Robert Brown', 'robert.brown@example.com', 40, 'securePass456'),
('Emily Davis', 'emily.davis@example.com', 22, 'helloWorld789'),
('Michael Wilson', 'michael.wilson@example.com', 35, 'strongPassword321'),
('Sarah Taylor', 'sarah.taylor@example.com', 29, 'letmein098'),
('David Anderson', 'david.anderson@example.com', 45, 'pass4word007'),
('Linda Johnson', 'linda.johnson@example.com', 26, 'adminPass123'),
('James Thomas', 'james.thomas@example.com', 38, 'testPass567'),
('Patricia Jackson', 'patricia.jackson@example.com', 24, 'mySecret678'),
('Christopher White', 'christopher.white@example.com', 36, 'hiddenPass111'),
('Barbara Harris', 'barbara.harris@example.com', 31, 'trustMe333'),
('Daniel Martin', 'daniel.martin@example.com', 27, 'enter123456'),
('Jessica Moore', 'jessica.moore@example.com', 30, 'accessDenied444'),
('Matthew Thompson', 'matthew.thompson@example.com', 42, 'changeMe555'),
('Elizabeth Garcia', 'elizabeth.garcia@example.com', 33, 'newPassword666'),
('Anthony Martinez', 'anthony.martinez@example.com', 25, 'adminControl777'),
('Nancy Robinson', 'nancy.robinson@example.com', 37, 'unlockMe888'),
('Mark Lewis', 'mark.lewis@example.com', 39, 'loginKey999'),
('Susan Lee', 'susan.lee@example.com', 34, 'myPassword000');


SELECT * FROM users
SELECT full_name AS 'Họ tên', email FROM users

SELECT * FROM users
WHERE 20 <= age and age <= 30
ORDER BY age ASC 

SELECT * FROM users
WHERE age BETWEEN 20 AND 30
ORDER BY age DESC 
LIMIT 5

# liệt kê những người có tuổi lớn nhất
#B1: Tìm số tuổi cao nhất
SELECT * FROM users
ORDER BY age DESC
LIMIT 1
#B2: Liệt kê những người có số tuổi cao nhất đó
SELECT * FROM users
WHERE age=45

# HOẶC CÁCH KHÁC 
SELECT * FROM users
WHERE age = (
          select age from users
          order by age desc
          limit 1
)

# HOẶC CÁCH KHÁC
SELECT * FROM users
WHERE age = (
      select MAX(age) from users
)

# thêm 2 column address với phone cho table
alter table users
add column address VARCHAR(255),
add column phone VARCHAR(15)

# thay đổi kiểu dữ liệu cho column 
alter table users
modify address VARCHAR(100)

# update table 
UPDATE users
SET full_name = 'Jonathan Doe', age = 29
WHERE email = 'susan@example.com';

# thêm ràng buộc (constraint) cho column
alter table users

# tìm những người có họ John trong danh sách
SELECT * FROM users
where full_name like '%John%'

# lấy đúng mỗi tên 1 lần kg trùng
SELECT DISTINCT full_name from users

# đếm có bao nhiêu users trong table
SELECT COUNT(*) from users

# khoá chính (primary key)
# auto tăng STT
ALTER TABLE users
add COLUMN user_id INT AUTO_INCREMENT PRIMARY KEY

# Xoá data : soft delete và hard delete
DELETE from users
where user_id = 3

APP FOOD 
# hiển thị user_name, tên món ăn của order với user_id=5
SELECT * FROM orders o
INNER join users u on o.user_id= u.user_id
INNER join foods f on f.food_id= o.food_id
WHERE o.user_id=5

# table sau keyword FROM là table bên trái
# table sau keyword JOIN là table bên phải