export const fetchTodos = () => (
    $.ajax({
    method: 'GET',
    url: '/api/todos'
}));

// export const fetchTodos = () => (
//     $.ajax({
//         method: 'POST',
//         url: '/api/todos'
// }));

