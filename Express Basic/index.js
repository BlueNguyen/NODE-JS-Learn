import express from "express";
import connect from "./db.js";
import rootRoutes from "./src/routes/rootRoutes.js";

//tạo object tổng của express
const app = express();

// thêm middlware để convert string về json với api POST và PUT
app.use(express.json());

// import rootRoutes vào index.js
app.use(rootRoutes);

// viết API hello world
//get (url, function)
app.get("/hello-world", (req, res) => {
  res.send("hello world");
});

app.get("/backend-node", (req, res) => {
  res.send("hello BE node");
});

// lấy thông tin user thì params, query string, headers, body
// http://localhost:8080/get-user/1
// define API get-user
app.get("/get-user/:id/:hoTen", (req, res) => {
  // lấy id từ url
  let { id, hoTen } = req.params;
  let { queryString } = req.query;
  let { token, authorization } = req.headers;
  let headers = req.headers;
  res.send({ id, hoTen, queryString, token, authorization, headers });
});

// lấy body từ API POST (create) & PUT (update)     (GET & DELETE KHÔNG CÓ Body)
// app.post("/create-user", (req, res) => {
//   let body = req.body;
//   res.send(body);
// });

// app.get("/get-user-db", async (req, res) => {
//   const [data] = await connect.query(`
//     SELECT * from users`);
//   res.send(data);
// });

app.post("/create-user-db", async (req, res) => {
  const query = `
  INSERT INTO users(full_name, email, pass_word) VALUES (?, ?, ?)`;
  let body = req.body;
  let { full_name, email, pass_word } = body;

  try {
    const [data] = await connect.execute(query, [full_name, email, pass_word]);
    return res.send(data);
  } catch (error) {
    console.error("Error executing query:", error);
    return res.status(500).send({ error: "Something went wrong!" });
  }
});

//define port cho BE
app.listen(8080, () => {
  console.log("BE on 8080");
});
