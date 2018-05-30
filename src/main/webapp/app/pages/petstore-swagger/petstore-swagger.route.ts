import { Route } from '@angular/router';

import { PetstoreSwaggerComponent } from './';
import {UserRouteAccessService} from "../../shared";

export const PestoreSwaggerRoute: Route = {
    path: 'apitest',
    component: PetstoreSwaggerComponent,
    data: {
        authorities: [/*'ROLE_USER'*/],
        pageTitle: 'swagger.title',
        canActivate: [UserRouteAccessService]
    }
};
