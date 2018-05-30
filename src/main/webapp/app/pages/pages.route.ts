import { Routes } from '@angular/router';

import { UserRouteAccessService } from '../shared';
import {PestoreSwaggerRoute, PetstoreSwaggerComponent} from "./petstore-swagger";

const PAGES_ROUTES = [
    PestoreSwaggerRoute
];

export const pagesState: Routes = [
    // {
    //   path: 'apitest',
    //   component: PetstoreSwaggerComponent
    // },
    {
        path: '',
        // component: PetstoreSwaggerComponent,
        // data: {
        //     authorities: []
        // },
        // canActivate: [UserRouteAccessService],
        children: PAGES_ROUTES
    },
    // ...userDialogRoute
];
