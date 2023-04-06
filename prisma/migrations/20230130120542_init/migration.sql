-- CreateTable
CREATE TABLE "Patient" (
    "id" TEXT NOT NULL,
    "patientId" TEXT,
    "admissionId" TEXT,
    "indoorPatient" BOOLEAN,
    "outdoorPatient" BOOLEAN,
    "firstName" TEXT,
    "lastName" TEXT,
    "fathersName" TEXT,
    "mothersName" TEXT,
    "dateOfRegistration" TIMESTAMP(3),
    "dateOfBirth" TIMESTAMP(3),
    "age" TEXT,
    "sex" TEXT,
    "phone" TEXT,
    "emergencyPhone" TEXT,
    "emergencyName" TEXT,
    "emergencyRelationtToThePatient" TEXT,
    "currentDivision" TEXT,
    "currentDistrict" TEXT,
    "currentUpazila" TEXT,
    "currentThana" TEXT,
    "currentAddress" TEXT,
    "currentZipCode" TEXT,
    "permanentDivision" TEXT,
    "permanentDistrict" TEXT,
    "permanentUpazila" TEXT,
    "permanentThana" TEXT,
    "permanentAddress" TEXT,
    "permanentZipCode" TEXT,
    "bedCabin" TEXT,
    "department" TEXT,
    "unit" TEXT,
    "doctor" TEXT,
    "ageInYear" INTEGER,
    "ageInMonth" INTEGER,
    "ageInDay" INTEGER,

    CONSTRAINT "Patient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Memo" (
    "id" TEXT NOT NULL,
    "memoNo" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "patientId" TEXT NOT NULL,
    "isUsedInLab" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Memo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Investigations" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" TEXT,
    "code" TEXT,
    "memoId" TEXT NOT NULL,

    CONSTRAINT "Investigations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Doctor" (
    "doctorId" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "Doctor_pkey" PRIMARY KEY ("doctorId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Doctor_email_key" ON "Doctor"("email");

-- AddForeignKey
ALTER TABLE "Memo" ADD CONSTRAINT "Memo_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Investigations" ADD CONSTRAINT "Investigations_memoId_fkey" FOREIGN KEY ("memoId") REFERENCES "Memo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
