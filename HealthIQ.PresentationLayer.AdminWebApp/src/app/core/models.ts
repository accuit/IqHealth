export class APIResponse {
    failedValidations: string
    isSuccess: boolean;
    message: string;
    result: any[];
    singleResult: any;
    statusCode: string;
}


export class CityModel {
    id: number;
    Name: string;
}