import ApolloClient from 'apollo-boost'

const Client = new ApolloClient({
  uri: "https://alertas.ec/api"
});

export default Client;
