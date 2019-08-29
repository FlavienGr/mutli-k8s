import React from "react";
import { BrowserRouter, Route, Link } from "react-router-dom";
import Fib from "./Fib";
import OtherPage from "./otherPage";
import "./App.css";

function App() {
  return (
    <BrowserRouter>
      <div className="App">
        <header>
          <Link to="/">Home</Link>
          <Link to="/otherpage">Other page</Link>
        </header>
        <div>
          <Route exact path="/" component={Fib} />
          <Route path="/otherpage" component={OtherPage} />
        </div>
      </div>
    </BrowserRouter>
  );
}

export default App;
