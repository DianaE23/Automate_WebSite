import * as React from "react";
import { createRoot } from "react-dom/client";
import {
    createBrowserRouter,
    RouterProvider,
    Route,
    Link,
} from "react-router-dom";

import Home from './components/home/home';
import About from './components/about/about';
import App from './app.js';
import './styles.css';

const router = createBrowserRouter([
    {
        path: "/",
        element:<Home/>,
    },

    {
        path: "about",
        element:<About/>,
    },

]);

createRoot(<App/>,document.getElementById("root")).render(
    <RouterProvider router={router} />
);