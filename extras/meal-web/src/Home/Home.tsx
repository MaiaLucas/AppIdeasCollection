import React from 'react'
import { Link } from 'react-router-dom'
import recipe from '../assets/recipes.jpg'
import recipeFinished from '../assets/finished-recipe.jpg'
import list from '../DUMMY.json'

function Home () {
  return (
    <div className="container py-3">
      <div className="row">
        <div className="col-sm-6">
          <div className="card" >
            <img src={recipe} className="card-img-top" height="350" alt="" />
            <div className="card-body">
              <h4 className="card-text">Make your recipe and show us</h4>
            </div>
            <div className="card-body">
              <Link to="/recipe/create" className="card-link">Let's go!</Link>
            </div>
          </div>
        </div>
        <div className="col-sm-6">
          <div className="card" >
            <img src={recipeFinished} className="card-img-top" height="350" alt="" />
            <div className="card-body">
              <h4 className="card-text">Also, you can see other people's recipes.</h4>
            </div>
            <div className="card-body">
              <Link to={{ pathname: '/recipe', state: { list } }} className="card-link">C'mon</Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Home
