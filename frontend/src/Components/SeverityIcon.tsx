import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import React, { Component } from 'react';
import { SeverityType } from '../Service/types';

class SeverityIcon extends Component<SeverityType, SeverityType> {

    constructor(props: SeverityType) {
        super(props);

        this.state = {
            severity: this.props.severity
        }
    }

    render() {
        if (this.state.severity === "high") {
            return <FontAwesomeIcon icon="skull-crossbones" />
        }
        if (this.state.severity === "medium") {
            return <FontAwesomeIcon icon="radiation" />
        }
        if (this.state.severity === "normal") {
            return <FontAwesomeIcon icon="exclamation-circle" />
        }
    }
}

export default SeverityIcon;