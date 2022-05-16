import { LightningElement, api } from 'lwc';
import getDocuments from '@salesforce/apex/coreDocuments.getDocuments';

const columns = [
    { label: 'Nombre', fieldName: 'Title' },
    { label: 'Tipo documento', fieldName: 'FileType', type: 'text' },
    { label: 'Tamaño', fieldName: 'ContentSize', type: 'integer' },
    { label: 'Creado por', fieldName: 'CreatedBy.Name', type: 'text' }
];

export default class CoreDocuments extends LightningElement {
    data = [];
    columns = columns;

    async connectedCallback() {
        const data = await getDocuments();
        this.data = data;
    }
}