
export class CourseMaster {
    ID: number;
    Name: string;
    About: string;
    ImageUrl: string;
    SubCourses: SubCourses[];
    CourseCurriculums: CourseCurriculum[];
    CompanyID: number;
}

export class SubCourses {
    ID: number;
    Name: string;
    Duration: number;
    MinQualification: string;
    MinAge: number;
    MaxAge: Number;
    IndianAdmissionFee: string;
    ForeignAdmissionFee: string;
    IndianOtherFee: string;
    ForeignOtherFee: string;
    CourseMasterID: number;
    CompanyID: number;

}

export class CourseCurriculum {
    ID: number;
    Name: string;
    CourseMasterID: number;

}