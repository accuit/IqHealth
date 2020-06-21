//Metadata
export interface RouteInfo {
    path: string;
    title: string;
    type: string;
    icontype: string;
    collapse?: string;
    children?: ChildrenItems[];
    roles? : Array<string>;
}

export interface ChildrenItems {
    path: string;
    title: string;
    ab: string;
    type?: string;
}