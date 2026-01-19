Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF60AD3A8BF
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jan 2026 13:29:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C6CBC87ED3;
	Mon, 19 Jan 2026 12:29:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71C96C555BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 12:29:44 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JCJRIk1317075; Mon, 19 Jan 2026 13:29:18 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013055.outbound.protection.outlook.com
 [40.107.162.55])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4br0qkww14-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 19 Jan 2026 13:29:18 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLoCOO0YujVzC4SG/BYvvJyy+rkczN69XECbob0mAxK2ySRZwZcvQZAd8dQG5Y3b4uwwJ6Q+JXtpg7SkoaPtxoF8UAnhBnrmEcC3rcUmDT413fDKsAOV7EnmmvWugu2syvLHK8p5pq3UAbRk9vGDrXn5trPSdvwP1qIq9SfzfryvVBh/9818g5C/y0QG8qWckZ1yYbYxEsBGMv7WyefS388DLdGgYC/u2M5qCWUadE5108/g/pVxBmCbH8QJXIol/p7h8PFKMbf9W+Wkw92+6okh6RgEvVnMVWZXuBjBRUX5w0dSO2AdK0knI2eAglVK5OR1IaN78wz5fRMGSmoqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLg7C+tXgo2Ub8SQEWs2iIEVBD7DEcZ4QVC1d4AgFr4=;
 b=Ufb2obPQQkhvecUHh8nRnpbjqY1ltHwkFOYwLFcn80pzGNAEZsxugzvIYo1nZlCd9Lzv6SWf5RpeAHgkVIojWs/N3vSJn2VZ1wMkb/t60RBAUX6cqpqKN2/t8+MErhpMydUAYOdAWbYWrh/97+R8cQj5GhXK/UUL0aV+9CBal2+josJvSD+00krRZXDc14wZZ/CF3eVxFUQXsb45gkafjQOQehJTQKegfVv3zliUDpUMB7crtpUqXBLBHJtGwsXxgk2ijJU9Aii927VjC1H5UHjnAeUC0b+woqqux1dhb+9oHHKFo9Y5CAQG2U4qV6CrB+nXSRS4RgD9BPZNLUy0+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLg7C+tXgo2Ub8SQEWs2iIEVBD7DEcZ4QVC1d4AgFr4=;
 b=VcwmgV3Gi3ts6KAFJ5uMGDSLMJ3f9nZfYCkI9Y2So3MKYet5s/fUzkDqEhSUBWRrp6BWuxayp0spHW1oxDBNo1sB/rWfaUw1EVT3r53B0xMmbG0koEgiXM8pFyXD+UDGpKDhgWMJ828oA8kGRZSdcve8jQdzWpXvQcFyEJcLt8s+l7TGyuLLO0O5mxfrx5utE9+IVVY2PSm5rtMT5jaFUb6TBeXFcHk9OlqKsC50ba5KBnk34FtU3OC6BrRrd0YPYkpulfhvDZZ6B9Us3/vCkd2aGpAx7wkugF5RIdq9/DHV8e1Cbv7v9UelFkuQKTrEx/tknzB3lcM2eWjOXZvAhA==
