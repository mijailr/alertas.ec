import { useQuery } from '@apollo/react-hooks';
import React, { Component } from 'react';
import { Column, Grid } from 'react-foundation';
import { Link } from 'react-router-dom';
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
                    <Link key={alert.id} className="alert-link" to={`/alert/${alert.id}`}>
                        <AlertView alert={alert} />
                    </Link>
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
