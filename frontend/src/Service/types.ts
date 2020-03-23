// ================================
// GraphQL query operation Alert
// ================================

export interface Alerts {
  alerts: Array<AlertType>;
}

export interface AlertSingle {
  id: string;
}

export interface AlertType {
  id: string;
  title: string;
  date: Date;
  status: string;
  description: string;
  updates: Array<UpdateType>;
  severity: string;
}

export interface UpdateType {
  id: string;
  title: string;
  content: string;
  date: Date;
}

export interface AlertVars {
  tag: string;
}
