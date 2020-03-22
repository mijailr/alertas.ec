import gql from 'graphql-tag';

const GetAlerts = gql`
  query{
    alerts{
      id
      title
      date
      status
      description
      severity
      updates{
        id
        title
        content
        date
        source
      }
    }
  }
`;

export default GetAlerts;
