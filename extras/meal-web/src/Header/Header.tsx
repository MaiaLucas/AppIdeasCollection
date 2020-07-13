import React from 'react';
import { Link } from 'react-router-dom';

function Header() {
    return (
        <header>
            <nav className="navbar navbar-expand-lg ">
                <Link className="navbar-brand" to="/">Navbar</Link>

                <div className="collapse navbar-collapse" id="navbarText">
                    <ul className="navbar-nav mr-auto">
                        <li className="nav-item active">
                            <Link to="/" className="nav-link" >Home</Link>
                        </li>
                        <li className="nav-item">
                            <Link to="/about" className="nav-link" >About</Link>
                        </li>
                        <li className="nav-item">
                            <Link to="/meals" className="nav-link" >Meals</Link>
                        </li>
                    </ul>
                    <span className="navbar-text">
                        login
                    </span>
                </div>
            </nav>
        </header>
    );
}

export default Header;