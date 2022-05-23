import { LightningElement, api, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getDocuments from '@salesforce/apex/coreDocuments.getDocuments';
import uploadFile from '@salesforce/apex/coreDocuments.uploadFile'

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
    fileData

    @wire(getDocuments, { idObject: '$recordId' })
    dataRecord({ data, error }) {
        if (data) {
            this.data = data;
        } else if (error) {
            this.errorData = error;
        }
    }

    openfileUpload(event) {
        const file = event.target.files[0]
        var reader = new FileReader()
        reader.onload = () => {
            var base64 = reader.result.split(',')[1]
            this.fileData = {
                'filename': file.name,
                'base64': base64,
                'recordId': this.recordId
            }
            console.log(this.fileData)
        }
        reader.readAsDataURL(file)
    }

    handleClick() {
        const { base64, filename, recordId } = this.fileData
        uploadFile({ base64, filename, recordId }).then(result => {
            this.fileData = null
            let title = `${filename} uploaded successfully!!`
            this.toast(title)
            this.refreshDataTable();
        })
    }

    toast(title) {
        const toastEvent = new ShowToastEvent({
            title,
            variant: "success"
        })
        this.dispatchEvent(toastEvent)
    }

    async refreshDataTable() {
        await getDocuments({ idObject: this.recordId }).then(result => {
            this.data = data;
        })
    }

}