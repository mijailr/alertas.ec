import React, { Component } from 'react'
import { UpdateType } from '../Service/types';
import Moment from 'react-moment'

interface UpdateProps {
  update: UpdateType
}

class UpdateView extends Component<UpdateProps, UpdateType> {
  constructor(props: UpdateProps) {
    super(props)

    this.state = {
      id: this.props.update.id,
      title: this.props.update.title,
      date: this.props.update.date,
      content: this.props.update.content
    }
  }
  render() {
    return (
      <div className="Update" id={this.state.id}>
        {this.state.title}
        <Moment className="date" format="DD/MM/YYYY">
          {this.state.date}
        </Moment>
      </div>
    )
  }
}

export default UpdateView;
