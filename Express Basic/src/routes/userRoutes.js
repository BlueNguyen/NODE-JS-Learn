import express from "express";
import { createUser, getUserDB, getUsers } from "../controllers/userController.js";

const userRoutes= express.Router();

// define API get list users
// userRoutes.get("/get-users", (req, res) => {
//   res.status(200).json({message: "get-users"});
// }
// )

// userRoutes.post("/create-user", (req, res) => {
//   let body = req.body;
//   res.send(body);
// });

//define API get list users
userRoutes.get("/get-users", getUsers);
userRoutes.post("/create-user", createUser);
userRoutes.get("/get-user-db", getUserDB);



export default userRoutes;