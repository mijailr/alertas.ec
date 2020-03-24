import { ApolloProvider } from '@apollo/react-hooks';
import { library } from '@fortawesome/fontawesome-svg-core';
import { faExclamationCircle, faRadiation, faSkullCrossbones } from '@fortawesome/free-solid-svg-icons';
import React, { Component } from 'react';
import { BrowserRouter as Router, Route, RouteComponentProps, Switch } from "react-router-dom";
import './App.scss';
import AlertList from './Components/AlertList';
import AlertShow from './Components/AlertShow';
import Header from './Components/Header';
import Client from './Service/Client';
import { AlertSingle } from './Service/types';

library.add(faSkullCrossbones, faRadiation, faExclamationCircle);

export default class App extends Component {
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