Received: from AM8P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::11)
 by AS8PR10MB7066.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 12:29:15 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::93) by AM8P191CA0006.outlook.office365.com
 (2603:10a6:20b:21a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 12:29:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 12:29:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 13:30:34 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 13:29:14 +0100
Message-ID: <0c3d33fc-d4ef-406e-afd5-021f28a2689a@foss.st.com>
Date: Mon, 19 Jan 2026 13:29:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>,
 Peng Fan <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
 <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-1-d055da246e55@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-1-d055da246e55@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AD:EE_|AS8PR10MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 70b67f1c-62c9-43c6-159f-08de57565be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3hheHdjRERuM1JVR0w5VVFBcEtMYmY4SnFXVWZ4T3d5SlB0dk95TERjM0RC?=
 =?utf-8?B?SUVVS05mdDkwM3FsZXhPczBIamhNMEhyb0JnQXJDVFZnOHhUQ2JTalJKK2E3?=
 =?utf-8?B?ZlMxWm16OWtNOUplNDBLWm5mSld6aWk5ZkNpbS9uajh3TWtsWlNPZlp1UXdS?=
 =?utf-8?B?RmZ4OE1QSnhkNS9UTjJ6clBHTFZlRjJUTmh4S3RuUjB4UXZ2S3BKU1Q3WHBT?=
 =?utf-8?B?MWxsUXNWdVdwZzVnc2hDUmdZMVF0M2FxeTI5eGVHanIrMm5Zc25IRXV0cWto?=
 =?utf-8?B?THhCRVhGUFBqcGJic0tOT1RwWE5wcHM4eG5Zd0xkaGJpWE05bkQvQ0ViTm1Q?=
 =?utf-8?B?ejBRQWxiRlkyRDlRdEF2ZGpyTGlzR0F0Y1AwUTVkbEU4Y2xRQjRVOHdiZUo0?=
 =?utf-8?B?anFRendwcVROQVUrenlPSzErUHQ0amVzNWJPdXUxRnI0VjBYR0JEOEk4MmVJ?=
 =?utf-8?B?SHdleXdIVHhlUjdGR0lvMEZTaVBnbE5MYTIvN2UyTEcwYVJtYjlJYVJrU2c2?=
 =?utf-8?B?QS9tTkxXWWRtZ0JZMWo4TXZHYUYwWHNPbDNCNnh0RmFjeTQvRDFBMXJjMThX?=
 =?utf-8?B?VkZpbThib3dSYTNvbGRkYlgxMkJXYTZNY1IzUmpBT200eTJpZ0NIODlsSE4w?=
 =?utf-8?B?dW1zM2F4aXNBTVVvTXRzTTJWdjVYQ0Y4VFllNUlYTUtSdHJoMEtZMU1xaXhL?=
 =?utf-8?B?TXl3aVVhd09yazRleU8zT3RwcCtzTUwzRXdubHdhVFVsWEpOWVZCV3NBT1Bh?=
 =?utf-8?B?WnZXUXc1VjllbE81RUpEdDhxZkxvOC9yU2YwQ3gzZDRpRXF6TGZyTE12RWln?=
 =?utf-8?B?NUxXRW4vTTNzR3Y2YmIxTkZOQmpaWG5QYllDb0NiUks5RU1sb2dsMTRxZlNP?=
 =?utf-8?B?SDM1SWVkZmFSZkRSQ2d4L1FTSm1oMS9YaHU0dExUUjZlS0dpOWlLSHB2Ukh0?=
 =?utf-8?B?RzJNelB2MFBaL1BINVh3RHdDQ2hYODg5SGxNV09wU3czZnJhZWpkRFBzd0x1?=
 =?utf-8?B?YlBvQmpYdzVMUUFZTmI4L3hnWDVIUFBSRmpKQm9iQWJqL0ZZVjBHQmRCclE4?=
 =?utf-8?B?aXZzdmVHeVB4d3NvaDV2V1BISElZQndrT3RoNHloYUhmNFBqd21hQzNkUjl1?=
 =?utf-8?B?QnlDSFAwU2Y3RWh0YkkxdkRlL1BEOTE5N3FqeVQxZzEwS0YrOFlXZFNLZjdj?=
 =?utf-8?B?UWpJUStCWHFYY2NLV3VLSi8wY083QitQcFlSU1dEWVJZVHFmaDZXVEhCSVVU?=
 =?utf-8?B?TjJlUUxmeS9LN3Y4WExKU3MzeURZR01RWS9OeFg0K2svODVreTZCTW0xVHp3?=
 =?utf-8?B?SXQ5MFlXWWxHVVowRmVPOHBrNkErRk1rUUthc3BpY2hTZHNhNEw3TGpHK1Zv?=
 =?utf-8?B?ek1BSWRjOUNiZm1aRXlBK0NDZ3FWa1JMZG1FT0k1U0VuMDdhU0xVN0xNL1l1?=
 =?utf-8?B?NTNiRUwyN1VKVlE2VGRyWFF0QXptbGx3a1RaaUJ3My9PajJ2N2tpMzgrQkQ3?=
 =?utf-8?B?ZGRONEVpR25EbXRrN2ptSGgvc1lQM3JqQVZYMXJHbGw1Y2FSeXdXSzBmRzlD?=
 =?utf-8?B?NTBFR2NaWUFqdkRoOE1TZ1IzeFpFMWJXWXhWOEM5Y1RhUTBuWDZCdkI5Nm9y?=
 =?utf-8?B?VWNGM3FpMGhOVFUzWGZkazkxU2RGbDNSaEYySkx0Zm5lM2d5a1RIbEwwUnJp?=
 =?utf-8?B?Uk1kMFVWWFQ0UUZYUHlFeDUwSVRtOU5wbXp5ZjF5ZEJqTVlqUFFRR1pSYnk1?=
 =?utf-8?B?aXBPMWFKUURwcitiTlNRYVAxdmZ2cUFMMytFVEpJRGhwNzRXS3g1T0czKzZD?=
 =?utf-8?B?UFNtQXluUDJObGxGT0RSbjUyeW4rVnRnL3dKbVZJR0hMakVsOHlSSG50UGgw?=
 =?utf-8?B?TTExSlhJeTRTRjVTUU92czBqOUYxZk5NRjgzR3hHNkdoS29ySEZ6bjg3T04w?=
 =?utf-8?B?VUMxdjVQK1pnOXdXWi9KNTJoa0pKRVF0cVA0N3V5THZIUllIMi9VL2ptUGx1?=
 =?utf-8?B?eWx6VXkza1E4b3ZtYVAyaWNrNDJ3emI3UW5LN2cva3lSU2VrMmVGSjZONDhU?=
 =?utf-8?B?MStjNVlDelBZWVhTYis0ZGZaenYvYkdGS3BqZ1RJMmJTNW9DdjVKR0I2K0FN?=
 =?utf-8?B?YkI4QzdjSGZ4T3IyUDREZWlnQUtZSjlQcUcybzQ5UEswYVZGVklDSWwxTHY5?=
 =?utf-8?B?enc9PQ==?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:29:15.2891 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b67f1c-62c9-43c6-159f-08de57565be5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7066
X-Proofpoint-GUID: B6dZ7Eqft04-UtrljmCc-NXYVXHkiCHB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMyBTYWx0ZWRfX1z8fcyoaTFSf
 HCuZrLRI9WeNYLFJZ5HSPMBqPOfaNojRvWXxnzPtPYzW1I2tSrp600nlY6ceC3DHzEFzcGTAnJs
 P/DPryS6BHrf1wPWwQCpwwfYPJL3YlSJ8QZzDv+c1yesQHrJlTvMiY3w51p1WQkglf7nLG3e2aY
 kmeHgpj8VWem1ADvDYNN1hvX6Xo4IGSOrqJjzFZFHP0vX0Vp9dpZhoZ3I9nLAufXOKhCAf188i5
 aXuHBoP47GNCGtlowMl4e6bijgYDc7CBzZdmlNTvN7nBwhDCx0ZKAwjMZ9o0eurGCvfLD52fF19
 GOAHT9qc6Ayn86CRSKOcA+6kACOiqPKCD2vuRPYud3qf9/0jsRjMsnvrbd56pRKufc/fE7w3HWR
 jo4PbGGScip1RV5ETc4hq0vdH5zL1sEi4VoExzZYvf38+iBbj2qJmMsfQv9lDw7JGBT4eDBc+9c
 M/giaCaSDpMsqMp74AQ==
X-Authority-Analysis: v=2.4 cv=TNdIilla c=1 sm=1 tr=0 ts=696e239e cx=c_pps
 a=KrdtjRokVkZpNyWqjvoQ6Q==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=vW1nh7Jg1_YA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XpE1AkgCAAAA:8 a=8b9GpE9nAAAA:8
 a=enggsrxaHjHF0MqrOHgA:9 a=QEXdDO2ut3YA:10 a=_VNrz7lXTIYA:10
 a=dpZMgbseYPk84XhQl7oQ:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: B6dZ7Eqft04-UtrljmCc-NXYVXHkiCHB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190103
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/3] clk: stm32mp13: Reorder include
	files
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

