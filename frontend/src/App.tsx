import React, { Component } from 'react';
import { Grid } from 'react-foundation'
import Header from './Components/Header'
import './App.scss';
import { ApolloProvider } from '@apollo/react-hooks'
import Client from './Service/Client'
import AlertList from './Components/AlertList'


class App extends Component {
  render() {
    return (
      <ApolloProvider client={Client}>
        <div className="App grid-container">
          <Header />
            <Grid>
              <AlertList />
            </Grid>
        </div>
      </ApolloProvider>
    );
  }

}

export default App;
