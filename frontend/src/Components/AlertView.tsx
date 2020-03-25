import React, { Component } from 'react'
import Moment from 'react-moment'
import { AlertType } from '../Service/types'
import SeverityIcon from './SeverityIcon'

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
      updates: this.props.alert.updates,
      severity: this.props.alert.severity,
      type: this.props.alert.type
    }
  }
  render() {
    return (
      <div className={`Alert media-object ${this.state.severity}`}>
        <div className="media-object-section align-self-middle">
          <div className={`thumbnail ${this.state.severity}`}>
            <SeverityIcon severity={this.state.severity} />
          </div>
        </div>
        <div className="media-object-section main-section">
          <h2>
            <Moment className="date" format="DD/MM/YYYY">
              {this.state.date}
            </Moment>
            {this.state.title}

          </h2>
          <p>
            {this.state.description}
          </p>
          <span className="label">
            {this.state.type}
          </span>
        </div>
      </div>
    );
  }
}

export default AlertView;
