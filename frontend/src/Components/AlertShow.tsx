import { useQuery } from '@apollo/react-hooks';
import React, { Component } from 'react';
import { Column, Grid } from 'react-foundation';
import { RouteComponentProps } from 'react-router-dom';
import { GetAlert } from '../Service/query';
import { AlertSingle } from '../Service/types';
import AlertView from './AlertView';

interface ComponentProps extends RouteComponentProps<AlertSingle> {
}

const FetchAlert = ({ id }: AlertSingle) => {
    const { loading, data, error } = useQuery(GetAlert, { variables: { id: id } });
    if (loading) return <p>Loading...</p>
    if (error !== undefined) return <p>Error!</p>

    return (
        <Grid>
            <Column large={12} small={12}>
                <AlertView alert={data.alert} />
            </Column>
        </Grid>
    )
}

export default class AlertShow extends Component<AlertSingle, {}> {
    render() {
        return (
            <FetchAlert id={this.props.id} />
        )
    }
}