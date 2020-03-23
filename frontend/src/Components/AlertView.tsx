import React, { Component } from 'react'
import UpdateView from './UpdateView'
import { AlertType, UpdateType } from '../Service/types'
import Moment from 'react-moment'
import { Link } from 'react-router-dom'

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
      severity: this.props.alert.severity
    }
  }
  render() {
    return (
      <div className="Alert card">
        <div className={`card-divider ${this.state.severity}`}>
          <Link to={`alert/${this.state.id}`}>
            <h2>
              {this.state.title}
              <Moment className="date" format="DD/MM/YYYY">
                {this.state.date}
              </Moment>
            </h2>
          </Link>
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
