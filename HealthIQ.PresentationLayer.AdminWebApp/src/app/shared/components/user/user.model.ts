export class UserMaster {
    userID: number;
    firstName: string;
    lastName: string;
    mobile: string;
    email: string;
    imagePath?: string;
    image?: string;
    password: string;
    oldPassword?: string;
    confirmPassword?: string;
    address?: string;
    city?: string;
    state?: number;
    pin?: string;
    userStatus: number;
    gUID?: string;
    roles?: Array<string>;
    token?: string;
    createdDate?: Date;
    createdBy: number;
    isStudent: boolean;
    isCustomer: boolean;
    isEmployee: boolean;
    isAdmin: boolean;
    isDeleted:boolean;
    UserRole : UserRole;
}

export class UserRole {
    userId: number;
    roleId: number;
    roleMaster?: RoleMaster;
}

export class RoleMaster {
    id: number;
    name: string;
    code: string;
}