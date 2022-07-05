const express = require("express");
const router = express.Router();
const pool = require("../db");

router
  .route("/")
  .get(async (req, res) => {
    try {
        const resulltQuery = await pool.query(
        "SELECT * FROM student S INNER JOIN Course_Enrollment ON Course_Enrollment.reg_no=s.reg_no INNER JOIN Section ON Course_Enrollment.section_id= Section.section_id INNER JOIN Course ON Course.course_id=Section.course_id ORDER BY s.reg_no"
      );
      res.status(200).json({
        status: "successful result query",
        results: resulltQuery.rows.length,
        data: 
          resulltQuery.rows
        ,
      });
    } catch (error) {
        console.log(error);
    }
  })
  .post(async (req, res) => {
    
  });

  module.exports = router;