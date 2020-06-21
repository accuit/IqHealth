export class UserMaster {
    userID: number;
    firstName: string;
    lastName: string;
    age: number;
    mobile: string;
    email: string;
    imageUrl: string;
    password: string;
    oldPassword: string;
    confirmPassword: string;
    sex: number;
    address: string;
    city: string;
    state: number;
    pinCode: string;
    userStatus: number;
    roles: Array<string>;
    token?: string;
    createdDate: Date;
    userRoles: Array<UserRole>
}

export class UserRole {
    userId: number;
    roleId: number;
    roleMaster: RoleMaster;
}

export class RoleMaster {
    id: number;
    name: string;
    code: string;
}