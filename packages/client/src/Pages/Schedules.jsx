
import React,{useState,useEffect} from 'react'
import UniNavbar from './UniNavbar';
import {UserData} from '../components/Chart/Data';
import { Bar } from 'react-chartjs-2';
import 'chartjs-adapter-date-fns';
import ScheduleFinder from '../components/api/ScheduleFinder';
import { Chart } from "react-google-charts";

const columns = [
  { type: "string", label: "Task ID" },
  { type: "string", label: "Task Name" },
  { type: "string", label: "Resource" },
  { type: "date", label: "Start Date" },
  { type: "date", label: "End Date" },
  { type: "number", label: "Duration" },
  { type: "number", label: "Percent Complete" },
  { type: "string", label: "Dependencies" },
];

const rows = [
  [
    "CSE350",
    "Project Work",
    "Gallery-2-IICT",
    new Date(2014, 2, 22,10,0),
    new Date(2014, 2, 22,11,0),
    null,
    0,
    null,
  ],
  [
    "IPE250",
    "Engineering Graphics",
    "302-A",
    new Date(2014, 2, 22,11,0),
    new Date(2014, 2, 22,12,0),
    null,
    0,
    null,
  ],
  [
    "CSE333",
    "Database Systems",
    "331-IICT",
    
    new Date(2014, 2, 22,12,0),
    new Date(2014, 2, 22,13,0),
    null,
    0,
    null,
  ],
  [
    "CSE310",
    "Operating Systems",
    "104-IICT",
    new Date(2014, 2, 22,13,0),
    new Date(2014, 2, 22,13,30),
    null,
    0,
    null,
  ],
  [
    "BUS204D",
    "Accounting",
    "201-D",
    new Date(2014, 2, 22,13,30),
    new Date(2014, 2, 22,14,0),
    null,
    0,
    null,
  ],
  [
    "PHY301D",
    "Non-Linear Optics",
    "105-B",
    new Date(2014, 2, 22,14,0),
    new Date(2014, 2, 22,14,30),
    null,
    0,
    null,
  ],
  [
    "EEE201D",
    "Digital Logic Design",
    "405-IICT",
    
    new Date(2014, 2, 22,14,30),
    new Date(2014, 2, 22,15,0),
    null,
    0,
    null,
  ],
  [
    "CSE133",
    "Data Structures",
    "105-IICT",
    new Date(2014, 2, 22,15,0),
    new Date(2014, 2, 22,15,30),
    null,
    0,
    null,
  ],
];

export const data = [columns, ...rows];

export const options = {
  height: 400,
  gantt: {
    trackHeight: 30,
  },
};

const Schedules = () => {
  
  const [userReg, setUserReg] = useState();
   //const USER_REG = (localStorage.userToken);
  // console.log(USER_REG);

   const [tableData, setTableData] = useState([])
   const [rows, setRows] = useState(tableData);

  useEffect(() => {
    setUserReg(2018331002);
    async function fetchData() {
      
      console.log(userReg);
      const response = await ScheduleFinder.get('/${userReg}');
      console.log("shit end");
      console.log(response.data.result);
    }
    fetchData();
  }, []);

  return (

    

    <div>
      <UniNavbar/>
      
      <div>
        <h2>Class Schedules</h2>
        <Chart
          chartType="Gantt"
          width="100%"
          height="50%"
          data={data}
          options={options}
        />
      </div>
      
      
    </div>
  )
}

export default Schedules