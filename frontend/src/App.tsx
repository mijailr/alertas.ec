import React, { Component } from 'react';
import { Grid } from 'react-foundation'
import {
  BrowserRouter as Router,
  Switch,
  Route,
  RouteComponentProps
} from "react-router-dom";
import Header from './Components/Header'
import './App.scss';
import { ApolloProvider } from '@apollo/react-hooks'
import Client from './Service/Client'
import AlertList from './Components/AlertList'

import AlertShow from './Components/AlertShow';
import { AlertSingle } from './Service/types';


class App extends Component {
  render() {
    return (
      <ApolloProvider client={Client}>
        <Router>
          <div className="App grid-container">
            <Header />
            <Switch>
              <Route exact path="/" children={<AlertList />} />
              <Route path="/alert/:id" children={(props: RouteComponentProps<AlertSingle>) => (
                <AlertShow id={props.match.params.id} />
              )} />
            </Switch>
          </div>
        </Router>
      </ApolloProvider>
    );
  }

}

export default App;
