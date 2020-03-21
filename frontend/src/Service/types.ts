// ================================
// GraphQL query operation Alert
// ================================

export interface Alerts {
  alerts: Array<AlertType>;
}

export interface AlertType {
  id: string;
  title: string;
  date: string;
  status: string;
  description: string;
  updates: Array<UpdateType>
}

export interface UpdateType {
  id: string;
  title: string;
  content: string;
  date: string;
}

export interface AlertVars {
  tag: string;
}
