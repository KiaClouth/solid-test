import sw from '../entry-serviceworker?url';

export function GET() {
    return new Response(`self.importScripts('${sw}')`, { headers: { 'content-type': 'application/javascript' } });
}