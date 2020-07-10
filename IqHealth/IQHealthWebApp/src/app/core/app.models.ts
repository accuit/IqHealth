
export class APIResponse {
    FailedValidations: string
    isSuccess: boolean;
    message: string;
    Result: any[];
    singleResult: any;
    statusCode: string;
}


export class CityModel {
    id: number;
    name: string;
}

export class UserMaster {
    id: number;
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
    id: number;
    name: string;
    Sex: string;
    Age: number;
    email: string;
    mobile: string;
    BookingDate: Date;
    BookingTime: string;
    DoctorID: number;
    CompanyID: number = 2;
}

export class JobApplication {
    id: number;
    firstName: string;
    lastName: string;
    email: string;
    phone: string;
    resumeText: string;
    address: string;
    city: string;
    state: string;
    zipCode: string;
    CompanyID: number = 2;
}

export class Doctor {
    id: number;
    firstName: string;
    lastName: string;
    email: string;
    mobile: string;
    designation: string;
    dateOfBirth: string;
    experience: number;
    specialist: number;
    imageUrl: string;
    hospital: string;
    about: string;
    logoUrl: string;
    specialityID: number
}

export class Speciality {
    id: number;
    speciality: string;
    title: string;
    logoUrl?: string;
    companyID: number;
}


export class ServicesModel {
    id: number;
    name: string;
    description: string;
    imageUrl: string;
    pageUrl: string;
    type: string;
    servicesIncluded: string;
    createdDate: string;
    updatedDate: string;
    isDeleted: number;
}


export class PackageCategory {
    id: number;
    name: string;
    title: string;
    subTitle?: string;
    imageUrl: string;
    packageMasters: PackageMaster[]
}

export class PackageMaster {
    id: number;
    name: string;
    title: string;
    subTitle?: string;
    about: string;
    catgID: number;
    cost: number;
    imageUrl: string;
    Status: number;
    CreatedDate: string;
    IsDeleted: number;
    TestMasters: TestMaster[]
}

export class TestMaster {
    id: number;
    name: string;
    Type: number;
    preTestInfo: string;
    cost: number;
    resultInHours: number;
    components: string;
    createdDate: string;
    updatedDate: string;
    isDeleted: number
}


