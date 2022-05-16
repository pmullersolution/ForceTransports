import { LightningElement, api, track, wire } from 'lwc';
import getDocuments from '@salesforce/apex/coreDocuments.getDocuments';

const columns = [
    { label: 'Nombre', fieldName: 'name', type: 'text' },
    { label: 'Tipo documento', fieldName: 'type', type: 'text' },
    { label: 'Tamaño', fieldName: 'sizeDoc', type: 'integer' },
    { label: 'Creado por', fieldName: 'createdBy', type: 'text' }
];

export default class CoreDocuments extends LightningElement {
    data = [];
    columns = columns;
    @track errorData;
    @api recordId;

    @wire(getDocuments, { idObject: '$recordId' })
    dataRecord({ data, error }) {
        if (data) {
            this.data = data;
        } else if (error) {
            this.errorData = error;
        }
    }

}