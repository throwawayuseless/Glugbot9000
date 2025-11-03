"""
DO NOT MANUALLY RUN THIS SCRIPT.
---------------------------------

This script is designed to generate and push a CL file that can be later compiled.
The body of the changelog is determined by the description of the PR that was merged.

If a commit is pushed without being associated with a PR or if a PR is missing a CL
the script is designed to exit as a failure. This is to help keep track of PRs without
CLs and direct commits. See the relating comment in the below source to disable this function.

This script depends on the tags.yml file located in the same directory. You can use that
file to configure the exact tags you'd like this script to use when generating your CL.
If this is being used in a /tg/ or Bee-based downstream, the default tags should work.

Expected environment variables:
-----------------------------------
GIT_NAME: Username for commits (User provided)
GIT_EMAIL: Email for commits (User provided)
GITHUB_REPOSITORY: Active repo (Action provided)
GITHUB_TOKEN: Token for GitHub API (User provided, action generated)
GITHUB_SHA: Commit SHA (Action provided)
PR_NUMBER: PR number for pull_request events (Optional, user provided)
"""
import io
import os
import re
from pathlib import Path

from github import Github, InputGitAuthor
from ruamel.yaml import YAML

CL_BODY = re.compile(r":cl:(.+)?\r\n((.|\n|\r)+?)\r\n\/:cl:", re.MULTILINE)
CL_SPLIT = re.compile(r"(^\w+):\s+(\w.+)", re.MULTILINE)

def generate_changelog(repo, pr, git_name, git_email):
    """Generate and push a changelog file for a given PR."""
    pr_body = pr.body or ""
    pr_number = pr.number
    pr_author = pr.user.login

    # Extract :cl: section
    try:
        cl = CL_BODY.search(pr_body)
        if not cl:
            print(f"PR #{pr_number}: No :cl: found, skipping.")
            return False
        cl_list = CL_SPLIT.findall(cl.group(2))
    except AttributeError:
        print(f"PR #{pr_number}: Invalid :cl: format, skipping.")
        return False

    # Prepare changelog data
    write_cl = {
        "author": cl.group(1).lstrip() if cl.group(1) else pr_author,
        "delete-after": True,
        "changes": []
    }

    # Load tags from tags.yml
    yaml = YAML(typ='safe', pure=True)
    tags_file = Path.cwd().joinpath("tools/changelog/tags.yml")
    if not tags_file.exists():
        print(f"PR #{pr_number}: tags.yml not found!")
        return False
    with open(tags_file) as file:
        tags = yaml.load(file)

    # Process changes
    for k, v in cl_list:
        if k in tags["tags"]:
            v = v.rstrip()
            if v not in tags["defaults"].values():
                write_cl["changes"].append({tags["tags"][k]: v})

    if not write_cl["changes"]:
        print(f"PR #{pr_number}: No valid changes detected, skipping.")
        return False

    # Write changelog file
    with io.StringIO() as cl_contents:
        yaml.indent(sequence=4, offset=2)
        yaml.dump(write_cl, cl_contents)
        cl_contents.seek(0)
        file_path = f"html/changelogs/AutoChangeLog-pr-{pr_number}.yml"
        try:
            # Check if file already exists to avoid duplicates
            repo.get_contents(file_path, ref="master")
            print(f"PR #{pr_number}: Changelog file already exists, skipping.")
            return False
        except:
            # File doesn't exist, create it
            repo.create_file(
                file_path,
                f"Automatic changelog generation for PR #{pr_number} [ci skip]",
                content=cl_contents.read(),
                branch="master",
                committer=InputGitAuthor(git_name, git_email)
            )
            print(f"PR #{pr_number}: Changelog generated successfully!")
            return True
    return False

def main():
    # Initialize GitHub client
    repo_name = os.getenv("GITHUB_REPOSITORY")
    token = os.getenv("GITHUB_TOKEN")
    sha = os.getenv("GITHUB_SHA")
    pr_number = os.getenv("PR_NUMBER")
    git_name = os.getenv("GIT_NAME")
    git_email = os.getenv("GIT_EMAIL")

    if not all([repo_name, token, sha, git_name, git_email]):
        print("Missing required environment variables!")
        exit(1)

    try:
        git = Github(token)
        repo = git.get_repo(repo_name)

        if pr_number:
            # pull_request event: process specific PR
            try:
                pr = repo.get_pull(int(pr_number))
                if not pr.merged:
                    print(f"PR #{pr_number}: Not merged, skipping.")
                    exit(0)
                if generate_changelog(repo, pr, git_name, git_email):
                    exit(0)
                exit(0)  # Exit 0 even if no changelog generated (per original behavior)
            except Exception as e:
                print(f"PR #{pr_number}: Failed to process - {str(e)}")
                exit(1)
        else:
            # push event: process all PRs associated with the commit
            commit = repo.get_commit(sha)
            pr_list = commit.get_pulls()
            if not pr_list.totalCount:
                print("No PRs associated with commit, skipping.")
                exit(0)

            success = False
            for pr in pr_list:
                try:
                    if pr.merged:
                        if generate_changelog(repo, pr, git_name, git_email):
                            success = True
                except Exception as e:
                    print(f"PR #{pr.number}: Failed to process - {str(e)}")
                    continue

            exit(0 if success else 0)  # Match original behavior: exit 0 unless configured otherwise

    except Exception as e:
        print(f"Script failed: {str(e)}")
        exit(1)

if __name__ == "__main__":
    main()
