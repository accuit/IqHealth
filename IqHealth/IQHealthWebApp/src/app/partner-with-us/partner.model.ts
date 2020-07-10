export class PartnerRequest {
    id: number;
    name: string;
    Sex: string;
    email: string;
    mobile: string;
    Address: string;
    City: string;
    State: string;
    CompanyID: number = 2;
}

export class OrganizeCamp {
    id: number;
    name: string;
    Sex: string;
    email: string;
    mobile: string;
    ExpectedCount: number;
    Address: string;
    City: string;
    State: string;
    Message: string;
    CompanyID: number = 2;
}

export class CorporateTieUp {
    id: number;
    name: string;
    Sex: string;
    email: string;
    mobile: string;
    CompanyName: string;
    designation: number;
    Address: string;
    City: string;
    State: string;
    Message: string;
    CompanyID: number = 2;
}