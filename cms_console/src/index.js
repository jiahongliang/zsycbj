import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import 'antd/dist/antd.css'
import {BrowserRouter as Router} from 'react-router-dom';
import GetRoutes from './router/routers';
import ErrorBoundary from './components/ErrorBoundary';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <ErrorBoundary>
      <Router>
        <GetRoutes />
      </Router>
    </ErrorBoundary>
);

