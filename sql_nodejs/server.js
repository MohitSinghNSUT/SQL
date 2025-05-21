const mysql = require("mysql2/promise");
const createConnection = async () => {
  const db = await mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "my-secret-pw",
    database: "FirstDb",
  });
  //   USING db.query and db.execute is used to form query
  console.log("connection", await db.execute(`show databases`));

  // if you will not write database in above part
  await db.query(`CREATE DATABASE IF NOT EXISTS FirstDb`);

  console.log("connection", await db.query(`show databases`));
  await db.query("USE FirstDb");

  //   CREATE TABLE
  try {
    await db.query(`
  CREATE TABLE if not exists mysql_project( 
    _id INT PRIMARY KEY,
    data INT NOT NULL,
    string VARCHAR(50) NOT NULL
    )
    `);
    // YOU CAN USE IF EXISITS TO MAKE SURE ERROR DOES NOT OCCUR
    // INSERT SOME DATA
    let data = [10, 1, "mohit"];
    await db.query(
      `
    INSERT INTO mysql_project(_Id,data,string) VALUES (?)
    `,
      [data]
    );
    data = [
      [1, 1, "mohit"],
      [2, 1, "mohit"],
    ];
    await db.query(
      `
        INSERT INTO mysql_project(_Id,data,string) VALUES ?
        `,
      [data]
    );

    // INSERT IGNORE IS USED TO SKIP THE DATA IF ALREADY PRESENT
    data = [
      [1, 1, "mohit"],
      [2, 1, "mohit"],
    ];
    await db.query(
      `
       INSERT IGNORE INTO mysql_project(_Id, data, string) VALUES ?
        `,
      [data]
    );

    // READ DATA FROM TABLES IN DATABASE
    let output = await db.query(`select * from mysql_project`);
    // UPDATE
    output = await db.query(
      ` UPDATE mysql_project SET string="new mohit" WHERE _id=2`
    );
    console.log(output);
    // DELETE
    output = await db.query(`DELETE FROM mysql_project WHERE _id=1`);
    console.log(output);
  } catch (error) {
    console.log(error);
  }
};
createConnection();
