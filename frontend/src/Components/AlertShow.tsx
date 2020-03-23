import React, { Component } from 'react';
import { AlertSingle } from '../Service/types';
import { useQuery } from '@apollo/react-hooks';
import { GetAlert } from '../Service/query';
import { Column, Grid } from 'react-foundation';
import AlertView from './AlertView';
import { RouteComponentProps } from 'react-router-dom';

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