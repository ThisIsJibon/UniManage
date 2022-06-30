import React from 'react'
import UniNavbar from './UniNavbar';

const Home = () => {
  return (
    <div> 
        <UniNavbar /> 
        <h1>{localStorage.userToken}</h1>
        <h1>Home here</h1>
    </div>
  )
}

export default Home;