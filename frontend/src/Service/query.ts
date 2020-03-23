import gql from 'graphql-tag';

export const GetAlerts = gql`
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

export const GetAlert = gql`
  query Alert($id: ID!) {
    alert(id: $id){
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
