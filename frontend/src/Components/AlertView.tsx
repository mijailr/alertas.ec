import React, { Component } from 'react'
import UpdateView from './UpdateView'
import { AlertType, UpdateType } from '../Service/types'

interface AlertProps {
  alert: AlertType
}

class AlertView extends Component<AlertProps, AlertType> {
  constructor(props: AlertProps) {
    super(props)

    this.state = {
      id: this.props.alert.id,
      title: this.props.alert.title,
      date: this.props.alert.date,
      description: this.props.alert.description,
      status: this.props.alert.status,
      updates: this.props.alert.updates
    }
  }
  render() {
    return(
      <div className="Alert card">
        <div className="card-divider normal">
          <h2>
            {this.state.title}
            <small>{this.state.date}</small>
              </h2>
        </div>
        <div className="card-section">
          <p>
            {this.state.description}
          </p>
        </div>
          <div className="Updates">
            {this.state.updates.map((update: UpdateType) => (
              <UpdateView update={update} />
            ))}
          </div>
      </div>
    );
  }
}

export default AlertView;
