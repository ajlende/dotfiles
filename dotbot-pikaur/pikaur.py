import os
import sys

_dir = os.path.dirname(os.path.realpath(__file__))
sys.path.insert(1, "{}/pikaur-git".format(_dir))

# pylint: disable=E0401,E0611
import dotbot
import pikaur
from pikaur.args import (parse_args)
from pikaur.main import (cli_install_packages)


class Pikaur(dotbot.Plugin):
    """
    Installs Arch Linux packages andAUR packages with pikaur.
    """

    _directives = ['pacman', 'pikaur']

    def __init__(self, context):
        self.successes = []
        self.failures = []
        self.current_pkg = None
        sys.exit = self._capture_exit
        super().__init__(context)

    def can_handle(self, directive):
        """
        Determines if the plugin can handle an action with the given directive.
        """
        return directive in self._directives

    def handle(self, directive, data):
        """
        Entry point for dotbot.
        """
        if not self.can_handle(directive):
            raise ValueError(
                'Pikaur cannot handle directive {}'.format(directive))
        return self._process_packages(directive, data)

    def _process_packages(self, directive, packages):
        """
        TODO
        """
        # results = {}
        # successful = []

        for pkg in packages:
            self.current_pkg = pkg
            self._install(pkg)
            if not any(p for p, c in self.successes if p == pkg):
                print("ERR {}".format(pkg))

        # if all([result in successful for result in results.keys()]):
        #     self._log.info(
        #         'All {} packages installed successfully'.format(directive))
        #     success = True
        # else:
        #     success = False

        # for status, amount in results.items():
        #     log = self._log.info if status in successful else self._log.error
        #     log('{} {}'.format(amount, status.value))

        print(self.successes)
        print(self.failures)

        return True

    def _install(self, pkg):
        """
        Install the package with te given name
        """
        self._log.info('Installing {}'.format(pkg))
        args = parse_args([
            "--sync",
            "--needed",
            "--noedit",
            "--noconfirm",
            pkg
        ])
        cli_install_packages(args)

        return True

    def _capture_exit(self, code):
        if code != 0:
            self.failures.append((self.current_pkg, code))
        else:
            self.successes.append((self.current_pkg, code))
