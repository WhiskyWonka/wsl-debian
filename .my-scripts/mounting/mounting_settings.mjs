import fs from 'fs';
import path from 'path';
// import inquirer from 'inquirer';
import prompts from 'prompts';
import chalk from 'chalk';

const configPath = path.join(process.cwd(), 'config.json');

// Leer el archivo config.json
let config = JSON.parse(fs.readFileSync(configPath, 'utf8'));
let configOriginal = JSON.parse(JSON.stringify(config));


async function showMenu() {
    console.clear();

    // Opciones de montajes
    const mountChoices = config.directories.map((dir, index) => ({
        title: `${dir.mount === true ? '[x]' : dir.mount === 'del' ? '[-]' : '[ ]'} local: ${dir.local_path} <<< share: ${dir.share_path}`,
        // title: `${dir.mount ? '[x]' : '[ ]'} local: ${dir.local_path} <<< share: ${dir.share_path}`,
        value: index,
    }));

    // Opciones de acciones
    const actionChoices = [
        { title: '[s] save mounts', value: 'save' },
        { title: '[+] add mount', value: 'add' },
        { title: '[e] exit', value: 'exit' }
    ];

    const { action } = await prompts({
        type: 'select',
        name: 'action',
        message: 'Selecciona una opción:',
        choices: [
            { title: chalk.yellow('Mounts'), value: null, disabled: true },
            ...mountChoices,
            { title: chalk.yellow('Actions'), value: null, disabled: true },
            ...actionChoices
        ]
    });

    if (typeof action === 'number' && action >= 0 && action < config.directories.length) {
        await toggleMount(action);
    } else if (action === 'save') {
        saveConfig();
    } else if (action === 'add') {
        await addMount();
        console.log(chalk.green('Montaje agregado.'));
    } else if (action === 'exit') {
        console.log(chalk.yellow('Saliendo...'));
        process.exit(0); // Salir del programa
    }
}


// async function showMenu() {
//     // Clear the console screen
//     console.clear();

//     // Opciones de montajes
//     const mountChoices = config.directories.map((dir, index) => ({
//         name: `${dir.mount ? '[x]' : '[ ]'} local: ${dir.local_path} <<< share: ${dir.share_path}`,
//         value: index
//     }));

//     // Opciones de acciones
//     const actionChoices = [
//         { name: '[s] save mounts', value: 'save' },
//         { name: '[+] add mount', value: 'add' },
//         { name: '[e] exit', value: 'exit' }
//     ];

//     const { action } = await inquirer.prompt({
//         type: 'list',
//         name: 'action',
//         message: 'Selecciona una opción:',
//         choices: [
//             { title: chalk.yellow('Mounts'), value: null, disabled: true },
//             ...mountChoices,
//             { title: chalk.yellow('Actions'), value: null, disabled: true },
//             ...actionChoices
//         ]
//     });

//     // Validar el valor de `action`
//     if (action === undefined) {
//         console.log(chalk.red('Error: Selección no válida. Inténtalo de nuevo.'));
//         await showMenu(); // Volver a mostrar el menú
//         return;
//     }

//     // Ejecutar la acción correspondiente
//     if (action === 'add') {
//         await addMount();
//     } else if (action === 'save') {
//         saveConfig();
//         console.log(chalk.green('Configuración guardada correctamente.'));
//         await showMenu();
//     } else if (action === 'exit') {
//         console.log(chalk.yellow('Saliendo...'));
//         process.exit(0);
//     } else if (typeof action === 'number' && action >= 0 && action < config.directories.length) {
//         await toggleMount(action);
//     } else {
//         console.log(chalk.red('Error: Opción no válida. Inténtalo de nuevo.'));
//         await showMenu(); // Volver a mostrar el menú
//     }
// }

// Función para añadir un nuevo montaje
async function addMount() {
    const { local_path, share_path } = await prompts([
        {
            type: 'text',
            name: 'local_path',
            message: 'Introduce la ruta local:'
        },
        {
            type: 'text',
            name: 'share_path',
            message: 'Introduce la ruta compartida:'
        }
    ]);

    config.directories.push({ local_path, share_path, mount: true });
    showMenu();
}

// Función para cambiar el estado de un montaje
async function toggleMount(index) {
    if (config.directories[index].mount === true) {
        config.directories[index].mount = false;
    } else if (config.directories[index].mount === false) {
        config.directories[index].mount = 'del';
    } else {
        config.directories[index].mount = true;
    }
    showMenu();
}

// Función para guardar los cambios en el archivo config.json
async function saveConfig() {

    const confirm = await askConfirmation('Do you want to save the changes?');

    if (!confirm) {
        config = JSON.parse(JSON.stringify(configOriginal));
        showMenu();
        return;
    }

    fs.writeFileSync(configPath, JSON.stringify(config, null, 2));

    config.directories = config.directories.filter(dir => dir.mount !== 'del');

    fs.writeFileSync(configPath, JSON.stringify(config, null, 2));

    showMenu();
}

async function askConfirmation(message) {
    const { confirm } = await prompts({
        type: 'confirm',
        name: 'confirm',
        message
    });
    return confirm;
}

// Iniciar el menú
showMenu();