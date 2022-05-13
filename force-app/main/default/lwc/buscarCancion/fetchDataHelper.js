export default function fetchDataHelper(autor, cancion) {
    return fetch('https://api.lyrics.ovh/v1/:' + autor + '/:' + cancion, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json; charset=utf-8',
        }
    }).then((response) => response.json());
}