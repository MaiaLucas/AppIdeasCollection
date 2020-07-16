import React from 'react'
import { Link } from 'react-router-dom'

function ShowRecipes (props: any) {
  const params = props.location.state
  const list = params.list
  return (
    <div className="container py-3">
      <div className="row d-flex align-items-stretch justify-content-around flex-wrap">
        {list.recipes.map((recipe: any) => (
          <div key={`recipe-${recipe.id}`} className="col-sm-4 py-3">
            <div className="card">
              <img src={recipe.recipeImage} className="card-img-top" height="150" alt="" />
              <div className="card-body">
                <h5 className="card-title">{recipe.title}</h5>
                <p className="card-text">{recipe.description}</p>
              </div>
              <div className="card-body">
                <Link to="/recipe/detail" className="card-link">Show More</Link>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}

export default ShowRecipes
