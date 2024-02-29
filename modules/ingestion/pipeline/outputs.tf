output "id" {
  description = "ID of the ingestion pipeline"
  value       = aws_osis_pipeline.this.id
}

output "arn" {
  description = "ARN of the ingestion pipeline"
  value       = aws_osis_pipeline.this.pipeline_arn
}

output "ingest_endpoint_urls" {
  description = "The ingestion endpoints for the pipeline that you can send data to"
  value       = aws_osis_pipeline.this.ingest_endpoint_urls
}
