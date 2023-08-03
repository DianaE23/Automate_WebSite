import  React from "react";
import { createRoot } from "react-dom/client";
import {
  createBrowserRouter,
  RouterProvider,
  Outlet,
} from "react-router-dom";

import Home from './components/home/home';
import About from './components/about/about';
import Navbar from "./components/nav/navbar";
import ErrorPage from "./components/nav/error";
import "./styles.css";
const AppLayout = () => {
  return (
    <>
      <Navbar />
      <Outlet />
    </>
  );
};

const router = createBrowserRouter([
  {
    element:<AppLayout/>,
    errorElement: <ErrorPage />,
    children: [
      {
        path: "/",
        element:<Home/>,
      },
      {
        path: "about",
        element:<About/>,
      },
    ],
  },
]);

createRoot(document.getElementById("root")).render(
  <RouterProvider router={router} />
);