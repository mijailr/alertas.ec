import { useQuery } from '@apollo/react-hooks';
import React, { Component } from 'react';
import { Column, Grid } from 'react-foundation';
import { GetAlerts } from '../Service/query';
import { Alerts, AlertType } from '../Service/types';
import AlertView from './AlertView';


const AlertsView = () => {
    const { loading, data, error } = useQuery(GetAlerts);
    if (loading) return <p>Loading...</p>
    if (error !== undefined) return <p>Error!</p>

    return (
        <Grid>
            <Column large={12} small={12}>
                {data.alerts.map((alert: AlertType) => (
                    <AlertView alert={alert} />
                ))}
            </Column>
        </Grid>
    )
}

export default class AlertList extends Component<{}, Alerts> {
    render() {

        return (
            <AlertsView />
        )
    }
}


