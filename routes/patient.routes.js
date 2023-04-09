const router = require("express").Router();
const {
    getPatients,
    createPatient,
    getPatientById,
    updatePatientById,
    deletePatientById,
    getLastPatientDetails,
} = require("../controllers/patient.controller");

router.route("/GetAllPatientsData").get(getPatients);

router.route("/CreatePatient").post(createPatient);

router.route("/GetLastPatientDetails").get(getLastPatientDetails);

router.route("/GetPatientDataById/:patientId").get(getPatientById);

module.exports = router;
