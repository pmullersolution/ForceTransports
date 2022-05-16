import { LightningElement, track, api } from 'lwc';
import fetchDataHelper from './fetchDataHelper';
import setSongSync from '@salesforce/apex/songs.setSongSync';

export default class BuscarCancion extends LightningElement {
    @api artista;
    @api cancion;
    @api letra;
    @track error;


    
    handleArtistaChange(event) {
        this.artista = event.target.value;
    }

    handleCancionChange(event) {
        this.cancion = event.target.value;
    }

    async handleClick(event) {
        const data = await fetchDataHelper(this.artista, this.cancion);
        this.letra = JSON.stringify(data.lyrics);
        await setSongSync({ autor: this.artista, cancion: this.cancion, letra: this.letra });
        alert('Funciono!!!!!!!!');
    }

    showToast() {
        const event = new ShowToastEvent({
            title: 'Exitoso',
            message: 'Se inserto la canción',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(event);
    }

}