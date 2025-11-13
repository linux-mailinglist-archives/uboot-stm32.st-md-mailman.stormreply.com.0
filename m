Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B74C5926C
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Nov 2025 18:28:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAC28C628D4;
	Thu, 13 Nov 2025 17:28:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00C7CC1A977
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 17:28:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADGrLQ2150985; Thu, 13 Nov 2025 18:28:20 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013066.outbound.protection.outlook.com [52.101.72.66])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adan2jh8b-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 13 Nov 2025 18:28:20 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTj6U5QS+QAioSiTNDsgXTUKTMXlmqkArvskWT5naR2gsowQAn5qx4k8QPPQzUpQAdO95UnF/t25R1UDrUfZNw+o6+OyIR7Evl4weQ3jPmOdvJ/iwS32Ij/W/rDKDQCXIBJgTLNomg/1QS79h46KywgJmieU7nyH6qtYfOUifbM5lPoPrHs/7wRNytM8yKcsVCGYlEPsRektj0/fgFBdvQcOGHo5j3s7Gz8ipXlJI70wrOF8ZbZpVSqBBnjq0CsMDeGNYDsrpCaFrCW76F4rQ78sgbrTp6snFbgoEWleb7XkNqNoCQ8t02TCvxtVL95e3xJDoxeVp8785PM5H+D3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFTI2iT8fJbvGu7NOUMyPaq65pQHOWvSnppEhyCYrCk=;
 b=QUmwNkPROMuSfWtGpCDergwdUKixWZ44e6iUmbb05/q9+wLQQcxCuDc1NQJheU1nQiSkSB4EbmrYVIFd+wheCT1j/+ZNGB8XlqLeW5SV+aW3DeZ/A3xMUc4mY0PSSGKcYZtPaBSdIoUCJeWRqSmsccFoBaiZWftUnnEwoQB//psvxqOdqChbnpJDJ9pMnZt752BNwzGwnV35yxjXgOvjUHo1eZ1Kjl1GhyBPFi45AF8Q237aApB/3u5oC/IFeijUmh3tnDOddyPlY5/jJpMyz/SVhpkapoHDYXyiBP0NQEHNyTobBHf/ZH/OccAQVpJJ6uPto91FD6a6+hRu1DtdQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFTI2iT8fJbvGu7NOUMyPaq65pQHOWvSnppEhyCYrCk=;
 b=VwgZUSBFB3eyDS9tvHhJ2qGtL+vPPKPwMsrYnMqCUwfdmJqQV+Az9Eg+fULRg3WeCbmcIHKf7qVJ66gM61C/GSKxFmb1ZSl5Tfm2uCndUhmEUSLTXrZXpurtAZKvhrGq8GFKAVbb0VrZV47kJKkG1kDXB0h9Zj/+vmbaLcA5owK1tQQMvK0aWQtkPRDIJlpU4paaWM1gjis7UywJaRCE/UsATfp3f1Gebfl+yar0mdzU10TRAPlGumgJ6HxN8F/DgLvRrAklVJBodQgD/9dJ3M5kSYtfzgxGIX4yUteK3zCxwt4bUO4cKqMrO+lrNPz7vveOnaQv1HDeWMyhxuG4VA==
