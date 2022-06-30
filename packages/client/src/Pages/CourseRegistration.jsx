import React from "react";

import UniNavbar from "./UniNavbar";
import "../Assets/css/account.css";


import Box from "@mui/material/Box";
import { DataGrid } from "@mui/x-data-grid";

const columns = [
  { field: "id", headerName: "Code", width: 150 },
  {
    field: "name",
    headerName: "Name",
    width: 360,
    editable: false,
  },
  {
    field: "credit",
    headerName: "Credit",
    width: 170,
    type: "number",
    editable: false,
  },
  {
    field: "major",
    headerName: "Is Major",
    width: 180,
    editable: false,
  },
  {
    field: "type",
    headerName: "Type",
    width: 160,
    editable: false,
  },
];

const rows = [
  { id: "CSE132", credit: 3, name: "Jon", major: 35, type: "theory" },
  { id: "CSE134", credit: 2.5, name: "Cersei", major: 42, type: "theory" },
  { id: "CSE232", credit: 1.5, name: "Jaime", major: 45, type: "theory" },
  { id: "CSE321", credit: 3, name: "Arya", major: 16, type: "theory" },
  { id: "CSE432", credit: 6, name: "Daenerys", major: null, type: "theory" },
  { id: "CSE332", credit: 3.5, name: null, major: 150, type: "theory" },
  { id: "CSE435", credit: 2.5, name: "Ferrara", major: 44, type: "theory" },
  { id: "CSE132", credit: 1.5, name: "Rossini", major: 36, type: "theory" },
  { id: "CSE239", credit: 3.5, name: "Harvey", major: 65, type: "theory" },
];

function handleclick(event) {
  console.log("it is clicked");
}

const CourseRegistration = () => {
  return (
    <div>
      <UniNavbar />
      {/* <button className="dashboard-button"> Register For Courses</button>
      <button className="dashboard-button"> Check Registration Status</button>
      <button className="dashboard-button">Payments</button>
      <button className="dashboard-button"> Explore Courses</button> */}

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
                        value="Mahinur Alam"
                      />
                    </div>
                    <div className="col-md-4">
                      <label className="form-label" htmlFor="">
                        Registration Number
                      </label>
                      <input
                        type="number"
                        className="form-control"
                        value="2018331054"
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
                        value="CSE"
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
                      >
                        <option selected>Open this select menu</option>
                        <option value="1">2022-1</option>
                        <option value="2">2022-2</option>
                        <option value="3">2023-1</option>
                        <option value="4">2023-2</option>
                        <option value="5">2024-1</option>
                        <option value="6">2024-2</option>
                        <option value="7">2025-1</option>
                        <option value="8">2025-2</option>
                      </select>
                    </div>

                    <div className="col-md-4">
                      <label className="form-label" htmlFor="">
                        Semester
                      </label>

                      <select
                        className="form-select"
                        aria-label="Default select example"
                      >
                        <option selected>Open this select menu</option>
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
              pageSize={5}
              rowsPerPageOptions={[5]}
              checkboxSelection
              disableSelectionOnClick
            />
          </Box>
        </div>
        <div className="d-md-flex justify-content-md-center text-center btnContainer">
          <button type="button" className="btn btn-primary btn-lg subBtn">
            Update
          </button>
        </div>
      </div>
    </div>
  );
};

export default CourseRegistration;
