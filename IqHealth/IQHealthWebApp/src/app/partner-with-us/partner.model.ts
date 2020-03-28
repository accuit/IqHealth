export class PartnerRequest {
    ID: number;
    Name: string;
    Sex: string;
    Email: string;
    Mobile: string;
    Address: string;
    City: string;
    State: string;
    CompanyID: number = 2;
}

export class OrganizeCamp {
    ID: number;
    Name: string;
    Sex: string;
    Email: string;
    Mobile: string;
    ExpectedCount: number;
    Address: string;
    City: string;
    State: string;
    Message: string;
    CompanyID: number = 2;
}

export class CorporateTieUp {
    ID: number;
    Name: string;
    Sex: string;
    Email: string;
    Mobile: string;
    CompanyName: string;
    Designation: number;
    Address: string;
    City: string;
    State: string;
    Message: string;
    CompanyID: number = 2;
}