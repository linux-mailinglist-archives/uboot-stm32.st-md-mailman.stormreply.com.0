Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C4ACC48C8
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Dec 2025 18:08:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88C6FC01FBF;
	Tue, 16 Dec 2025 17:08:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6CA6C01E77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 17:08:14 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BGH5IZf1936871; Tue, 16 Dec 2025 18:08:09 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b3bbe81ja-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 16 Dec 2025 18:08:09 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhmBGF2OBqPq/8QD/38V66MUlqBSStQhdeB4lnJ6uyqwrjAZ/eCRpmgpSFtQnl0o+rmZLNh4DibYV7UPYW140N7w+RqXe7cHALg9WnOXOyt3fF6NtG7JeZLUEvnr4JZugqIi0DzgFk0HOnLhnN7lHCBoItRfhLRCXT+PfbRcV+p1r5a+N6qyiaPbvqYXRjBVrIIzjyMEmmXtqiJUM68FJ/rH/lz3N035rMTd8D7SMmkJsJuA8Azr58QhYuPHVFs2wWGqTBi8wbozihjqrgmW/vweKCcOHXmboFtPnWYxICMwlTQI+c9uCQ1yZxCv9wvlzhn7acmNXLwPDWSMUPejrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpYYPvVvrOVQGrERvYFvYi8n44DLi1xHu9SIhWw+Nho=;
 b=n7fKSYTbSaNFLdzVYKNHK+FbkEGPohbn8E/Q/tKuUmpuxlO15mN1y+U8K/31dhZXTl/NKE/xokbgBz5uby5ULt6NpXJSXj7KLaZW2KjieqBEdkciybkEI11N+Uge7JEUtMYy6oVMQeS6yj2HQSsTjerT4JZ+zXOiYBskmeSsC6mfkX5qfEClI4oVAQA9HvxJZutGcFJX1P85XD2q9OHpAGD56Xm85JZf+J+VQxB4Q3BzKI+5odWG2qme/89RIdgU0tbIGUFPCao05hgzYXDln9VG1WlFHaa8ZXIRvxMdgV03Daa2tktIpKDTTmBS/8I1NG3fpJvVdubpIhDy4ZEEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpYYPvVvrOVQGrERvYFvYi8n44DLi1xHu9SIhWw+Nho=;
 b=ZC1uLgFRg9jNV/1lmhP4NQM02m+VMxUa6ftwx3tRTaLc7SNgexqsBfbLC6QNIUhXeicwp4DzryTE7dvFVlqwb2Qz2rYJCfEv49IOp/zAolyEIY3pgB1iBCgEUxTE0B9OrlTQLZ5zSserQK9/c2eriF/lF+8vfPla6r9nfiSf0H7nrpg4r/HXyzPgpREoL0+WplfAEVinvF8wGaMYd17dvuXjFFkqBNKL+McL8HY/kPJo5I4VQE7lVM095QzU0qGFEotzN3lD1jyL/JjCeYxfMNUk8tIxr8yDsrbUNoQU4R4MXkv0C21Q7DF04+wJECC+VFDh2lTYdDGYBbVv29ollA==
