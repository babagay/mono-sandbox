import { Route } from '@angular/router';

import { PetstoreSwaggerComponent } from './';

export const PestoreSwaggerRoute: Route = {
    path: 'pestore-swagger',
    component: PetstoreSwaggerComponent,
    data: {
        authorities: [],
        pageTitle: 'swagger.title'
    }
};
