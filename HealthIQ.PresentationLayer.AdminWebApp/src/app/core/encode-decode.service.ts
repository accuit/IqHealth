
import { Base64 } from 'js-base64';
import { Injectable } from '@angular/core';

@Injectable()
export class EncodeDecodeService {

    b64EncodeUnicode(str: any) {
        // first we use encodeURIComponent to get percent-encoded UTF-8,
        // then we convert the percent encodings into raw bytes which
        // can be fed into btoa.
        return btoa(encodeURIComponent(str).replace(/%([0-9A-F]{2})/g,
            // function toSolidBytes(match, p1) {
            (match, p1) => {
                // console.debug('match: ' + match);
                return String.fromCharCode(("0x" + p1) as any);
            }));
    }

    b64DecodeUnicode(str) {
        // Going backwards: from bytestream, to percent-encoding, to original string.
        return decodeURIComponent(atob(str).split('').map(function (c) {
            return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
        }).join(''));
    }

}