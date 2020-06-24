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

export class FileToUpload {
    fileName: string = "";
    fileSize: number = 0;
    fileType: string = "";
    lastModifiedTime: number = 0;
    lastModifiedDate: Date = null;
    fileAsBase64: string = "";
  }
