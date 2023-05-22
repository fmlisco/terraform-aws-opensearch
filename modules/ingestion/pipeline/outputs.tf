output "pipeline_name" {
  description = "Name of the ingestion pipeline"
  value       = local.pipeline_name
}

output "pipeline_arn" {
  description = "ARN of the ingestion pipeline"
  value       = aws_cloudformation_stack.this.outputs["PipelineArn"]
}

output "ingest_endpoint_urls" {
  description = "The ingestion endpoints for the pipeline that you can send data to"
  value       = aws_cloudformation_stack.this.outputs["IngestEndpointUrls"]
}
