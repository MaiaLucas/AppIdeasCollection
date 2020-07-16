import React, { useState, FunctionComponent } from 'react'

type More = {
  step: number,
  stepKey: number
}

let numStep = 1
let numIngredient = 1
function CreateRecipes() {
  const [stepNum, setStepNum] = useState(1)
  const [ingredientNum, setIngredientNum] = useState(1)
  const more = (type: number) => {
    if (type === 1) {
      setIngredientNum(numIngredient++)
    } else if (type === 2) {
      setStepNum(numStep++)
    }
  }

  const showSteps = () => {
    const divSteps: Array<any> = []
    for (let i = 1; i <= stepNum; i++) {
      divSteps.push(<Steps step={stepNum} stepKey={i} key={i} />)
    }
    return divSteps
  }

  const showIngredients = () => {
    const divIngredient: Array<any> = []
    for (let i = 1; i <= ingredientNum; i++) {
      divIngredient.push(<Ingredients step={ingredientNum} stepKey={i} key={i} />)
    }
    return divIngredient
  }

  // console.log(stepNum)

  return (
    <div className="container">
      <div className="d-flex align-items-start flex-wrap">
        <h1 className="pb-4 recipe-create">New Recipe</h1>
      </div>
      <form>
        {/* Title & Description */}
        <div className="row form-group">
          <div className="col-sm-4 d-flex align-items-start flex-wrap">
            <label htmlFor="recipe-title">Title</label>
            <input
              type="text"
              className="form-control"
              id="recipe-title"
              placeholder="Orange Cake"
            />
          </div>
          <div className="col-sm-4 d-flex align-items-start flex-wrap">
            <label htmlFor="recipe-description">Description</label>
            <input
              type="text"
              className="form-control"
              id="recipe-description"
              placeholder="Delicious"
            />
          </div>

          {/* Image */}
          <div className=" col-sm-4 form-group d-flex align-items-start flex-wrap">
            <label htmlFor="recipe-image">Recipe Image</label>
            <input type="file" className="form-control-file" id="recipe-image" />
          </div>
        </div>

        <div className="row d-flex justify-content-start align-items-start">
          {/* Ingredients */}
          <div className="col-sm-6 form-group d-flex justify-content-start flex-wrap">
            <label htmlFor="ingredients">Ingredients</label>
            {showIngredients().map(divIngredient => (divIngredient))}
            <div className="col-sm-12 d-flex justify-content-end ">
              <input type="button" value="More Ingredients" className="btn btn-secondary mx-2" onClick={() => more(1)} />
            </div>
          </div>

          {/* Steps */}
          <div className="col-sm-6 form-group d-flex justify-content-start flex-wrap">
            <label htmlFor="step">Steps</label>
            {showSteps().map(divStep => (divStep))}
            <div className="col-sm-12 d-flex justify-content-end ">
              <input type="button" value="More Step" className="btn btn-secondary mx-2" onClick={() => more(2)} />
            </div>
          </div>
        </div>

        {/* Submit */}
        <div className="d-flex justify-content-end">
          <button type="submit" className="col-sm-3 btn btn-primary btn-lg btn-block">Create</button>
        </div>
      </form>
    </div>
  )
}

const Steps: FunctionComponent<More> = ({ stepKey }: More) => {
  return (
    <div key={`step-${stepKey}`} className="p-2 row col-sm-12 justify-content-between flex-nowrap" id="step">
      <h4 className="step-num col-sm-1" >{stepKey}.</h4>
      <input type="text" className="form-control" id="recipe-steps" placeholder="Mix we ingredients" />
    </div>
  )
}

const Ingredients: FunctionComponent<More> = ({ stepKey }: More) => {
  return (
    <div key={`step-${stepKey}`} className="p-2 row col-sm-12 justify-content-between flex-nowrap" id="ingredients">
      <h4 className="step-num col-sm-1" >{stepKey}.</h4>
      <input type="text" className="form-control" id="recipe-ingredients" placeholder="Sugar, 2 cups" />
    </div>
  )
}

export default CreateRecipes
