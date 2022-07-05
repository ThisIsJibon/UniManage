import React, { useEffect, useState } from 'react'
import  UniNavbar  from './UniNavbar'
import { DataGrid, GridColDef, GridValueGetterParams } from '@mui/x-data-grid';
import ResultFinder from '../components/api/ResultFinder';


const columns: GridColDef[] = [
  { field: 'id', headerName: 'Course ID', width: 130 },
  { field: 'name', headerName: 'Course Title', width: 350 },
  { field: 'year', headerName: 'Year', width: 130,type:'integer' },
  { field: 'semester', headerName: 'Semester', width: 130,type:'integer' },
  {
    field: 'credit',
    headerName: 'Credit',
    type: 'float',
    width: 130,
  },
  {
    field: 'grade',
    headerName: 'Grade',
    type: 'float',
    width: 130,
  },
  {
    field: 'reg_no',
    headerName: 'Registration',
    type: 'integer',
    width: 130,
  },

];

const rows = [
  { id: 'CSE150', title: 'Competitive Programming', semester: 1, credit: 1.5,grade:3.50,registration:2018331002},
  { id: 'CSE250', title: 'Project Work', semester: 3, credit: 1.5,grade:3.00 ,registration:2018331010},
  { id: 'IPE150', title: 'Workshop', semester: 2, credit: 1.5,grade:2.50 ,registration:2018331020},
  { id: 'IPE120', title: 'IPE Graphics', semester: 3, credit: 1.5,grade:3.25 ,registration:2018331050},
  { id: 'CSE333', title: 'Database Systems', semester: 5, credit: 3,grade:4.00 ,registration:2018331054},
  { id: 'CSE334', title: 'Database Systems Lab', semester: 5, credit: 1,grade:4.00 ,registration:2018331054},
  { id: 'CSE327', title: 'Operating Systems', semester: 5, credit: 3,grade:3.75 ,registration:2018331002},
  { id: 'CSE328', title: 'Operating Systems Lab', semester: 5, credit: 2,grade:3.25 ,registration:2018331090},
  { id: 'CSE337', title: 'Operating Systems II', semester: 5, credit: 3,grade:3.75 ,registration:2018331002},
  { id: 'CSE338', title: 'Operating Systems II Lab', semester: 5, credit: 2,grade:3.25 ,registration:2018331090},
  { id: 'CSE347', title: 'Operating Systems III', semester: 5, credit: 3,grade:3.75 ,registration:2018331002},
  { id: 'CSE348', title: 'Operating Systems III Lab', semester: 5, credit: 2,grade:3.25 ,registration:2018331090}
];


function Results() {

  
  const [tableData, setTableData] = useState([])

  const [rows, setRows] = useState(tableData);
  const [deletedRows, setDeletedRows] = useState([]);

  useEffect(() => {
    const API_URL = "https://jsonplaceholder.typicode.com/posts";
    async function fetchData() {
      // await fetch('/result')
      // .then((data) => data.json())
      // .then((data) => setTableData(data.result))
      const response = await ResultFinder.get("/");
      console.log(response.data.result);
      setTableData(response.data.result)
    }
    
    fetchData();
  }, []);


  return (
    <div>
      <UniNavbar/>
      
      <span className="result-query-span">
        <input type="search" id="registration-input" name="q" placeholder ="Registration"/>
        <input type="search" id="semseter-input" name="q" placeholder ="Semester"/>
        <input type="search" id="courseid-input" name="q" placeholder ="Course ID"/>
        <button>Check Result</button>
      </span>
      
      <div style={{ height: 600, width: '100%',position:'absolute',bottom:0}}>
        <DataGrid
          rows={tableData}
          columns={columns}
          pageSize={9}
          rowsPerPageOptions={[9]}
          
        />
      </div>
      
    </div>
  )
}

export default Results