Received: from DUZPR01CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::16) by AS2PR10MB6751.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 17:08:05 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::4d) by DUZPR01CA0031.outlook.office365.com
 (2603:10a6:10:468::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 17:08:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 17:08:05 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 18:08:52 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 18:08:04 +0100
Message-ID: <6c668b8d-77c6-4335-a9d1-438a67f122e9@foss.st.com>
Date: Tue, 16 Dec 2025 18:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20251209-ltdc-v1-1-9b8f14dfcb57@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251209-ltdc-v1-1-9b8f14dfcb57@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|AS2PR10MB6751:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d97fb1-f460-4975-07c1-08de3cc5adaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0hvb2dmbGNmNmxRVmFHQldBSlJxZkNmQm9ObzhiWlhydk4rbTcydkNicmhW?=
 =?utf-8?B?U0VVS0RKMnk0ektFZHdVREovOWxZUkEzcDZTNGRaaVZyaFBJL1BHMklEQ0Yy?=
 =?utf-8?B?QWxqeVkzZ28wWWJuMFJkTDlaWWhBTW9zYy9qeFNEbHVyTjJVNm5yMG8xRnQ2?=
 =?utf-8?B?Q3I2RXZVSGllUmpZR1lnY3Zpa0wzcFFoeW80L0llR1IrVjRGNkd3Y0RqY0FL?=
 =?utf-8?B?dXRGbHVMbWt2L1p6Ujk2Sis2dW91UC9ZRmR2RGFBWk0vOTZSR3VpQzdtNm1j?=
 =?utf-8?B?bElna21HSnRTQ1VkK0oxNE5hQS8vZEZ5SWhYN0x0M0dJL2t6cXRReThxYkRH?=
 =?utf-8?B?QVFEbW1nbk5CZFRkSm00VTBBQ2doT29oTjFjYlZxMUdMb1NKU01XZVU5aTFR?=
 =?utf-8?B?VmVFdFFqc1JhYU5UZzNjSHBOY1hFR0NQdE1JYTJ3cmF0Znl6OC8vdFIxV3Rt?=
 =?utf-8?B?RFA0VzFDODUzL3JaYzRhdnJlUDVYdm5vQW90dnZ0dFFJN2xLaFBMdVJKd0k1?=
 =?utf-8?B?V25rMlZUUHp3UFA1US9ZbitNNk0wbUpEc2IwWXVVRk5mK1RRWEZqcXNhTjFq?=
 =?utf-8?B?bndRL1Q2ckZ4SG9vd1o5UytQblE5QTZuTm5ucWhhZWxjT0tQQXFzb2Rmd3Br?=
 =?utf-8?B?bUgwelNMd3AyckM1em9nOE8vb1hvZW5PV0lOZ0VyMzNlY3dScTZpSHFOYkov?=
 =?utf-8?B?aXFDdDdxM2NHTEVObGEyWjFZYXU2NzRrbll0QS9MVnZ6TkxKbEgwdTYza2xv?=
 =?utf-8?B?ZFVWeDg0MktWZHZBaDJ2cnV4ZVZCMUl1TnZXcWVHc2kxdUNmQTFpUUFyMnpV?=
 =?utf-8?B?NEw0SkRPc2ZHVXhicjZOckRWOXR6OWpTR3hVTGd6VmN6dnVobmZTNElWMVk3?=
 =?utf-8?B?bnp5NkZIalpHaDFUVWdrVHN4eGlFYnJrMFlnRElqVjlMUFoya2V0M1JmWGlR?=
 =?utf-8?B?aVFTWTlzaitUbUkyREcxZnRwT2trNFREVkNlWmVWc2JCYlN4b1NmbFVRTTE4?=
 =?utf-8?B?TFlwY25uNnZkcVdzbDhzREJzblJxSWZTOVMyQmY2QkRHYk5qYW9hK0E1QUlm?=
 =?utf-8?B?eDAxSGhESHU5amlHY2xSeFY0TndlWEptSXFSMWdFVVpvWnEzanRramwzWnl6?=
 =?utf-8?B?VjZMclVja0FUNkZNbGE5Ym16Zm4xU0oyVGc0dWpiMmJxb0pxdTZxWnJ1SGVW?=
 =?utf-8?B?ek1Kdms2cE91dmRxdkxvbjhZYW5DVEhTdXRKcWlxZGppS3R2WXZiN1lkMGd6?=
 =?utf-8?B?M0hRQ3MyUHZKdmxDZmo1WngvRmQ5UkJ2aElTYlBiU0xTYnJkOVFzS3M0YXZm?=
 =?utf-8?B?c0Z3UjVjVHdUMUVlVEJPN0dEYW55Y2hLbTNBSEt1elEzbEROZFRERE9Qai93?=
 =?utf-8?B?U0JFY29wV3YwUHA5YjBKdGlPcVVJVU9HYjJmK2FKUHVwL2lIOU51WUNFRGtr?=
 =?utf-8?B?Y2pZRE14dUpqcVhUQnpuVThXVXErdUFaWk1xWFlJbGZZSEpKSkdBc25Cd3FC?=
 =?utf-8?B?SWVPSkJzR1g3Z1FJV3hIMDg4dFh6WnRxWUNtdi8yYXdURDUyT0JVclJmR1Rz?=
 =?utf-8?B?SnNlTXhYYUh2S09SMXlqVGdSMG1VTkEweURuQTJ4ZERucmdWUHhuUnZqQ2k5?=
 =?utf-8?B?VEFvV1phNkcvZDcrb1JROGZtdjQ5dG8zOGJhWHdCMDI2RjU5NTNlSWM1SGZu?=
 =?utf-8?B?Wm9ub2crUE9BcG95eHdpMk9ITUVkMWFpbEUvMWhlUVdaVHdaQjd3UHZjN0hU?=
 =?utf-8?B?aTJsalpqUjFUSzlvWUNTUTZSS0VwNFZUMG9GT0txQmxueC9rVmdESGFjMW5x?=
 =?utf-8?B?Z3RDb210L3Y1cGVtcHR3dHZUZWw0K2xSc2g0blJoa3Z3VXpTZGxuYjkyOFFI?=
 =?utf-8?B?ck9ldnQ0Ykowa2krOVROUVFDVmhhMTZnMHpSdm93cTMvcW1yT1hhekdZZTAv?=
 =?utf-8?B?ejgvZjMwd2M4NHRKdU9JU3BGVVd3cU14S1p6MzAwckw2OWNlb3NvMUkzSTNL?=
 =?utf-8?B?dHdmK3RUU0Rnc2wveitBL1p2MWpFemhwbnJOZzhwSEtxdUVwK2VkVjJIWlB4?=
 =?utf-8?B?SWpnZlVsWnpXRDhQSnpHdEM0cW5uQ3lLVHZtOGpWRmVEejZ3SkpEQzJlQi9o?=
 =?utf-8?Q?NxDM=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 17:08:05.2196 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d97fb1-f460-4975-07c1-08de3cc5adaf
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6751
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=694191f9 cx=c_pps
 a=dZNRamlC49a2syOZXmJYPQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=xo7OsLMyrUlU2CEoOG4A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: o1X2vNQAIMtkyZF0bEFTYkyA2b2R_bV0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE0NyBTYWx0ZWRfX8atwx0Rr2Z/B
 RzBJZQMXX9udXEkyLfkhzlOkrg25osY/TIihsMAalKMsMQJV05NCnbuJE34YezhMEmy7NqEsTaG
 ndd22a1iBBD5F4BWY3ti4V9nr8oEoo2P0lUkqtP8Xv17J0dhxmPMSnjxNK9jmyql0YELY+qG1Zm
 YXOTmC7bKCnK7Djw27rMfaJnQfe/E2dd/yaw4N/yUhoY6OT6RSceec0OTLkSrJYPWfI0OLzyCQj
 7BdRvo2hGwy+Wk/doChC/g4K47lvaAgWP0FdIg2fEHKh/uoY6YQlT20gRICleGHSG/p8DtpA55f
 SYK3R/Oc//DhCZyBV8mvjidTuVlkywja6XBMr3TP5fHGpTtegu+PMO1qtVKcZeQ8ov2KhYQ57eu
 wJ9bifqiUDwZVjGkhTkjF3HQKdoiNQ==
X-Proofpoint-GUID: o1X2vNQAIMtkyZF0bEFTYkyA2b2R_bV0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160147
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] video: stm32: ltdc: add .of_to_plat
	callback
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



