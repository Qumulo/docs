# Note that .sh scripts work only on Mac. If you're on Windows, install Git Bash and use that as your client.

echo 'Kill all Jekyll instances'
kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')
clear

echo "Building PDF-friendly HTML site...";
bundle exec jekyll serve --detach --config _config.yml,pdfconfigs/config_qumulo_alerts_guide_pdf.yml;
echo "done";

echo "Building the PDF...";
prince --javascript --input-list=_site/pdfconfigs/prince-list.txt -o pdf/qumulo-alerts-guide.pdf;

echo "Deleting temporary build files..."
cd _site && rm * -rf

echo "Done. The PDF output is in the /pdf directory."