Hi,

On 12/15/25 15:56, Patrice Chotard wrote:
> Reorder include following rules available here :
> https://docs.u-boot.org/en/latest/develop/codingstyle.html#include-files
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   drivers/clk/stm32/clk-stm32mp13.c | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
> index b4d0890f902..18e9ab364b4 100644
> --- a/drivers/clk/stm32/clk-stm32mp13.c
> +++ b/drivers/clk/stm32/clk-stm32mp13.c
> @@ -5,28 +5,26 @@
>    */
>   #define LOG_CATEGORY UCLASS_CLK
>   
> -#include <clk-uclass.h>
> -#include <dm.h>
> -#include <log.h>
> -#include <asm/io.h>
> -#include <dt-bindings/clock/stm32mp13-clks.h>
> -#include <linux/clk-provider.h>
> -#include <dt-bindings/clock/stm32mp13-clksrc.h>
> -#include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>   #include <clk-uclass.h>
>   #include <div64.h>
> -#include <dm/device_compat.h>
> +#include <dm.h>
>   #include <init.h>
> -#include <linux/bitops.h>
> -#include <linux/io.h>
> -#include <linux/iopoll.h>
> +#include <log.h>
>   #include <regmap.h>
>   #include <spl.h>
>   #include <syscon.h>
>   #include <time.h>
>   #include <vsprintf.h>
> +#include <asm/io.h>
> +#include <asm/global_data.h>
>   #include <asm/arch/sys_proto.h>
> +#include <dm/device_compat.h>
> +#include <dt-bindings/clock/stm32mp13-clks.h>
> +#include <dt-bindings/clock/stm32mp13-clksrc.h>
> +#include <linux/bitops.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
>   
>   #include "clk-stm32-core.h"
>   #include "stm32mp13_rcc.h"


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
