
const express = require("express");
const mysql = require("mysql2");

const app = express();
const port = 3100;

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Dabu6039###",
  database: "gym_management",
});

connection.connect();

app.get("/gym", (req, res) => {
  connection.query("SELECT * FROM Gym", (err, results) => {
    if (err) {
      res.status(500).send("Database query error");
      return;
    }
    res.json(results);
  });
});

app.get("/member", (req, res) => {
  connection.query("SELECT * FROM Member", (err, results) => {
    if (err) {
      console.log("Error executing query:", err); // Log the error details
      res.status(500).send("Database query error");
      return;
    }
    console.log("Query results:", results); // Log the query results
    res.json(results);
  });
});


app.get("/coach", (req, res) => {
  connection.query("SELECT * FROM Coach", (err, results) => {
    if (err) {
      console.error("Database query error:", err); // Log detailed error
      res.status(500).send("Database query error: " + err.message);
      return;
    }
    res.json(results);
  });
});

app.get("/session", (req, res) => {
  connection.query("SELECT * FROM Session", (err, results) => {
    if (err) {
      console.log("Error executing query:", err); // Log the error details
      res.status(500).send("Database query error");
      return;
    }
    console.log("Query results:", results); // Log the query results
    res.json(results);
  });
});

app.get("/member-session", (req, res) => {
  connection.query("SELECT * FROM Member_Session", (err, results) => {
    if (err) {
      console.log("Error executing query:", err); // Log the error details
      res.status(500).send("Database query error");
      return;
    }
    console.log("Query results:", results); // Log the query results
    res.json(results);
  });
});


app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
