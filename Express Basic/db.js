// tạo object để kết nối tới database
import mysql from "mysql2/promise";
import dotenv from "dotenv";

//load biến môi trường từ file .env
dotenv.config();

const connect = mysql.createPool({
    host: process.env.DB_HOST,   //"localhost"
    user: process.env.DB_USER, //"root"
    password: process.env.DB_PASS, //"123456"
    database: process.env.DB_DATABASE, //"node47"
    port: process.env.DB_PORT, //3307
});

export default connect;