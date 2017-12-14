const shell = require('shelljs');
const inquirer = require('inquirer');
const os = require('os');

const homedir = '../.'; // os.homedir();

const pruneSymlinks = () => {
  const brokenLinks = shell.exec(`find -L ${homedir} -maxdepth 1 -type l`, { silent: true }).split('\n');

  // eslint-disable-next-line no-restricted-syntax
  for (const brokenLink of brokenLinks) {
    shell.exec(`unlink ${brokenLink}`, { silent: true });
  }
};

const createSymlinks = async () => {
  const filePaths = shell.exec(`find ${homedir} -type f -maxdepth 1 -name ".*" -not -name .DS_Store -not -name .git -not -name .osx | sed -e 's|//|/|' | sed -e 's|./.|.|'`, { silent: true })
    .stdout
    .split('\n')
    .filter(x => x);

  // eslint-disable-next-line no-restricted-syntax
  for (const filePath of filePaths) {
    const fileName = filePath.split('/').pop();
    if (shell.test('-e', `${homedir}/${fileName}`)) {
      const question = {
        name: 'overwrite',
        type: 'confirm',
        message: `${fileName} already exists, do you want to overwrite it?`,
      };
      // eslint-disable-next-line no-await-in-loop
      const answer = await inquirer.prompt(question);

      if (answer.overwrite) {
        shell.exec(`ln -fs ${filePath} ${homedir}/${fileName}`);
      }
    } else {
      shell.exec(`ln -fs ${filePath} ${homedir}/${fileName}`);
    }
  }
};


(async function main() {
  try {
    pruneSymlinks();
    createSymlinks();
    // const question = [
    //   {
    //     name: 'hello question',
    //     type: 'input',
    //     message: 'hello?',
    //   },
    //   {
    //     name: 'is it me question',
    //     type: 'confirm',
    //     message: 'is it me you\'re looking for?',
    //   },
    // ];

    // const answer = await inquirer.prompt(question);

  // shell.echo(answer);
  } catch (err) {
    console.log(err);
  }
}());
