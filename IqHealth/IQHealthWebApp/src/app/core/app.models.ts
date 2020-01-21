
export class APIResponse {
    FailedValidations: string
    IsSuccess: boolean;
    Message: string;
    Result: any[];
    SingleResult: any;
    StatusCode: string;
}


export class CityModel {
    id: number;
    Name: string;
}

export class UserMaster {
    ID: number;
    firstname: string;
    lastname: string;
    age: number;
    mobile: string;
    email: string;
    password: string;
    oldPassword: string;
    confirmPassword: string;
    sex: number;
    address: string;
    city: string;
    UserType: number;
    state: number;
    userStatus: number;
    StauserTypetus: number;
}

export class BookingMaster {
    id: number;
    firstname: string;
    lastname: string;
    age: number;
    mobile: string;
    email: string;
    sex: number;
    bookingDate: Date;
    collectionType: number;
    Address: string;
    City: string;
    Landmark: string;
    PinCode: string;
    CreatedDate: string;
    IsDeleted: number;
    Status: number;
}

export class DoctorAppointment {
    ID: number;
    Name: string;
    Sex: string;
    Age: number;
    Email: string;
    Mobile: string;
    BookingDate: Date;
    BookingTime: string;
    DoctorID: number;
    CompanyID: number = 2;
}

export class Doctor {
    ID: number;
    FirstName: string;
    LastName: string;
    Email: string;
    Mobile: string;
    Designation: string;
    DateOfBirth: string;
    Experience: number;
    Specialist: number;
    ImageUrl: string;
    Hospital: string;
    About: string;
    LogoUrl: string;
    SpecialityID: number
}

export class Speciality {
    ID: number;
    Speciality: string;
    Title: string;
    LogoUrl?: string;
    CompanyID: number;
}


export class ServicesModel {
    ID: number;
    Name: string;
    Description: string;
    ImageUrl: string;
    PageUrl: string;
    Type: string;
    ServicesIncluded: string;
    CreatedDate: string;
    UpdatedDate: string;
    IsDeleted: number;
}


export class PackageCategory {
    ID: number;
    Name: string;
    Title: string;
    SubTitle?: string;
    ImageUrl: string;
    PackageMasters: PackageMaster[]
}

export class PackageMaster {
    ID: number;
    Name: string;
    Title: string;
    SubTitle?: string;
    About: string;
    CatgID: number;
    Cost: number;
    ImageUrl: string;
    Status: number;
    CreatedDate: string;
    IsDeleted: number;
    TestMasters: TestMaster[]
}

export class TestMaster {
    ID: number;
    Name: string;
    Type: number;
    PreTestInfo: string;
    Cost: number;
    ResultInHours: number;
    Components: string;
    CreatedDate: string;
    UpdatedDate: string;
    IsDeleted: number
}


