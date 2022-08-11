import React, { useState,useEffect } from "react";

import UniNavbar from "./UniNavbar";
import "../Assets/css/account.css";


import Box from "@mui/material/Box";
import { DataGrid } from "@mui/x-data-grid";


const columns = [
  {
    field: "course_id",
    headerName: "Course_id",
    width: 150,
    sortable: false,
    headerAlign: "center",
    align: "center",
  },
  {
    field: "name",
    headerName: "Name",
    width: 360,
    editable: false,
    sortable: false,
    headerAlign: "center",
    align: "center",
  },
  {
    field: "credit",
    headerName: "Credit",
    width: 170,
    type: "number",
    editable: false,
    headerAlign: "center",
    align: "center",
  },
  {
    field: "type",
    headerName: "Type",
    width: 160,
    editable: false,
    sortable: false,
    headerAlign: "center",
    align: "center",
  },
];

// const rows = [
//   {
//     id: 0,
//     course_id: "CSE133",
//     credit: 3,
//     name: "C programming",
//     type: "theory",
//   },
//   { id: 1, course_id: "CSE134", credit: 2.5, name: "DM", type: "theory" },
//   { id: 2, course_id: "CSE232", credit: 1.5, name: "Java", type: "theory" },
//   { id: 3, course_id: "CSE321", credit: 3, name: "OS", type: "theory" },
//   { id: 4, course_id: "CSE432", credit: 6, name: "ML", type: "theory" },
//   { id: 5, course_id: "CSE332", credit: 3.5, name: "DSP", type: "theory" },
//   { id: 6, course_id: "CSE435", credit: 2.5, name: "AI", type: "theory" },
//   { id: 7, course_id: "CSE132", credit: 1.5, name: "CP", type: "theory" },
//   { id: 8, course_id: "CSE239", credit: 3.5, name: "DS", type: "theory" },
// ];


const CourseRegistration = () => {


  const [userData,setUserData]=useState({
    name: "",
    dept_id: ""

  });


  const [rows,setRows] = useState([]);

  const [selectedRows,setSelectedRows] = useState([]);


  const [usn,setUSN] = useState("USN");
  const [semester, setSemester] = useState("Semester");

  const handleUSNChange = (event) => {
    console.log(event.target.value);
    setUSN(event.target.value);
  }

  const handleSemesterChange = (event) => {
  
    console.log(event.target.value);
    setSemester(event.target.value);


  };



  const handleClickChange = async (event) => {
    event.preventDefault();

    try{

      let courseIDs = [];

      selectedRows.forEach((x) =>{
        // console.log(rows[x].course_id);
        courseIDs.push(rows[x].course_id);
      });

      // console.log(courseIDs);

      const body = { usn , courseIDs,reg_no :localStorage.userToken};
      const response = await fetch(
        `http://localhost:4000/user/course_registration`,
        {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(body),
        }
      );

      

      console.log(response);

    }catch(err){
      console.log(err.message);
    }

  }


  useEffect(() => {
    const getUserInfo = async () => {
      try {
        const response = await fetch(
          `http://localhost:4000/user/${localStorage.userToken}`
        );

        const userData = await response.json();
        const user = userData.userData[0];
        console.log(user);
        setUserData(user);
      } catch (err) {
        console.log(err.message);
      }
    };

    getUserInfo();
  }, []);





  useEffect(() => {
    const getSearchResult = async () => {
      

      if(usn !== "USN" && semester !== "Semester"){

        console.log(usn);
        console.log(semester);


        try {
          const body = { usn,semester };
          const response = await fetch(
            `http://localhost:4000/department/course`,
            {
              method: "POST",
              headers: { "Content-Type": "application/json" },
              body: JSON.stringify(body),
            }
            

          );

          const courseData = await response.json();
          let {courses} = courseData;
          // console.log(courses);

          courses.forEach((x,i) => {
            // console.log(i,x);
            x.id=i;
            console.log(x.id)
          });

          setRows(courses);

        } catch (err) {
          console.log(err.message);
        }


      }

      
    };
    getSearchResult();
  }, [usn,semester]);



  return (
    <div>
      <UniNavbar />

      <div className="container">
        <div className="row">
          <div className="my-5">
            <h3>Course Registration</h3>
            <hr />
          </div>
          <form>
            <div className="row mb-3 gx-5">
              <div className="col-xxl-8 mb-2 mb-xxl-0">
                <div className="bg-secondary-soft px-4 py-1 rounded">
                  <div className="row g-3">
                    <div className="col-md-4">
                      <label className="form-label text" htmlFor="">
                        Name
                      </label>
                      <input
                        type="text"
                        className="form-control"
                        disabled
                        value={userData.name}
                      />
                    </div>
                    <div className="col-md-4">
                      <label className="form-label" htmlFor="">
                        Registration Number
                      </label>
                      <input
                        type="number"
                        className="form-control"
                        value={localStorage.userToken}
                        disabled
                      />
                    </div>
                    <div className="col-md-4">
                      <label className="form-label" htmlFor="">
                        Department
                      </label>
                      <input
                        type="text"
                        className="form-control"
                        value={userData.dept_id}
                        disabled
                      />
                    </div>
                    <div className="col-md-4">
                      <label className="form-label" htmlFor="">
                        Approval Status
                      </label>
                      <input
                        type="text"
                        className="form-control"
                        value="Not Approved"
                        disabled
                      />
                    </div>
                    <div className="col-md-4">
                      <label className="form-label" htmlFor="">
                        USN
                      </label>

                      <select
                        className="form-select"
                        aria-label="Default select example"
                        value={usn}
                        onChange={handleUSNChange}
                      >
                        <option value="USN">Select USN</option>
                        <option value="2022-1">2022-1</option>
                        <option value="2022-2">2022-2</option>
                        <option value="2023-1">2023-1</option>
                        <option value="2023-2">2023-2</option>
                        <option value="2024-1">2024-1</option>
                        <option value="2024-2">2024-2</option>
                        <option value="2025-1">2025-1</option>
                        <option value="2025-2">2025-2</option>
                      </select>
                    </div>

                    <div className="col-md-4">
                      <label className="form-label" htmlFor="">
                        Semester
                      </label>

                      <select
                        className="form-select"
                        aria-label="Default select example"
                        value={semester}
                        onChange={handleSemesterChange}
                      >
                        <option value="Semester">Select Semester</option>
                        <option value="1">1st Semester</option>
                        <option value="2">2nd Semester</option>
                        <option value="3">3rd Semester</option>
                        <option value="4">4th Semester</option>
                        <option value="5">5th Semester</option>
                        <option value="6">6th Semester</option>
                        <option value="7">7th Semester</option>
                        <option value="8">8th Semester</option>
                      </select>
                    </div>
                  </div>
                </div>
                <hr />
              </div>
            </div>
          </form>

          <Box sx={{ height: 400, width: "100%" }}>
            <DataGrid
              rows={rows}
              columns={columns}
              // pageSize={20}
              // rowsPerPageOptions={[5]}
              checkboxSelection
              disableSelectionOnClick
              hideFooterPagination
              disableColumnFilter
              onSelectionModelChange={(newSelection) => {
                console.log(newSelection);
                setSelectedRows(newSelection);
              }}
            />
          </Box>
        </div>
        <div className="d-md-flex justify-content-md-center text-center btnContainer">
          <button
            onClick={handleClickChange}
            type="button"
            className="btn btn-primary btn-lg subBtn"
          >
            Update
          </button>
        </div>
      </div>
    </div>
  );
};

export default CourseRegistration;
