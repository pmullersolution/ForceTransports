import { LightningElement, track, api } from 'lwc';
import fetchDataHelper from './fetchDataHelper';
import getSongSync from '@salesforce/apex/songs.getSongSync';
import crearCancion from '@salesforce/apex/songs.crearCancion';

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
        getSongSync({ autor: this.artista, cancion: this.cancion, IdCancion: 'null', act: 'false' })
            .then(result => {
                this.letra = result;
                crearCancion(JSON.stringify( this.artista, this.cancion, this.letra) );
            })
            .catch(error => {
                this.error = error;
            });
    }

}