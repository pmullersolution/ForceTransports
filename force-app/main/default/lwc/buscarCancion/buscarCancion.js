import { LightningElement, track, api } from 'lwc';
import fetchDataHelper from './fetchDataHelper';
import getSongSync from '@salesforce/apex/songs.getSongSync';

export default class BuscarCancion extends LightningElement {
    @api artista;
    @api cancion;
    @track letra;
    @track error;


    
    handleArtistaChange(event) {
        this.artista = event.target.value;
    }

    handleCancionChange(event) {
        this.cancion = event.target.value;
    }

    async handleClick(event) {
        const data = await fetchDataHelper(this.artista, this.cancion);
        let letter = data.lyrics;
        this.letra = letter;
        debugger;
    }

    LlamarApex() {
        getSongSync({ autor: '$artista', cancion: '$cancion', IdCancion: 'null', act: 'false' })
            .then(result => {
                this.letra = result;
            })
            .catch(error => {
                this.error = error;
            });
    }

}