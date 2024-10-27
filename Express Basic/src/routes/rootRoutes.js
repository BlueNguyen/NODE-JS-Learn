import express from "express";
import userRoutes from "./userRoutes.js";

// define object rootRoutes
const rootRoutes = express.Router();

//import userRoutes
rootRoutes.use("/user", userRoutes);

export default rootRoutes;