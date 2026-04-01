import bcrypt from 'bcrypt';
import { createUser, authenticateUser } from '../models/users.js';

const SALT_ROUNDS = 10;

// Registration
const showUserRegistrationForm = (req, res) => {
    res.render('register', { title: 'Register' });
};

const processUserRegistrationForm = async (req, res) => {
    const { name, email, password } = req.body;
    try {
        const passwordHash = await bcrypt.hash(password, SALT_ROUNDS);
        await createUser(name, email, passwordHash);
        req.flash('success', 'Account created successfully! Please log in.');
        res.redirect('/login');
    } catch (error) {
        if (error.code === '23505') {
            req.flash('error', 'An account with that email already exists.');
        } else {
            req.flash('error', 'Registration failed. Please try again.');
        }
        res.redirect('/register');
    }
};

// Login
const showLoginForm = (req, res) => {
    res.render('login', { title: 'Login' });
};

const processLoginForm = async (req, res) => {
    const { email, password } = req.body;
    const user = await authenticateUser(email, password);
    if (!user) {
        req.flash('error', 'Invalid email or password.');
        return res.redirect('/login');
    }
    req.session.user = user;
    req.flash('success', `Welcome back, ${user.name}!`);
    res.redirect('/dashboard');
};

const processLogout = (req, res) => {
    req.session.destroy(() => {
        res.redirect('/login');
    });
};

// Dashboard
const showDashboard = (req, res) => {
    res.render('dashboard', { title: 'Dashboard', user: req.session.user });
};

export { showUserRegistrationForm, processUserRegistrationForm, showLoginForm, processLoginForm, processLogout, showDashboard };
