import { Route } from '@angular/router';

import { PetstoreSwaggerComponent } from './';

export const HOME_ROUTE: Route = {
    path: '',
    component: PetstoreSwaggerComponent,
    data: {
        authorities: [],
        pageTitle: 'swagger.title'
    }
};
