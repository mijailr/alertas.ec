import React, { Component } from 'react';
import { Alerts, AlertType } from '../Service/types';
import GetAlerts from '../Service/query';
import { useQuery } from '@apollo/react-hooks';
import AlertView from './AlertView'
import { Column } from 'react-foundation';


const AlertsView = () => {
    const { loading, data, error } = useQuery(GetAlerts);
    if (loading) return <p>Loading...</p>
    if (error !== undefined) return <p>Error!</p>

    return (
        <Column large={12} small={12}>
            {data.alerts.map((alert: AlertType) => (
                <AlertView alert={alert} />
            ))}
        </Column>
    )
}

export default class AlertList extends Component<{}, Alerts> {
    render() {
        
        return (
            <AlertsView />
        )
    }
}


