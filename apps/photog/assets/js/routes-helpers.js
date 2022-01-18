export const ALBUM_FILTER_QUERY_PARAM_NAME = 'album-filter-mode';

export const PERSON_FILTER_QUERY_PARAM_NAME = 'person-filter-mode';

export const getPersonsInAlbum = (album, images) => {
    const personsMap = new Map();

    images.forEach((image) => {
        image.persons.forEach((person) => {
            personsMap.set(person.name, person);
        });
    });

    return [...personsMap.keys()].sort((a, b) => a.localeCompare(b)).map((name) => personsMap.get(name));
};

export const sortImagesCallback = (thumbnailList, sortDirection) => {
    thumbnailList.sort((a, b) => {
        const aTime = new Date(a.creation_time.raw).getTime();
        const bTime = new Date(b.creation_time.raw).getTime();
        
        return sortDirection ? aTime - bTime : bTime - aTime;
    });
};