/*
  Warnings:

  - You are about to drop the column `admissionId` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `ageInDay` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `ageInMonth` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `ageInYear` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `bedCabin` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `currentAddress` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `currentDistrict` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `currentDivision` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `currentThana` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `currentUpazila` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `currentZipCode` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `dateOfBirth` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `dateOfRegistration` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `emergencyName` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `emergencyPhone` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `emergencyRelationtToThePatient` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `fathersName` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `firstName` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `indoorPatient` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `lastName` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `mothersName` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `outdoorPatient` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `permanentAddress` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `permanentDistrict` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `permanentDivision` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `permanentThana` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `permanentUpazila` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `permanentZipCode` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `unit` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the `Doctor` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Investigations` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Memo` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Investigations" DROP CONSTRAINT "Investigations_memoId_fkey";

-- DropForeignKey
ALTER TABLE "Memo" DROP CONSTRAINT "Memo_patientId_fkey";

-- AlterTable
ALTER TABLE "Patient" DROP COLUMN "admissionId",
DROP COLUMN "ageInDay",
DROP COLUMN "ageInMonth",
DROP COLUMN "ageInYear",
DROP COLUMN "bedCabin",
DROP COLUMN "currentAddress",
DROP COLUMN "currentDistrict",
DROP COLUMN "currentDivision",
DROP COLUMN "currentThana",
DROP COLUMN "currentUpazila",
DROP COLUMN "currentZipCode",
DROP COLUMN "dateOfBirth",
DROP COLUMN "dateOfRegistration",
DROP COLUMN "emergencyName",
DROP COLUMN "emergencyPhone",
DROP COLUMN "emergencyRelationtToThePatient",
DROP COLUMN "fathersName",
DROP COLUMN "firstName",
DROP COLUMN "indoorPatient",
DROP COLUMN "lastName",
DROP COLUMN "mothersName",
DROP COLUMN "outdoorPatient",
DROP COLUMN "permanentAddress",
DROP COLUMN "permanentDistrict",
DROP COLUMN "permanentDivision",
DROP COLUMN "permanentThana",
DROP COLUMN "permanentUpazila",
DROP COLUMN "permanentZipCode",
DROP COLUMN "phone",
DROP COLUMN "unit",
ADD COLUMN     "address" TEXT,
ADD COLUMN     "admissionTime" TEXT,
ADD COLUMN     "contactNo" TEXT,
ADD COLUMN     "fatherName" TEXT,
ADD COLUMN     "maritalStatus" TEXT,
ADD COLUMN     "patientName" TEXT,
ADD COLUMN     "registrationNo" TEXT,
ADD COLUMN     "religion" TEXT;

-- DropTable
DROP TABLE "Doctor";

-- DropTable
DROP TABLE "Investigations";

-- DropTable
DROP TABLE "Memo";
