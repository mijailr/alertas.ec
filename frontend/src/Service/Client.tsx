import { ApolloClient, createHttpLink, InMemoryCache } from '@apollo/client';

const Client = new ApolloClient({
  link: createHttpLink({uri: "https://alertas.ec/api"}),
  cache: new InMemoryCache(),
});

export default Client;
