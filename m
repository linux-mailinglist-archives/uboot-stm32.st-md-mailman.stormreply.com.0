Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAD6CA463A
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:03:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EC3BC628D0;
	Thu,  4 Dec 2025 16:03:14 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE92DC628D0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:03:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PynlA/jTiaU/boZqjFadGlisGn19OeCR5PaZT2p54e2eMPRQH2gKFKqyj7x2u3ZRfnDL+vvyRyEOppaz35vBM9WN1FkwIwG+ls+GZQDzpgx5gSOajCChBafxRHeF9d8Kkd9Cv807+oTGtU8L6Rdbss960Ifu7zuUWKTnVVjYcBMzYrt7Jmq5WJyrjWOLxGZXSo5Jj/wCLQtK9RaRU77IcnojyfT9U6BjkIZlIcviVMIxIhHlY/WU+TV2o1A3GRYiMZ3SAFMPkg/nvrGpTVg5U0N9KoYYrSxjLWjxJrAzIPlVNql4g7NCWFeqzHyyjbOchxuP9XNVjgk1eZTBRGHxcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=Epz6M8IsbWI0HLY6V2vNUmUOUnaRq5uFPMEWJ6cm6zbqFvkBtDyh+ENEH+4KBt0tuug33LSs1KyjlV48v/63qg/dpR3Ctx8dXuQcn75881qVXZEYWH+6kONTV61DAJjdgXLLMyRZZopDaNQ0bWkwzfWvHeXFp+Vs1cmet/U1IB1qgZLsnWa3lbuR3PPvecM/p9PfObRhJVWlXnxQ8DBAl5y46nMar/V4hTAAIwQ94H/Ku3dGZgABJODg2nGSgmilJNkWUyawYqmeHvrkNQExvaDbpP6IDbgPIYS1SRY7oX8FYRj1TCGbjEmhAKq0Xpu99zNVQiCd9oP/HBk/xPqCmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=MBo4Ut5JWEd5fhFZ1HKJMqaC4uWBh/spZ/WtXdNgCcHU3WlOTlNurgfokwFmijn+LjsXZjatlmNYbAjnOE3Sh07UnqtHcS4tGGhYjIC4SLHgHIvrhG/NIY2bDfK6Wf6tQYVOrUZyQBJRNEb6zkYminKWuCDKE4FPcZKN9/kceVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI2PR04MB10266.eurprd04.prod.outlook.com (2603:10a6:800:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 16:03:08 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:03:08 +0000
Message-ID: <9e5313f4-ac17-4d86-b10a-b3a426868f84@cherry.de>
Date: Thu, 4 Dec 2025 17:03:07 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-8-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-8-patrice.chotard@foss.st.com>
X-ClientProxiedBy: FR4P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::9) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI2PR04MB10266:EE_
X-MS-Office365-Filtering-Correlation-Id: 7391ef09-b8f6-4764-1ae4-08de334e9dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFlBVS9ERXdBSHFHRzhXZGZTdkU5eEgxZzVrbmRzbkZ3bTFHTm1tL2VPTUs5?=
 =?utf-8?B?c2VJZDlqSm5zanhvMDU2RDVPMG4wdTRzelhXQWRsTUZ2S1VQeGxiTVpLM2NH?=
 =?utf-8?B?bThoZ0lZR1RQdFVDK0tkY0VTYmdTc0Z6dmt0S3crb1pYNVJRYWk4aGtJUWh6?=
 =?utf-8?B?Q0gyYXpsWlpOL1FycXdZb3dtRFNQT2ZXVTBFSXZBYWJaaVJqQk8wbXovWmVv?=
 =?utf-8?B?ODBWbHZpR3cvYVRjTEJJZUhqVnBxMjVDbXlOM0k0QkVBNUJmYktZVlZtSW5n?=
 =?utf-8?B?YlRXc0VZbXc0U2J0RDdTL1p2cENoYlIzY2hIQjlHS3ZEak5HTGZsVkNwRHc5?=
 =?utf-8?B?TCtNL0M2S2RURDdTWFd3NnpZV3dtUzllZ1dMOE9zWm1tRllBQjY1aWJ5Nlcy?=
 =?utf-8?B?bFVHL3dTUWgxN0c1RTRteHR2RlJMUU5RNURKQWk2b0g4a0pTZndmbTR0TjFV?=
 =?utf-8?B?Vlh1emh5cVNvb3pLR0hSZXNmQ0FpTUpYVGVnUW9GODljOTJqeTZ6aWVIUis3?=
 =?utf-8?B?Z05sZFNrQ2hRVTF0c3VFbjdwNzhtZ3FXMVBiVVRPYWlJb1craHNLdVE5TS83?=
 =?utf-8?B?dWFZZnZVcVNRTEJ2WFZpRmQ0Y3VNU1NBQ3BBbklhVnY3c1NPdm5XdFg2dHNy?=
 =?utf-8?B?UFQ5aHM3Z2dpeHFRazkwZW9mN0wrNjhLYTlZY2VWQXNYT045TGN4K1UvUytk?=
 =?utf-8?B?RVFnVSsyeVNRZ3g5OUpKWENJTG1zR2dHTEswbjQ3QlNoVjZReWRmU3kwTk96?=
 =?utf-8?B?S2xyRWVwNnd4RkI4b3FBa0tScXBYeGkwdDFNVStwOHU1aFhWWVRlRXVmUXFN?=
 =?utf-8?B?R3Rld1RjY0pGcWJvRElKZVVsMmZZZmxoa3RFaEhidXV4MkpsMFdLL2JCSlRS?=
 =?utf-8?B?UzBLT1JFMEZOcUdmZUh1bkdXcW82elRsOFFVNTBPT2tVa1NlTFNQd2x3ZHho?=
 =?utf-8?B?WVVzT2lwK3Z0V1FFU2lyNkp4QWRVWUhiSnl6TmNiR0RZNHRNQTFDcDcreU5Q?=
 =?utf-8?B?R0d3QWtOQkhFeXIwTmg3em8weHJOeXRCZzRNb28zaDZVSmJWdW9pWVM5eExy?=
 =?utf-8?B?RHZCSTlqNmdvSjJERU5FU2YyZjZzUzB0TE5FOEM3c3AxbWpMNlRLVVlKOWZU?=
 =?utf-8?B?aTY0blRDQXhSZlVQRkwwaUhHNE9HSnI2MmQyL045OCtMSksvZlA0VXJBS0F0?=
 =?utf-8?B?ZGFJYWc4bnRYZWhyc2MvWXh0aXhiRVVjZjFNTThVRTNtYndyZVNKNFVha0ls?=
 =?utf-8?B?Tk5QWG94amx2V1M5SHFKRWJ6YksvYU53b2IyZXIzUHZiT2E0dHZDRzQrVHpO?=
 =?utf-8?B?MG1idlhGbERLd0RqaG4vU29ZUUplMTliTkxBcXhvbFdKbjJZcXdRRHE1N2cv?=
 =?utf-8?B?OTBEeW5veGgrWUxjSzErT2hLOXhHcVR5OWo5UWx5VlhETkVWa3JpcGJSVG5u?=
 =?utf-8?B?TVZaVXMwSkRvSjF4VkRRMVgrMUViUkp6VFRIT1ZpUERUT3l6cUtjSUJtMFpa?=
 =?utf-8?B?Q2RsVHRLa0RZandhckRUSTYwNXphYkdueUg3blNwWHRMOS9aMUpxZGhJemdG?=
 =?utf-8?B?Q01pTnk2cjhIbVd4VHplL09xY0NUQnhPeXpIbWdkUm84MmkzSTczNnNoY0lI?=
 =?utf-8?B?cklSaFExeXZaL01NcGltOXp5WTZmQ3Q3NitlaldNQzUzb3M4MWJOMU51SlB2?=
 =?utf-8?B?dnNkaFg5Y2QxeEthTHdJbXFrcXVRL3NOTHlDa1hJbW9oRUdWSklzeklaNHVJ?=
 =?utf-8?B?UUR0VjdnZlU5ZzdweWp4cWpjQ2ZGSktxazgxcklGYzRPbUVpUk1oZVZQL3ky?=
 =?utf-8?B?M0FqQWpBMTVkOW5nWW5RdjZkV3VaTDg1Mk1MdTNaV0RqME1pd2daM0VnVXY2?=
 =?utf-8?B?RXE2ZnE0U1d6Q0g3VWhDRER5elBsb0pFTU1sQmJoUEdHTDBZUVROTFJXa3FY?=
 =?utf-8?Q?Q0Ns1fi8C7oRzEcl0IYLiC2MY37AN4Gh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjYzbEt4VklWVUxYOTNWV3BWem1tNTlCa2NNbmJ4MitJN3Fwc0dPOXpNcjBY?=
 =?utf-8?B?V05UanFrdGV4cnVqbENJcTJiZGZUM2o1Rmd0bXVMVUxvb25ySWdGYytnOFdS?=
 =?utf-8?B?YXlFdUZXM0x4RzVMMjh3aEYrdEErTVdRRjdMd3gyZUZYN1FHeFRlVEdLNDBR?=
 =?utf-8?B?Y2tCTEV5SVc3ZFgwVmFsMWxNZ1ZSSDFrMEt2OTRJZWhXbFQyL1NSOFFzQWVq?=
 =?utf-8?B?Rm1wNXAwaHlOZU4zdndYUU91NE1HS2drUUR0Nks5dFlUTWh4QTZzQ0J1YnY5?=
 =?utf-8?B?Q1p4dDRyMHIzaWZwOG5KOXhpQllrVEQrd0k0bkE3aUQvd2c5dlAyNW93c0sr?=
 =?utf-8?B?R2wyZVFhNzlsUkZ1ZXZlSmtGb2l6NW5ET25admFQc2xZSjdzYmZpeGQ2RXEw?=
 =?utf-8?B?Y1hiWXNrdEhYM2V1ZWc5cHFKbDhMVUZOOVoyU0d0dGhNODNXY05MR0paUytP?=
 =?utf-8?B?VnJuVmVLc2tLaVNieHRoVHlvZzdoRmRseUNqMGVjR3gzUVl1M3pwd3d1Ujhw?=
 =?utf-8?B?WkZ3YjJWbTVQVlVGSnNjMjRuU0I2ZHpxa2UveFRmUk43UHFkMzhyWEZ1QUFi?=
 =?utf-8?B?YWdyK0M3aElUa3cvLzh5SVJWSW9ZWUx4aGQrbnpMZHZJRWMyOExKejFEdElC?=
 =?utf-8?B?aDJXelQ1TkRRdFdxa2JkbUZsRTBXT0JqSXV2ZDFRbXp6V0pXUU16OUxnL2Fo?=
 =?utf-8?B?eHNhYXhXWEtZT0ZCT28yeWdURGw0NkxmQ3dBdHh3NVpQVVdxdnFkVmZ2MjNl?=
 =?utf-8?B?UGRRUTRnODJlZnhib1Q4WnB2bnNXdGZTKzkwWTM4bHRVVVJuV0MrV001YUda?=
 =?utf-8?B?UjJUQnhsV0tDMmwvZVdONmEwVkswTVZoZnJXbVhLdlhtOVBINnZPOVRKTnpt?=
 =?utf-8?B?N0REb3NYMG5RZVBFRFBOeDlJeGVQNE1WU0pHNm5ZV216S1ZaTFZlUlBrQytE?=
 =?utf-8?B?dWhCWVd6NER3bVVDWFZvTzJETThuaHkxUWhOeDRsU1lNbWt0eG90cWt3MSts?=
 =?utf-8?B?dGpyUXIzYlkvekZQa0pHT2ZoZk5oV0srQnIvRFFHRVZlTnl6akhNOHBxbjdP?=
 =?utf-8?B?T0pvUWJtOWF2Mm9yWlNpc1FzWE5CV2JvRnh0OXpHcnlDUWl5aDRqcHBqMnh1?=
 =?utf-8?B?aDJlNVlOSUgrUWlOQ1J5NlRzRzJZM1QzZk5OQ2R4NXZLeC9zSHNUcEorZWd3?=
 =?utf-8?B?Yk1pc3ZnSXFZTW9SS0N6dTMxUjFIUURsbzdIbVZJSWhqcWMvb0lqdmd2Ny9z?=
 =?utf-8?B?TDh4T3ZiK1dUUTRVY1F0a1VQWCthWUNGdEUwb2xKdVVYOXpORlo4K0xCWWll?=
 =?utf-8?B?bVpnWDkreExZTkJINHhmWVBGdlVUSmRKNi9ZQ2U1UldFcDBUNCtXNDI4ZzU1?=
 =?utf-8?B?THpCRFdsTUdUeElhYUpoVmZHQ3BQVTZ4T0JReHpKVmU3TmF5RGpFSDRkWWdw?=
 =?utf-8?B?WXNPeGpZV0dpL2J0bzhBblJZWml0RWFrNTNOZUVXOGZCdTRYRUtjNStXT2Rj?=
 =?utf-8?B?RFBpSHgxMXdvT1oxeGU1L1dEVnR5QUxpZWRmS1B5UFNaT0U1RjBWT2pySmI1?=
 =?utf-8?B?Um04NkI0VE1oWUpZMDJWNGpXOVlYV3YzMUN0QWxkRUxqd29BQU1IR2hqeGhJ?=
 =?utf-8?B?R3A5aG1od3Bqa0dpR3hOUGdZcE5pbGVwQW41Wi91NDlkUmdPbDlnTWhqUGZG?=
 =?utf-8?B?WmJ2TDd1MThCUG9BMXUyWGFUZlpTelZ5Yk5wSGMyVUZrR3p2emkrNDN0YjJr?=
 =?utf-8?B?OUtkMlNUOWFWVmpmRXNuWUFTTkU0ZkVuSHNYODZKMUczY1ZCK0xQZEpIZWRT?=
 =?utf-8?B?NTF2RlN0anVoakNTNWV5ZkZPS3VGTlM3UnFZTm1yV3U1VmYxVkJmUVRZcEQy?=
 =?utf-8?B?V0hEV1ZnWW90djRydm5YRlE2NW1hbHF2dDVMQU8vUFV2NmZBTE5IdWx5K0VL?=
 =?utf-8?B?ZDV6bWZEcjZKaWNBRm1Qa3ZaYklIc0dqaGU3YWFHNDExKzZMUVg2cmJFTnZY?=
 =?utf-8?B?N2RoKzAreS95eFZrelppcXFya1ZLeXB5YitPenEzVjU5ZkQvd3orc1Fnbmh0?=
 =?utf-8?B?bFdwN2NvSVprUVJvWFJvem5jOUszWUNhSzA4MkUweG9EamZOR2NVa0dDRWVp?=
 =?utf-8?B?RysrMjB0STlVVVFmOTBlNzZVYTZrWVBtV2ZuczZmTm8yUFJBdGJuTWFja2Fx?=
 =?utf-8?Q?RHkzEHysfMnx542+cinazXY=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7391ef09-b8f6-4764-1ae4-08de334e9dd0
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:03:08.2700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHv8sC6o0KLISPiY/yIBthlP43eGTKo0FZjkJW63sNNRR8QIzbTDj7XZH3kZEIsJ5r6niAyDpPBRClZ5GDckgJRiEX6sdHigY3QXOI6rD2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10266
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 07/23] configs: stm32: Enable LED config
 flags for stm32f769-disco
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrice,

On 11/14/25 5:23 PM, Patrice Chotard wrote:
> Enable LED, LED_BOOT and LED_GPIO flags.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
