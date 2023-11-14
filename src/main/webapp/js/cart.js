var numbers = {}; // Object to store the numbers for each group

// Initialize the numbers for each group
<c:forEach var="group" items="${groupList}">
    numbers['group${group.id}'] = ${group.counter};
</c:forEach>

function incrementNumber(group) {
    numbers[group]++;
    updateNumberElement(group);
}

function decrementNumber(group) {
    if (numbers[group] > 1) {
        numbers[group]--;
        updateNumberElement(group);
    }
}

function updateNumberElement(group) {
    var numberElement = document.getElementById('number-' + group);
    numberElement.innerText = numbers[group];
}