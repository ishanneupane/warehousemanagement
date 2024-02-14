const { createUser,
    getUsers,
    updateUser,
    updatePassword,
    deleteUser,
    login
    } = require("./user.controller");
const router = require("express").Router();

router.post("/", createUser);
router.get("/", getUsers);
router.patch("/", updateUser); 
router.patch("/", updatePassword); 
router.delete("/", deleteUser); 
router.post("/login",login); 

module.exports = router;