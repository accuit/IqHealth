export class StudentInvoice {
    id: number;
    name: string;
    invoiceDate: Date;
    subTotal: number;
    tax: number;
    status: number;
    paymentStatus: number;
    paymentMode: number;
    copyEmail: string;
    address: string;
    city: number;
    state: number;
    pin: string;
    country: number;
    mobile: string;
    userID: number;
    courseID?: number;
    isDeleted: number;
    createdDate: Date;
    createdBy: number;
    modifiedDate: Date;
    modifiedBy: number;
    companyID: number;
}