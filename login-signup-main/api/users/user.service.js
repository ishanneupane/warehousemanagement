const pool = require("../../config/database.js");

module.exports = {
    create: (data, callBack) => {
        pool.query(
            `insert into registration (name, password, email)
             values (?, ?, ?)`,
            [data.name, 
            data.password,
            data.email],
            (error, results, fields) => {
                if (error) {
                    return callBack(error);
                }
                return callBack(null, results);
            }
        );
    },

    getUsers: (callBack) => {
        pool.query(
            `select id, name, email FROM registration`,
            [],
            (error, results, fields) => {
                if (error) {
                    return callBack(error);
                }
                return callBack(null, results);
            }
        );
    },

    updateUser: (data, callBack) => {
        pool.query(
            `update registration set name=?, password=?, email=? WHERE id=?`,
            [data.name, 
            data.password,
            data.email,
            data.id],
            (error, results, fields) => {
                if (error) {
                    return callBack(error);
                }
                return callBack(null, results[0]);
            }
        );
    },

    updatePassword: (userData, callBack) => {
        pool.query(
            `update registration set password=? where email=?`,
            [data.password, data.email],
            (error, results, fields) => {
                if (error) {
                    return callBack(error);
                }
                return callBack(null, results[0]);
            }
        );
    },

    deleteUser: (data, callBack) => {
        pool.query(
            `delete from registration where id=?`,
            [data.id],
            (error, results, fields) => {
                if (error) {
                    return callBack(error);
                }
                return callBack(null, results[0]);
            }
        );
    },

    getUserByEmail: (email, callBack) => {
        pool.query(
            `SELECT * FROM registration WHERE email = ?`,
            [email],
            (error, results, fields) => {
                if (error) {
                    // Pass the error to the callback function
                    return callBack(error);
                }
                // Check if any user is found
                if (results.length === 0) {
                    // If no user found, return null as the second parameter
                    return callBack(null, null);
                }
                // Log the retrieved user object
                console.log("Retrieved user:", results[0]);
                // Return the first result (assuming email is unique)
                return callBack(null, results[0]);
            }
        );
    }
};