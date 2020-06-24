export class UserMaster {
    userID: number;
    firstName: string;
    lastName: string;
    mobile: string;
    email: string;
    imageUrl?: string;
    image?: string;
    password: string;
    oldPassword?: string;
    confirmPassword?: string;
    address?: string;
    city?: string;
    state?: number;
    pin?: string;
    userStatus: number;
    roles?: Array<string>;
    token?: string;
    createdDate?: Date;
    createdBy: number;
    isStudent: boolean;
    userRoles?: Array<UserRole>;
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