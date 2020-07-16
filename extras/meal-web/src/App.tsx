import React from 'react';
import './App.css';
import Header from './Header/Header';
import Footer from './Footer/Footer';
import 'bootstrap/dist/css/bootstrap.css';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import About from './About/About';
import Meals from './Meals/Meals';
import Home from './Home/Home';
import ShowRecipes from './Recipe/ShowRecipes';
import CreateRecipes from './Recipe/CreateRecipe';

function App() {
  return (
    <Router>
      <div className="App">
        <Header />
        <div className="conteudo">
          <Switch>
            <Route path="/" exact component={Home} />
            <Route path="/about" component={About} />
            <Route path="/meals" component={Meals} />
            <Route path="/recipe" exact component={ShowRecipes} />
            <Route path="/recipe/create" exact component={CreateRecipes} />
          </Switch>
        </div>
        <Footer />
      </div>
    </Router>
  );
}

export default App;
