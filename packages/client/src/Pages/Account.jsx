import React from "react";
import { useState } from "react";
import UniNavbar from "./UniNavbar";
import "../Assets/css/account.css"

const Account = () => {
  const [userData,setUserData] = useState ({
    name: "",
    username: "",
    email: "",
    reg: "",
    dept: "",
    session: "",
    address: "",
    contact: "",
  });
  const handleNameChange = (event) =>{
    setUserData({...userData,name:event.target.value});
  }
  const handleUserNameChange = (event) => {
    setUserData({ ...userData, username: event.target.value });
  };
  const handleRegChange = (event) => {
    setUserData({ ...userData, reg: event.target.value });
  };
  const handleDeptChange = (event) => {
    setUserData({ ...userData, dept: event.target.value });
  };
  const handleEmailChange = (event) => {
    setUserData({ ...userData, email: event.target.value });
  };
  const handleSessionChange = (event) => {
    setUserData({ ...userData, session: event.target.value });
  };
  const handleContactChange = (event) => {
    setUserData({ ...userData, contact: event.target.value });
  };
  const handleAddressChange = (event) => {
    setUserData({ ...userData, address: event.target.value });
  };

  const handleChange = async (event) =>{
    event.preventDefault();
    
    try{
      
      const id=2018331054;
      const body = {userData};
      const response = await fetch(`http://localhost:4000/user/edit/${id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(body),
      });
      
    }catch(err){
      console.log(err.message);
    }
  };

  return (
    <div>
      <UniNavbar />
      <div className="container">
        <div className="row">
          <div className="col-12">
            <div className="my-5">
              <h3>Profile</h3>
              <hr />
            </div>
            <form >
              <div className="row mb-5 gx-5">
                <div className="col-xxl-8 mb-5 mb-xxl-0">
                  <div className="bg-secondary-soft px-4 py-5 rounded">
                    <div className="row g-3">
                      <h4 className="mb-4 mt-0">Personal Details</h4>
                      <div className="col-md-6">
                        <label className="form-label" htmlFor="">
                          Full Name
                        </label>
                        <input
                          name="name"
                          type="text"
                          className="form-control"
                          value={userData.name}
                          onChange={handleNameChange}
                        />
                      </div>
                      <div className="col-md-6">
                        <label className="form-label" htmlFor="">
                          User Name
                        </label>
                        <input
                          name="username"
                          type="text"
                          className="form-control"
                          value={localStorage.userToken}
                          // onChange={handleUserNameChange}
                          disabled
                        />
                      </div>
                      <div className="col-md-6">
                        <label className="form-label" htmlFor="">
                          Email
                        </label>
                        <input
                          name="email"
                          type="text"
                          className="form-control"
                          value={userData.email}
                          onChange={handleEmailChange}
                        />
                      </div>
                      <div className="col-md-6">
                        <label className="form-label" htmlFor="">
                          Registration Number
                        </label>
                        <input
                          name="reg"
                          type="number"
                          className="form-control"
                          value={userData.reg}
                          onChange={handleRegChange}
                        />
                      </div>
                      <div className="col-md-6">
                        <label className="form-label" htmlFor="">
                          Department
                        </label>
                        <input
                          name="dept"
                          type="text"
                          className="form-control"
                          value={userData.dept}
                          onChange={handleDeptChange}
                        />
                      </div>
                      <div className="col-md-6">
                        <label className="form-label" htmlFor="">
                          Session
                        </label>
                        <input
                          name="session"
                          type="text"
                          className="form-control"
                          value={userData.session}
                          onChange={handleSessionChange}
                        />
                      </div>
                      <div className="col-md-6">
                        <label className="form-label" htmlFor="">
                          Address
                        </label>
                        <input
                          name="address"
                          type="text"
                          className="form-control"
                          value={userData.address}
                          onChange={handleAddressChange}
                        />
                      </div>
                      <div className="col-md-6">
                        <label className="form-label" htmlFor="">
                          Phone Number
                        </label>
                        <input
                          name="contact"
                          type="number"
                          className="form-control"
                          value={userData.contact}
                          onChange={handleContactChange}
                        />
                      </div>
                    </div>
                  </div>
                </div>

                <div className="col-xxl-6">
                  <div className="bg-secondary-soft px-4 py-5 rounded">
                    <div className="row g-3">
                      <h4 className="my-4">Change Password</h4>
                      <div className="col-md-6">
                        <label htmlFor="old_password" className="form-label">
                          Old Password
                        </label>
                        <input
                          type="password"
                          className="form-control"
                          id="old_password"
                        />
                      </div>
                      <div className="col-md-6">
                        <label htmlFor="new_password" className="form-label">
                          New Password
                        </label>
                        <input
                          type="password"
                          className="form-control"
                          id="new_password"
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div className="d-md-flex justify-content-md-center text-center btnContainer">
                <button onClick={handleChange} type="button" className="btn btn-primary btn-lg subBtn">
                  Update
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Account;
