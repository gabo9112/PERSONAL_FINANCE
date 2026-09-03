# Personal Finance Management System - SQLite Relational Database

**Author:** Gabriel Alejandro Rincón Mejía  
**Repository:** PERSONAL_FINANCE  
**Database Engine:** SQLite 3  
**Architecture Pattern:** Star Schema / Snowflake Schema for BI Analytics  

---

## 1. Executive Summary

This repository contains the complete DDL (Data Definition Language) and baseline DML (Data Manipulation Language) initialization scripts for a normalized personal finance management relational database. Designed specifically to ingest, standardize, and structure granular personal income, credit, and spending transactions, this schema serves as the single source of truth for downstream ETL data ingestion pipelines and Power BI semantic modeling.

---

## 2. Architecture & Data Model

The database relies on a star/snowflake dimensional modeling strategy to ensure optimal performance, analytical query flexibility, and strict data integrity. Primary key and foreign key constraints are enforced using SQLite's native `PRAGMA foreign_keys` functionality.

### Dimensions Overview

| Table Name | Description | Key Columns | Relationships |
| :--- | :--- | :--- | :--- |
| **Assignment_Type** | High-level transaction classification (Ahorro, Credito, Gasto, Inversion). | `id_Assignment_Type` (PK), `Assignment_Type` | Referenced by Fact Table |
| **CATEGORIES** | Top-level budgetary groupings (Alimentación, Deudas, Vivienda, etc.). | `ID_CATEGORY` (PK), `CATEGORY` | Parent to `SubCategories` |
| **SubCategories** | Granular level allocation mapping for line-item tracking. | `ID_SUBCAT` (PK), `SUB_CATEGORY`, `ID_CATEGORY` (FK) | Child to `CATEGORIES` |
| **Income** | Classification of revenue origins (Salario, Freelance, Delivery). | `ID_Income` (PK), `Income` | Parent to `Description_Income` |
| **Description_Income** | Sub-classification of income occurrences (1ra quincena, 2da quincena). | `ID_Description_Income` (PK), `Description_Income`, `ID_Income` (FK) | Child to `Income` |
| **Entity** | Financial institutions, merchants, and personal payees. | `Id_Entity` (PK), `Entity` | Referenced by Fact Table |
| **Months** | Calendar month mapping for time-series trend analysis. | `ID_MONTH` (PK), `MONTH` | Referenced by Fact Table |
| **Need_Type** | Essential vs. discretionary allocation (Necesario, Evitable). | `ID_Need_Type` (PK), `Need_Type` | Referenced by Fact Table |
| **Priority** | Urgency indicator (Alta, Media, Baja). | `ID_Priority` (PK), `Priority` | Referenced by Fact Table |
| **SPENDING_TYPE** | Recurrence nature of expenses (FIJO, VARIABLE). | `ID_SPENDING` (PK), `SPENDING` | Referenced by Fact Table |
| **Mandatory** | Obligatory vs flexible expense designation (Si, No). | `ID_Mandatory` (PK), `Mandatory` | Referenced by Fact Table |

---

## 3. Database Initialization & Execution Order

The `schema.sql` script is fully automated and designed to build or rebuild the complete relational structure from scratch without execution sequence deadlocks. Foreign key enforcement is explicitly activated at the session start.

```sql
-- 1. Enable Foreign Keys
PRAGMA foreign_keys = ON;

-- 2. Drop existing dependent tables first
DROP TABLE IF EXISTS SubCategories;
DROP TABLE IF EXISTS Description_Income;

-- 3. Drop existing parent tables
DROP TABLE IF EXISTS Priority;
DROP TABLE IF EXISTS SPENDING_TYPE;
DROP TABLE IF EXISTS Need_Type;
DROP TABLE IF EXISTS Months;
DROP TABLE IF EXISTS Mandatory;
DROP TABLE IF EXISTS Income;
DROP TABLE IF EXISTS Entity;
DROP TABLE IF EXISTS CATEGORIES;
DROP TABLE IF EXISTS Assignment_Type;

-- 4. Execute Parent DDL -> Child DDL -> DML Inserts
