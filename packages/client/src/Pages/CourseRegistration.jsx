import React from 'react'
import UniNavbar from './UniNavbar';

const CourseRegistration = () => {
  return (
    <div>
      <UniNavbar/>
      <button className='dashboard-button'> Register For Courses</button>
      <button className='dashboard-button'> Check Registration Status</button>
      <button className='dashboard-button'>Payments</button>
      <button className='dashboard-button'> Explore Courses</button>
    </div>
  )
}

export default CourseRegistration