import { EnquiryTypeEnum } from '../pages/shared/model/enums';

export class OnlineEnquiry {
    ID: number;
    Type: number;
    TypeValue: number;
    Name: string;
    Email: string;
    Phone: string;
    AltPhone: string;
    Subject: string;
    Message: string;
    Status: number;
    Address: string;
    Place: string;
    City: string;
    State: string;
    Country: number;
    CaptchaText: string;
    EnquiryType: EnquiryTypeEnum;
    CaptchaVerified: number;
    CompanyID: number;
}