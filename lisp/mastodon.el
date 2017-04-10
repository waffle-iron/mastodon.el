;;; mastodon.el -- Mastodon client for Emacs

;; Copyright (C) 2017 Johnson Denen
;; Author: Johnson Denen <johnson.denen@gmail.com>
;; Version: 0.1.0
;; Homepage: https://github.com/jdenen/mastodon.el

;; This file is not part of GNU Emacs.

;; This file is part of mastodon.el.

;; mastodon.el is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; mastodon.el is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with mastodon.el.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; mastodon.el is an Emacs client for Mastodon <https://github.com/tootsuite/mastodon>,
;; the federated microblogging social network. It is very much a work-in-progress, but
;; it is a labor of love.

;;; Code:

(defgroup mastodon nil
  "Interface with Mastodon."
  :prefix "mastodon-"
  :group 'external)

(defcustom mastodon-instance-url "https://mastodon.social"
  "Base URL for the Masto instance from which you toot."
  :group 'mastodon
  :type 'string)

(defcustom mastodon-token-file (concat user-emacs-directory "mastodon.plstore")
  "File path where Mastodon access tokens are stored."
  :group 'mastodon
  :type 'file)

(defvar mastodon--api-version "v1")

(defun mastodon-version ()
  "Message package version."
  (interactive)
  (with-temp-buffer
    (insert-file-contents "../.version")
    (message
     (concat "mastodon.el v" (buffer-string)))))

;;;###autoload
(defun mastodon-toot ()
  "Update a Mastodon instance with new toot. Content is captured in a new buffer."
  (interactive)
  (progn
    (require 'mastodon-toot)
    (switch-to-buffer-other-window (get-buffer-create "*new toot*"))
    (mastodon-toot-mode t)))

;;;###autoload
(defun mastodon-register ()
  "Registers mastodon.el with the Mastodon instance."
  (interactive)
  (progn
    (require 'mastodon-auth)
    (mastodon--store-client-id-and-secret)))

(provide 'mastodon)
;;; mastodon.el ends here
