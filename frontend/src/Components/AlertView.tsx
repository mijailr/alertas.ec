import React, { Component } from 'react'
import Moment from 'react-moment'
import { Link } from 'react-router-dom'
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
        <div className="media-object-section">
          <Link to={`alert/${this.state.id}`}>
            <h2>
              {this.state.title}

            </h2>
          </Link>
          <p>
            {this.state.description}
          </p>
          <span className="label">
            {this.state.type}
          </span>
          <Moment className="date" format="DD/MM/YYYY">
            {this.state.date}
          </Moment>
        </div>
      </div>
    );
  }
}

export default AlertView;
