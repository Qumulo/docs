document.getElementById("send-feedback").addEventListener("click", () => {
  const width = 575;
  const height = 755;

  const left = Math.max(0, (window.screen.width - width) / 2);
  const top = Math.max(0, (window.screen.height - height) / 2);

  const hardwareForm = "https://qumulo.atlassian.net/jira/software/form/07aa529f-ac1d-4d92-8da9-8cc1315323d9";
  const defaultForm = "https://qumulo.atlassian.net/jira/software/form/a3eaa618-84a6-47ec-8a9e-5a0c3b016bc5";

  const formUrl = window.location.href.includes("/hardware-guide") 
    ? hardwareForm 
    : defaultForm;

  window.open(
    formUrl,
    "jiraForm",
    `popup=yes,width=${width},height=${height},left=${left},top=${top},noopener`
  );
});
