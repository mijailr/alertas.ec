import gql from 'graphql-tag';

const GetAlerts = gql`
  query{
    alerts{
      id
      title
      date
      status
      description
      updates{
        id
        title
        content
        date
      }
    }
  }
`;

export default GetAlerts;