Received: from DU2PR04CA0355.eurprd04.prod.outlook.com (2603:10a6:10:2b4::34)
 by PA4PR10MB5732.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 17:28:15 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::b6) by DU2PR04CA0355.outlook.office365.com
 (2603:10a6:10:2b4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Thu,
 13 Nov 2025 17:28:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 17:28:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 18:28:25 +0100
Received: from [10.48.87.108] (10.48.87.108) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 18:28:13 +0100
Message-ID: <4afefb55-b8da-4a2c-90b5-a188662c7181@foss.st.com>
Date: Thu, 13 Nov 2025 18:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20251017121852.109561-1-patrice.chotard@foss.st.com>
 <20251017121852.109561-2-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20251017121852.109561-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.108]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DF:EE_|PA4PR10MB5732:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f4c7c9-d337-443e-771a-08de22da06e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVF6cWF0QnpuS0JUNEF4L3dJaXZ2WGxIZzJ0T285RVBEdVJHV1JjWWMvRUd6?=
 =?utf-8?B?dXpXazZucVpzNm9NamRWelI0RXA1eW9FeURyTnRiMDFyQ0YvcS9lUjdJQXpK?=
 =?utf-8?B?M1pLVjh3dmNETE44aHJPMkMzci9ubitQc2pzbmFFaW54bFIyYkJ0T1NmVnlz?=
 =?utf-8?B?SjU3SW1IVkFYaXQ0R2hmTzIrL0dIbHNJSTdaNHE1ZlNINjJ0cU1FUzBndTVk?=
 =?utf-8?B?VVphSEZ1U0w4WnNVck9COGRMSWxKUHlKT0NtVWVvb1hGQ1pYR2lUVi9ZcUxX?=
 =?utf-8?B?WDQ0SjhSWTM4TXJ5M2piem5GbzdoWm1xVnRyYlVla28wcE5oK3dabHcvdFBU?=
 =?utf-8?B?amljcWY3SlluMUREWldnY1pJSTViK1hhT2FrSEtiQll0emwrU3ljYlArVWVB?=
 =?utf-8?B?T0w2Q3hJK3lNWllOZGVuZGJjaUd1U2RKdS9CU3JDOVFiejhvaHpmMWI5NDhk?=
 =?utf-8?B?Q2hneXdPbUxZVFJOdUFkN3VvS3ZoZW9oQm9mbWNRaGZhM3lycFByOHRUVUR0?=
 =?utf-8?B?UGMybjNNVmtTOHZGQktMNXQ4clpBWTBlMVFsQk55NlVUT1RQUFRBRjFrb3l2?=
 =?utf-8?B?SjlENEh5QnkxRkVIZUNMY0NxRzdTWjJoMTAyamJoL0IzWVYvMjErNjdXVEsw?=
 =?utf-8?B?VGtRQzZzTDhkR0IzazhLazYwVjVpSjQ0Sk9RdURXK285dzRBcXhWTXVsUThV?=
 =?utf-8?B?aTg2dlhLb3p0bU90K2tjSERSTWYyT3JmT09nekM4SENhcFhETkx6Ry9LTlMy?=
 =?utf-8?B?Ty9RU2ZEc3BjQzJ1ZXFsR3RmdmdsQXpBTlVyaVV0OUJEOW5UTmZWbGNhdi9s?=
 =?utf-8?B?VVF5cHVidWhvMytnTjdlUnVCc2RxWDhBWnFRVUNBc0VxbUdCQkpXTjF6Wkkx?=
 =?utf-8?B?aElNNUxzdXdDczdoajVSZDR4OUNyUUFTYWNZZ2FFc0ZrUXRNcFlERWNPZFIx?=
 =?utf-8?B?TktONmYvS3lhU0k1bFFkZ3huRmJIQ0xLSXRnYzlNSmRxdytYTmJZMHBOMXlH?=
 =?utf-8?B?MUNQQ0lGQkVoQ3VzMXJqVXA5SlRER3c5OUdFbGJRZE1Ob0RFK0lTZ3JudERq?=
 =?utf-8?B?ZUVzTzVWYUFBN1NJU29QMkZnNUg2akJJeFpiblVQNWNzT01qM3IxWmtLMUJV?=
 =?utf-8?B?N2FhV2dzRkgvMHpvVjJHZTB2QWxvRVJtMDJpLzluRGxWZDhrY0lwTkQ4SHhN?=
 =?utf-8?B?RDlKRElqOVpWU0E1WUU5TkhaWGxZZmFpN1JuL1hUbktOVTg2MDRLOWE3Nzhm?=
 =?utf-8?B?QUZWQXJGZGcrVngwekVEUDAyK010YUEyV3cxMG5YcmJDNE9wWmxBWlVPdFFn?=
 =?utf-8?B?eFpqQ2FzL0M3VzE2RkFBbUVkSnBlbjNwZkJyOXJYcFdJYXRlOWtkckNyVGdU?=
 =?utf-8?B?Sng4SnJpN0NYTnZJMXpraEFEcjZpWGRvWGs5ZGJRRFNUaVZYeFcwL2srd2RT?=
 =?utf-8?B?dHNqZHI0bUxiRU9HMmJrKzRBV3U3SXhRZjc5ZVdvSnRhKzM3VjJDeWlKZW9y?=
 =?utf-8?B?K0t1aGJSQWxKd0NSLy94a21ud2dySEZUMFNuRldNSC9wOXZkNy92RXVMbjFr?=
 =?utf-8?B?T2FCZjlHckZWbHkvNUtSc3RwQ0dLZjdGdnNEYy83ekJJQlJ0QlZNQU5KTUdz?=
 =?utf-8?B?bjB0aDcydTNYOW81VlRUMGt6c2xjL0V6MjhRWFl4NElubkFIQmVNclMzUGQ0?=
 =?utf-8?B?NVc5MVBXb1JBYlpOaElmYmNVS1ZyaFNKT05lbFY2dTNLUysyV0NGdUxxMXc0?=
 =?utf-8?B?Y1FCT0pwbnpBNWcvOW5TSC9yZVovR3NFOHZhK2RSOGhWOHhmOUFsM0FoM3pl?=
 =?utf-8?B?aDg1MCt0c2NhOVN4c1Z0U2QybXhzc0VUbGtiR3pob1VGUTZiSmVVUzVjYUdi?=
 =?utf-8?B?RjNra21YeGxPVk1XYTM2MEdkUzdtOXFBa3ZkSkIwTGhQMUR4N09ZaFJlNUdL?=
 =?utf-8?B?TVliRCtlZ0dhZkJOWSt2TTNyVVJCM2E2T2NDc2YyY2tVTy9KWGhrdjhKMnd5?=
 =?utf-8?B?YUV2S252cmJ0VUVkS3gyVyt0bTRNZ2MxdnVTWkJVTy9HK2x1M0s0ZTh1MExY?=
 =?utf-8?B?T2NVQmlBWXJGY3VPRm1EdjV6azI0WjFHcVU4ZjN5dkVJU2hXZVVPaTJ3MnRM?=
 =?utf-8?Q?Fkfs=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:28:14.6246 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f4c7c9-d337-443e-771a-08de22da06e8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5732
