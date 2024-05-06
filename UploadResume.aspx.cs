using System;
using System.IO;
using System.Web.UI;

using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;

public partial class UploadResume : Page
{
    protected void UploadFile(object sender, EventArgs e)
    {
        if (fileUpload.HasFile)
        {
            string blobServiceEndpoint = "https://mbtfileshr.blob.core.windows.net/";
            string sasToken = "?sv=2022-11-02&ss=bfqt&srt=sco&sp=rl&se=2099-05-06T06:03:29Z&st=2024-05-05T22:03:29Z&spr=https&sig=Dws3bgGUWCUknRdVmRoFXItmnItJDLHy76Axgu1qNtE%3D";
            string containerName = "resumes";

            try
            {
                BlobServiceClient blobServiceClient = new BlobServiceClient(new Uri(blobServiceEndpoint + sasToken));

                BlobContainerClient containerClient = blobServiceClient.GetBlobContainerClient(containerName);

                string blobName = Guid.NewGuid().ToString() + Path.GetExtension(fileUpload.FileName);
                BlobClient blobClient = containerClient.GetBlobClient(blobName);

                using (Stream stream = fileUpload.PostedFile.InputStream)
                {
                    BinaryData binaryData = BinaryData.FromStream(stream);

                    blobClient.Upload(binaryData);
                }

                lblMessage.Text = "Resume uploaded successfully!";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error uploading file: " + ex.Message;
            }
        }
        else
        {
            lblMessage.Text = "Please choose a file to upload.";
        }
    }
}
