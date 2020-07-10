
export class CourseMaster {
    id: number;
    name: string;
    about: string;
    imageUrl: string;
    subCourses: SubCourses[];
    courseCurriculums: CourseCurriculum[];
    companyID: number;
}

export class SubCourses {
    id: number;
    name: string;
    duration: number;
    minQualification: string;
    minAge: number;
    maxAge: Number;
    indianAdmissionFee: string;
    foreignAdmissionFee: string;
    indianOtherFee: string;
    foreignOtherFee: string;
    courseMasterID: number;
    companyID: number;

}

export class CourseCurriculum {
    id: number;
    name: string;
    courseMasterID: number;

}