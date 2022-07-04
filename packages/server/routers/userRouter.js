const express = require("express");

const router = express.Router();
const pool = require("../db");
const bcrypt = require("bcrypt");


router.route("/edit/:id").put(async (req, res) => {
  try {
    const { id } = req.params;
    console.log(id);
    const userData  = req.body;
    console.log(userData);
    const updateUserData = await pool.query(
      "UPDATE userData SET reg = $1,fullname = $2,email = $3,dept = $4,ses = $5,addres = $6,contact = $7 WHERE username = $8",
      [
        userData.reg,
        userData.name,
        userData.email,
        userData.dept,
        userData.session,
        userData.address,
        userData.contact,
        id,
      ]
    );
    console.log("successful");
    
  } catch (err) {
    console.log(err.message);
  }
});

module.exports=router;