On 12/9/25 13:19, Raphael Gallais-Pou wrote:
> Drivers should extract device-tree data before probing via the
> .of_to_plat hook.
> 
> Implement it for stm32_ltdc driver.  No functional change.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
> This patch has been tested on stm32mp135f-dk and stm32mp257f-ev1.
> ---
>  drivers/video/stm32/stm32_ltdc.c | 218 +++++++++++++++++++++------------------
>  1 file changed, 117 insertions(+), 101 deletions(-)
> 
> diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
> index 834bfb625d2d34a44bd8edff1c92af6dec344c20..1c55fc94b3aa67dbcb822684c2c9a128b159e8a6 100644
> --- a/drivers/video/stm32/stm32_ltdc.c
> +++ b/drivers/video/stm32/stm32_ltdc.c
> @@ -22,8 +22,17 @@
>  #include <linux/bitops.h>
>  #include <linux/printk.h>
>  
> -struct stm32_ltdc_priv {
> +struct stm32_ltdc_plat {
>  	void __iomem *regs;
> +	struct udevice *bridge;
> +	struct udevice *panel;
> +	struct reset_ctl rst;
> +	struct clk pclk;
> +	struct clk bclk;
> +};
> +
> +struct stm32_ltdc_priv {
> +	struct display_timing timings;
>  	enum video_log2_bpp l2bpp;
>  	u32 bg_col_argb;
>  	const u32 *layer_regs;
> @@ -364,18 +373,20 @@ static bool has_alpha(u32 fmt)
>  	}
>  }
>  
> -static void stm32_ltdc_enable(struct stm32_ltdc_priv *priv)
> +static void stm32_ltdc_enable(void __iomem *regs)
>  {
>  	/* Reload configuration immediately & enable LTDC */
> -	setbits_le32(priv->regs + LTDC_SRCR, SRCR_IMR);
> -	setbits_le32(priv->regs + LTDC_GCR, GCR_LTDCEN);
> +	setbits_le32(regs + LTDC_SRCR, SRCR_IMR);
> +	setbits_le32(regs + LTDC_GCR, GCR_LTDCEN);
>  }
>  
> -static void stm32_ltdc_set_mode(struct stm32_ltdc_priv *priv,
> -				struct display_timing *timings)
> +static void stm32_ltdc_set_mode(struct udevice *dev)
>  {
> -	void __iomem *regs = priv->regs;
> +	struct stm32_ltdc_plat *plat = dev_get_plat(dev);
> +	struct stm32_ltdc_priv *priv = dev_get_priv(dev);
> +	struct display_timing *timings = &priv->timings;
>  	u32 hsync, vsync, acc_hbp, acc_vbp, acc_act_w, acc_act_h;
> +	void __iomem *regs = plat->regs;
>  	u32 total_w, total_h;
>  	u32 val;
>  
> @@ -422,12 +433,14 @@ static void stm32_ltdc_set_mode(struct stm32_ltdc_priv *priv,
>  			GCR_HSPOL | GCR_VSPOL | GCR_DEPOL | GCR_PCPOL, val);
>  
>  	/* Overall background color */
> -	writel(priv->bg_col_argb, priv->regs + LTDC_BCCR);
> +	writel(priv->bg_col_argb, regs + LTDC_BCCR);
>  }
>  
> -static void stm32_ltdc_set_layer1(struct stm32_ltdc_priv *priv, ulong fb_addr)
> +static void stm32_ltdc_set_layer1(struct udevice *dev, ulong fb_addr)
>  {
> -	void __iomem *regs = priv->regs;
> +	struct stm32_ltdc_plat *plat = dev_get_plat(dev);
> +	struct stm32_ltdc_priv *priv = dev_get_priv(dev);
> +	void __iomem *regs = plat->regs;
>  	u32 x0, x1, y0, y1;
>  	u32 pitch_in_bytes;
>  	u32 line_length;
> @@ -493,7 +506,7 @@ static void stm32_ltdc_set_layer1(struct stm32_ltdc_priv *priv, ulong fb_addr)
>  	writel(fb_addr, regs + LTDC_L1CFBAR);
>  
>  	/* Enable layer 1 */
> -	setbits_le32(priv->regs + LTDC_L1CR, LXCR_LEN);
> +	setbits_le32(regs + LTDC_L1CR, LXCR_LEN);
>  }
>  
>  static int stm32_ltdc_get_remote_device(struct udevice *dev, ofnode ep_node,
> @@ -618,53 +631,99 @@ static inline int stm32_ltdc_alloc_fb(struct udevice *dev)
>  }
>  #endif
>  
> -static int stm32_ltdc_probe(struct udevice *dev)
> +static int stm32_ltdc_of_to_plat(struct udevice *dev)
>  {
> -	struct video_uc_plat *uc_plat = dev_get_uclass_plat(dev);
> -	struct video_priv *uc_priv = dev_get_uclass_priv(dev);
> +	struct stm32_ltdc_plat *plat = dev_get_plat(dev);
>  	struct stm32_ltdc_priv *priv = dev_get_priv(dev);
> -	struct udevice *bridge = NULL;
> -	struct udevice *panel = NULL;
> -	struct display_timing timings;
> -	struct clk pclk, bclk;
> -	struct reset_ctl rst;
>  	ofnode node, port;
> -	ulong rate;
>  	int ret;
>  
> -	priv->regs = dev_read_addr_ptr(dev);
> -	if (!priv->regs) {
> +	plat->regs = dev_read_addr_ptr(dev);
> +	if (!plat->regs) {
>  		dev_err(dev, "ltdc dt register address error\n");
>  		return -EINVAL;
>  	}
>  
> -	ret = clk_get_by_name(dev, "bus", &bclk);
> -	if (ret) {
> -		if (ret != -ENODATA) {
> -			dev_err(dev, "bus clock get error %d\n", ret);
> -			return ret;
> -		}
> -	} else {
> -		ret = clk_enable(&bclk);
> -		if (ret) {
> -			dev_err(dev, "bus clock enable error %d\n", ret);
> -			return ret;
> -		}
> +	ret = clk_get_by_name(dev, "bus", &plat->bclk);
> +	if (ret && ret != -ENODATA) {
> +		dev_err(dev, "bus clock get error %d\n", ret);
> +		return ret;
>  	}
>  
> -	ret = clk_get_by_name(dev, "lcd", &pclk);
> +	ret = clk_get_by_name(dev, "lcd", &plat->pclk);
>  	if (ret) {
>  		dev_err(dev, "peripheral clock get error %d\n", ret);
>  		return ret;
>  	}
>  
> -	ret = clk_enable(&pclk);
> +	/*
> +	 * Try all the ports until one working.
> +	 *
> +	 * This is done in two times. First is checks for the
> +	 * UCLASS_VIDEO_BRIDGE available, and then for this bridge
> +	 * it scans for a UCLASS_PANEL.
> +	 */
> +	port = dev_read_subnode(dev, "port");
> +	if (!ofnode_valid(port)) {
> +		dev_err(dev, "%s(%s): 'port' subnode not found\n",
> +			__func__, dev_read_name(dev));
> +		return -EINVAL;
> +	}
> +
> +	for (node = ofnode_first_subnode(port);
> +	     ofnode_valid(node);
> +	     node = dev_read_next_subnode(node)) {
> +		ret = stm32_ltdc_display_init(dev, &node, &plat->panel, &plat->bridge);
> +		if (ret)
> +			dev_dbg(dev, "Device failed ret=%d\n", ret);
> +		else
> +			break;
> +	}
> +
> +	/* Sanity check */
> +	if (ret)
> +		return ret;
> +
> +	ret = panel_get_display_timing(plat->panel, &priv->timings);
> +	if (ret) {
> +		ret = ofnode_decode_display_timing(dev_ofnode(plat->panel),
> +						   0, &priv->timings);
> +		if (ret) {
> +			dev_err(dev, "decode display timing error %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = reset_get_by_index(dev, 0, &plat->rst);
> +	if (ret)
> +		dev_err(dev, "missing ltdc hardware reset\n");
> +
> +	return ret;
> +}
> +
> +static int stm32_ltdc_probe(struct udevice *dev)
> +{
> +	struct video_uc_plat *uc_plat = dev_get_uclass_plat(dev);
> +	struct video_priv *uc_priv = dev_get_uclass_priv(dev);
> +	struct stm32_ltdc_plat *plat = dev_get_plat(dev);
> +	struct stm32_ltdc_priv *priv = dev_get_priv(dev);
> +	struct display_timing *timings = &priv->timings;
> +	ulong rate;
> +	int ret;
> +
> +	ret = clk_enable(&plat->bclk);
> +	if (ret) {
> +		dev_err(dev, "bus clock enable error %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_enable(&plat->pclk);
>  	if (ret) {
>  		dev_err(dev, "peripheral clock enable error %d\n", ret);
>  		return ret;
>  	}
>  
> -	priv->hw_version = readl(priv->regs + LTDC_IDR);
> +	priv->hw_version = readl(plat->regs + LTDC_IDR);
>  	dev_dbg(dev, "%s: LTDC hardware 0x%x\n", __func__, priv->hw_version);
>  
>  	switch (priv->hw_version) {
> @@ -686,67 +745,22 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  		return -ENODEV;
>  	}
>  
> -	/*
> -	 * Try all the ports until one working.
> -	 *
> -	 * This is done in two times. First is checks for the
> -	 * UCLASS_VIDEO_BRIDGE available, and then for this bridge
> -	 * it scans for a UCLASS_PANEL.
> -	 */
> -
> -	port = dev_read_subnode(dev, "port");
> -	if (!ofnode_valid(port)) {
> -		dev_err(dev, "%s(%s): 'port' subnode not found\n",
> -			__func__, dev_read_name(dev));
> -		return -EINVAL;
> -	}
> -
> -	for (node = ofnode_first_subnode(port);
> -	     ofnode_valid(node);
> -	     node = dev_read_next_subnode(node)) {
> -		ret = stm32_ltdc_display_init(dev, &node, &panel, &bridge);
> -		if (ret)
> -			dev_dbg(dev, "Device failed ret=%d\n", ret);
> -		else
> -			break;
> -	}
> -
> -	/* Sanity check */
> -	if (ret)
> -		return ret;
> -
> -	ret = panel_get_display_timing(panel, &timings);
> -	if (ret) {
> -		ret = ofnode_decode_display_timing(dev_ofnode(panel),
> -						   0, &timings);
> -		if (ret) {
> -			dev_err(dev, "decode display timing error %d\n", ret);
> -			return ret;
> -		}
> -	}
> -
> -	rate = clk_set_rate(&pclk, timings.pixelclock.typ);
> +	rate = clk_set_rate(&plat->pclk, timings->pixelclock.typ);
>  	if (IS_ERR_VALUE(rate))
>  		dev_warn(dev, "fail to set pixel clock %d hz, ret=%ld\n",
> -			 timings.pixelclock.typ, rate);
> +			 timings->pixelclock.typ, rate);
>  
>  	dev_dbg(dev, "Set pixel clock req %d hz get %ld hz\n",
> -		timings.pixelclock.typ, rate);
> -
> -	ret = reset_get_by_index(dev, 0, &rst);
> -	if (ret) {
> -		dev_err(dev, "missing ltdc hardware reset\n");
> -		return ret;
> -	}
> +		timings->pixelclock.typ, rate);
>  
>  	/* Reset */
> -	reset_deassert(&rst);
> +	reset_deassert(&plat->rst);
>  
>  	if (IS_ENABLED(CONFIG_VIDEO_BRIDGE)) {
> -		if (bridge) {
> -			ret = video_bridge_attach(bridge);
> +		if (plat->bridge) {
> +			ret = video_bridge_attach(plat->bridge);
>  			if (ret) {
> -				dev_err(bridge, "fail to attach bridge\n");
> +				dev_err(plat->bridge, "fail to attach bridge\n");
>  				return ret;
>  			}
>  		}
> @@ -757,8 +771,8 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  	priv->bg_col_argb = 0xFFFFFFFF; /* white no transparency */
>  	priv->crop_x = 0;
>  	priv->crop_y = 0;
> -	priv->crop_w = timings.hactive.typ;
> -	priv->crop_h = timings.vactive.typ;
> +	priv->crop_w = timings->hactive.typ;
> +	priv->crop_h = timings->vactive.typ;
>  	priv->alpha = 0xFF;
>  
>  	ret = stm32_ltdc_alloc_fb(dev);
> @@ -766,30 +780,30 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  		return ret;
>  
>  	dev_dbg(dev, "%dx%d %dbpp frame buffer at 0x%lx\n",
> -		timings.hactive.typ, timings.vactive.typ,
> +		timings->hactive.typ, timings->vactive.typ,
>  		VNBITS(priv->l2bpp), uc_plat->base);
>  	dev_dbg(dev, "crop %d,%d %dx%d bg 0x%08x alpha %d\n",
>  		priv->crop_x, priv->crop_y, priv->crop_w, priv->crop_h,
>  		priv->bg_col_argb, priv->alpha);
>  
>  	/* Configure & start LTDC */
> -	stm32_ltdc_set_mode(priv, &timings);
> -	stm32_ltdc_set_layer1(priv, uc_plat->base);
> -	stm32_ltdc_enable(priv);
> +	stm32_ltdc_set_mode(dev);
> +	stm32_ltdc_set_layer1(dev, uc_plat->base);
> +	stm32_ltdc_enable(plat->regs);
>  
> -	uc_priv->xsize = timings.hactive.typ;
> -	uc_priv->ysize = timings.vactive.typ;
> +	uc_priv->xsize = timings->hactive.typ;
> +	uc_priv->ysize = timings->vactive.typ;
>  	uc_priv->bpix = priv->l2bpp;
>  
> -	if (!bridge) {
> -		ret = panel_enable_backlight(panel);
> +	if (!plat->bridge) {
> +		ret = panel_enable_backlight(plat->panel);
>  		if (ret) {
>  			dev_err(dev, "panel %s enable backlight error %d\n",
> -				panel->name, ret);
> +				plat->panel->name, ret);
>  			return ret;
>  		}
>  	} else if (IS_ENABLED(CONFIG_VIDEO_BRIDGE)) {
> -		ret = video_bridge_set_backlight(bridge, 80);
> +		ret = video_bridge_set_backlight(plat->bridge, 80);
>  		if (ret) {
>  			dev_err(dev, "fail to set backlight\n");
>  			return ret;
> @@ -827,7 +841,9 @@ U_BOOT_DRIVER(stm32_ltdc) = {
>  	.name			= "stm32_display",
>  	.id			= UCLASS_VIDEO,
>  	.of_match		= stm32_ltdc_ids,
> +	.of_to_plat		= stm32_ltdc_of_to_plat,
>  	.probe			= stm32_ltdc_probe,
>  	.bind			= stm32_ltdc_bind,
> +	.plat_auto	= sizeof(struct stm32_ltdc_plat),
>  	.priv_auto	= sizeof(struct stm32_ltdc_priv),
>  };
> 
> ---
> base-commit: c98b6a6dcd1fc7bcba081fc2353954e33de5053c
> change-id: 20251209-ltdc-48abd0de6852
> 
> Best regards,

Hi Raphael

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
