## Test Changes on Dev

__Prerequisites__
- Changes are build in the pipeline.
- Read md in corresponing cube components.

__Steps__

1. Copy image tag from CI into the corresponding Kube file. 
2. Generate Config with changes (only for AI team elements)
    ```
    (./deploy) kdeploy install -C --match-labels team=ai -o print > generated_conf.yml
    
    ```
3. Ensure the cronjobs are create
4. Trigger the manual run of cronjob by
    ```
    k create job --from=<existing-job-name> manual-job-name-run-1
    ```
5. Examine logs via
    ```
    k logs <name of running pod>
    ```
