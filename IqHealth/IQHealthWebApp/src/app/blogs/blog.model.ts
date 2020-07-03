export class BlogMaster {
    id: number;
    name: string;
    title: string;
    subTitle: string;
    postDate: Date;
    bannerImage: string;
    thumbImage: string;
    sequence: number;
    content: string;
    tags: string;
    isLive: boolean;
    isDeleted: boolean;
    createdBy: number;
    createdDate: string;
    updatedDate: Date;
    updatedBy: number;
    companyID: number;
    blogCategoryMappings: Array<BlogCategoryMappings>
}


export class BlogCategoryMappings {
    categoryID: number;
    blogID: number;
    blogCategoryMaster: BlogCategoryMaster;
}

export class  BlogCategoryMaster {
    id: number;
    name: string;
    title: string;
    type: number;
    bannerImage: string;
    isDeleted: boolean;
    isLive: boolean;
    createdDate: Date;
    createdBy: number;
    updatedDate: Date;
    updatedBy: number;
    companyID: number;
}