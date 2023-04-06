const router = require("express").Router();
const { getPatients, createPatient, getPatientById, updatePatientById, deletePatientById } = require("../controllers/patient.controller");

router.route("/GetAllPatientsData").get(getPatients);

router.route("/CreatePatient").post(createPatient);

router.route("/GetPatientDataById/:patientId").get(getPatientById).put(updatePatientById).delete(deletePatientById);

module.exports = router;
