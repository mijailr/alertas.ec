import React, { Component } from 'react';
import { Alerts, AlertType } from '../Service/types';
import { GetAlerts } from '../Service/query';
import { useQuery } from '@apollo/react-hooks';
import AlertView from './AlertView'
import { Column, Grid } from 'react-foundation';


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


