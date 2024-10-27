import connect from "../../db.js";

const getUsers = (req, res) => {
  res.status(200).json({ message: "get-users" });
};

const createUser = (req, res) => {
  let body = req.body;
  res.send(body);
};

const getUserDB = async (req, res) => {
  const [data] = await connect.query(`
    SELECT * from users`);
  res.send(data);
};

export {
    getUsers, 
    createUser,
    getUserDB

}