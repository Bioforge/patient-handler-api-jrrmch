const { PrismaClient } = require("@prisma/client");
const { patient } = new PrismaClient();
const logger = require("../config/winston");

/**
 * Get Patients
 * @async
 * @method
 * @description - finds all the patients
 * @param {object} req - request object
 * @param {object} res - response object
 * @returns {JSON} - returns the all the patient information in an array
 * @throws {NotFoundError} - throws an error when the patients can't be found
 */
const getPatients = async (req, res) => {
    try {
        const patients = await patient.findMany({});
        return res.status(200).json({
            success: true,
            message: "Patients Found",
            patients: patients,
        });
    } catch (error) {
        logger.error(error);
        return res.json({ success: false, message: "Error Occured", error: error });
    }
};

/**
 * Get The Details of Last Patient
 * @async
 * @method
 * @description - finds all the patients
 * @param {object} req - request object
 * @param {object} res - response object
 * @returns {JSON} - returns the last patient details
 * @throws {NotFoundError} - throws an error when the patient details can't be found
 */
const getLastPatientDetails = async (req, res) => {
    try {
        const patients = await patient.findMany({
            orderBy: { createdAt: "desc" },
            take: 1,
        });

        if (patient.length !== 1) {
            return res.status(404).json({ success: false, message: "No Patient Found" });
        }

        return res.status(200).json({ success: true, message: "Last Patient Found", patient: patients[0] });
    } catch (error) {
        logger.error(error);
        return res.json({ success: false, message: "Error Occured", error: error });
    }
};

/**
 * Create Patient
 * @async
 * @method
 * @description - creates a patient using the information from the request object
 * @param {object} req - request object
 * @param {object} res - response object
 * @returns {JSON} - returns the newly created patient information
 * @throws {NotFoundError} - throws an error when the patient can't be created
 */
const createPatient = async (req, res) => {
    try {
        console.log(req.body);
        const patientData = await patient.create({ data: req.body });

        return res.status(200).json({ success: true, message: "Created a new patient record", patient: patientData });
    } catch (error) {
        console.error(error);
        logger.error(error);
        return res.json({ success: false, message: "Error Occured", error: error });
    }
};

/**
 * Get Patient By ID
 * @async
 * @method
 * @description - finds a single patient
 * @param {object} req - request object
 * @param {object} res - response object
 * @returns {JSON} - returns the patient information
 * @throws {NotFoundError} - throws an error when the patient can't be found
 */
const getPatientById = async (req, res) => {
    try {
        const id = req.params.patientId;
        const patientData = await patient.findFirst({
            where: {
                OR: [{ patientId: id }, { id: id }],
            },
        });
        return res.status(200).json({
            success: true,
            message: "Patient Found",
            patient: patientData,
        });
    } catch (error) {
        logger.error(error);
        return res.json({ success: false, message: "Error Occured", error: error });
    }
};
/**
 * Update Patient
 * @async
 * @method
 * @description - finds a patient using its id and then updated the patient using the information from the request object
 * @param {object} req - request object
 * @param {object} res - response object
 * @returns {JSON} - returns the a successfull message
 * @throws {NotFoundError} - throws an error when the patient can't be updated
 */
const updatePatientById = async (req, res) => {
    try {
        const id = req.params.patientId;

        const patientExists = await patient.findFirst({
            where: {
                OR: [{ patientId: id }, { id: id }],
            },
        });

        if (patientExists) {
            const patientData = await patient.update({ where: { id: patientExists.id }, data: req.body });
            return res.status(200).json({ success: true, message: "Updated the patient", data: patientData });
        }

        return res.status(404).json({ success: true, message: "Patient does not exist" });
    } catch (error) {
        logger.error(error);
        return res.json({ success: false, message: "Error Occured", error: error });
    }
};

/**
 * Delete Patient
 * @async
 * @method
 * @description - finds a patient using its id and then delete the patient
 * @param {object} req - request object
 * @param {object} res - response object
 * @returns {JSON} - returns the deleted patients information
 * @throws {NotFoundError} - throws an error when the patient can't be deleted
 */
const deletePatientById = async (req, res) => {
    try {
        const id = req.params.patientId;
        const patientExists = await patient.findFirst({
            where: {
                OR: [{ patientId: id }, { id: id }],
            },
        });

        if (!patientExists) {
            return res.status(404).json({ success: false, message: "Patient doesn't exists" });
        }

        await patient.delete({
            where: { id: patientExists.id },
        });

        return res.status(200).json({ success: true, message: "Deleted the patient" });
    } catch (error) {
        logger.error(error);
        return res.json({ success: false, message: "Error Occured", error: error });
    }
};

module.exports = {
    getPatients,
    getLastPatientDetails,
    createPatient,
    getPatientById,
    updatePatientById,
    deletePatientById,
};