X-Proofpoint-ORIG-GUID: WyT1C5XtShcR19DV8QDEsY_07fhRF9gE
X-Authority-Analysis: v=2.4 cv=DOiCIiNb c=1 sm=1 tr=0 ts=69161534 cx=c_pps
 a=tE6WatfC+N3twNTB5x6S4A==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=q6CKDgr7omsA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=NH04S8JGbfqLuQlt0QQA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: WyT1C5XtShcR19DV8QDEsY_07fhRF9gE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDEzNiBTYWx0ZWRfX9uHw19De5QYm
 07TKtwqWUIwL7F7ZFuN0ydBK+rCBu0/BmZQG+c9WJm9gc2C23rL/E/RyopJCh1EI8kUxTok8E4Z
 QHB1ukQGcuags+qBwQaRk0mK31vsDPjnie++giIWofcxBLloLGmy33J2Pnviz7OHikldfW0t9S/
 BLLVARxvEpIeuN5scjbk39sN39hI3MRH8qYKwIkYQVyqrjLKOI8/FkYnDkT+noLDwaearY6rJ4x
 3HkljDK1AvS5KghMGRoCHBsTxvpQKRfGlIsK/nU0Z1kkD1lO3xi0SuDYuSAxDXtZVaO2i8prO/u
 8rvvOlpMfNzKWEmb9evDH3LDsbG25q8gViRp68OgwArltOhzWFq1nxcfxcO0+b57qQDWjY7PE/E
 Uk9dJjblf9obHx6UZhJktsOYkiqUqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_03,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130136
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/5] ARM: dts: Add
	stm32mp257f-dk-u-boot.dtsi
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

On 10/17/25 14:18, Patrice Chotard wrote:
> Add U-Boot support for stm32mp257f-dk board.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp257f-dk-u-boot.dtsi | 26 +++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>   create mode 100644 arch/arm/dts/stm32mp257f-dk-u-boot.dtsi
>
> diff --git a/arch/arm/dts/stm32mp257f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp257f-dk-u-boot.dtsi
> new file mode 100644
> index 00000000000..fe3fe9c5166
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp257f-dk-u-boot.dtsi
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
> +/*
> + * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
> + */
> +
> +#include "stm32mp25-u-boot.dtsi"
> +
> +/ {
> +	config {
> +		u-boot,mmc-env-partition = "u-boot-env";
> +	};
> +};
> +
> +&usart2 {
> +	bootph-all;
> +};
> +
> +&usart2_pins_a {
> +	bootph-all;
> +	pins1 {
> +		bootph-all;
> +	};
> +	pins2 {
> +		bootph-all;
> +	};
> +};


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
