document.getElementById("send-feedback").addEventListener("click", () => {
  const width = 575;
  const height = 755;

  // center on the current screen
  const left = Math.max(0, (window.screen.width  - width)  / 2);
  const top  = Math.max(0, (window.screen.height - height) / 2);

  window.open(
    "https://qumulo.atlassian.net/jira/software/form/a3eaa618-84a6-47ec-8a9e-5a0c3b016bc5",
    "jiraForm",
    `popup=yes,width=${width},height=${height},left=${left},top=${top},noopener`
  );
});
