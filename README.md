# rspamd-learn-helper
Utility script for rspamd spam and ham training.

## Description
The `rspamd-learn-helper` is a utility script designed to streamline the training process for SPAM and HAM filters in the [rspamd](https://rspamd.com/) email filtering system. It provides an easy and automated way to enhance the effectiveness of rspamd's spam detection by allowing users to actively contribute to the training process.

**How it Works:**
- Users create specific folders such as ".TrainingSpam" and ".TrainingHam" in their mail directories.
- The script searches for these user-defined training folders within specified directories.
- Upon finding a training folder, the script executes the appropriate `rspamc learn` command, training rspamd for improved spam detection.

**Key Features:**
- **User Contribution:** Any mail user can contribute to the improvement of spam filtering by creating designated training folders.
- **Automated Training:** The script automates the training process, reducing the manual effort required to enhance rspamd's filter accuracy.
- **Flexible Configuration:** Easily configure and customize the script to fit your mail server's directory structure.

## Installation
### Prerequisites
Before using the script, ensure that the following prerequisites are met:
- [rspamd](https://rspamd.com/) is installed on your system.
- The `rspamc` command-line utility is available.

### Steps
1. Clone the repository to your local machine:
    ```bash
    git clone https://github.com/filipnet/rspamd-learn-helper.git
    ```

2. Change into the project directory:
    ```bash
    cd rspamd-learn-helper
    ```

3. Ensure the script has execute permissions:
    ```bash
    chmod +x rspamd-learn-helper.sh
    ```

## Usage
1. Run the script with the following command:
    ```bash
    ./rspamd-learn-helper.sh
    ```

2. The script will check if rspamd and rspamc are installed. If not, it will display an error message and exit.

3. If rspamd and rspamc are installed, the script will proceeding to search for training folders in user directories.

4. The script will then display information about any found training folders, outputting in yellow. It will also execute the appropriate `rspamc learn` command for each found folder.

## Scheduled Task
For automated training, consider scheduling the script as a recurring task using tools like cron.

Example of running the script every day at 3 AM:
```bash
0 3 * * * /path/to/rspamd-learn-helper/rspamd-learn-helper.sh
```

## Contributions
Contributions to this project are welcome! Whether you want to add features, fix bugs, or improve documentation, feel free to submit a pull request.

## License
This project is licensed under the BSD License, take a look at LICENSE for details.
