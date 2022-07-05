import { Text } from "@chakra-ui/layout";
import { useContext } from "react";
import { Route, Routes } from "react-router-dom";
import { AccountContext } from "./AccountContext";
import Login from "./Login/Login";
import TestLogin from "./Login/TestLogin";
import SignUp from "./Login/SignUp";
import TestSignUp from "./Login/TestSignUp";
import PrivateRoutes from "./PrivateRoutes";
import Home from "../Pages/Home";
import Result from "../Pages/Results";
import Account from "../Pages/Account";
import CourseRegistration from "../Pages/CourseRegistration";
import Schedules from "../Pages/Schedules";

const Views = () => {
  const { user } = useContext(AccountContext);
  return user.loggedIn === null ? (
    <Text>Loading...</Text>
  ) : (
    <Routes>
      <Route path="/" element={<TestLogin />} />
      <Route path="/register" element={<TestSignUp />} />
      <Route element={<PrivateRoutes />}>
        <Route path="/home" element={<Home />} />
      </Route>
      <Route path="/Results" element={<Result />} />
      <Route path="/Account" element={<Account />} />
      <Route path="/CourseRegistration" element={<CourseRegistration />} />
      <Route path="/Schedules" element={<Schedules />} />
      <Route path="*" element={<TestLogin />} />
    </Routes>
  );
};

export default Views;
