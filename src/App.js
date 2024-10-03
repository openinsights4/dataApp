import React, { useState } from 'react';

function Login() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleLogin = (e) => {
    e.preventDefault();
    console.log("User:", email, "Password:", password);
  };

  const handleGoogleLogin = () => {
    console.log("Login with Google");
  };

  const handleOutlookLogin = () => {
    console.log("Login with Outlook");
  };

  return (
    <div className="container">
      <div className="login-container">
        <h2>Welcome to data app</h2>
        <p>We are happy to have you back!</p>
        <form onSubmit={handleLogin}>
          <input
            type="text"
            placeholder="Email or phone"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
          <input
            type="password"
            placeholder="Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
          <div className="options">
            <label>
              <input type="checkbox" /> Remember me
            </label>
            <a href="#" className="forgot-password">Forgot password?</a>
          </div>
          <button type="submit" className="btn sign-in-btn">Sign In</button>
        </form>

        <div className="divider">
          <span>Or</span>
        </div>

        <div className="social-login">
          <button onClick={handleGoogleLogin} className="btn google-btn">
            Sign In with Google
          </button>
          <button onClick={handleOutlookLogin} className="btn outlook-btn">
            Sign In with Outlook
          </button>
        </div>

        <p className="signup-text">
          Don't have an account? <a href="#">Sign up</a>
        </p>
      </div>
    </div>
  );
}

export default Login;
