Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E49A9C9F452
	for <lists+uboot-stm32@lfdr.de>; Wed, 03 Dec 2025 15:20:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86194C5C842;
	Wed,  3 Dec 2025 14:20:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45ADEC5A4E4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Dec 2025 14:20:29 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B3EEa1U933320; Wed, 3 Dec 2025 15:20:06 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010020.outbound.protection.outlook.com [52.101.84.20])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4asy5an5fx-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 03 Dec 2025 15:20:06 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9P1MCMaQDeXnxTTUhJFdufuKIeSz/sKeW1xcGfRF67GpBMW0nL/NjBfeEfOR0y9X11UJOpAkPSPQvdlW3PP4354QrSDw5XmmiDIZ7cRJq/GS0O61vOVMqH+gBwKN/5BiiQKV24Mn9vhyAYvx5K0QWL2mG97s4WIJQL2AtkQA+6GwWBZeJOoPP7BXmhtwKfmFv++iv0v7zi4zF6WlvtVgF97MJWcS0GY0pKn6e2blT0L5/0Pnu+wC1kyoNfL00LvG4t8/Eo6l8s3QTH9cS2t8EcEMJnsZJXISpgmgOHSYlqCNZlitL+d+WKo7tdBeCX0NuRMaS1eBMpcmFx1Kz8Edg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBzMJF705OjS1nCO9W7ctxk7IwEtXJoGpGH5zLlqe/A=;
 b=hBX7rnDdevvWw2rmo+7AiK9q36cQ9rD6W7BlCVcEO2Du4RUHQ1YIxsw4Laz0n9oVve8h1+39pODrLp81DPUPkoy1NkaWHY+rKpr6NJ8AnFefKSzQiOB9j5C0V4i/oPjHrHkBqVicAX7kHRESktgbpQniLRtF+tJr94YHnzuopvlW+8g3ZFCL2Ejp+sYti1gJfVLtRLfBjUgNHNhnuIF0eqMnckvYnCMMdCM30DxnkAzZvLDdhCLDpTxGW1FoFDjXKreqidYeiTN8v7nFwFzhESHYY0LvleNvMZppRCEz2c1fJn3e6gH9heeNGvtNOucd185NnSuqknm0DVovSXQChg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBzMJF705OjS1nCO9W7ctxk7IwEtXJoGpGH5zLlqe/A=;
 b=HxkxOtHSpMtCzJRb45Bxj0OAqvwYCTNtQiOB+kO8R2y/yj6mvwWhgosMlpSLL8sQxmWvYFLQdBJhKglZ9FqDtxR5ZwfUeG/P3riACoYKbd1ozo22WG+Y2JUOSaAJW2/CI0UoBeBfWV3ST6371JVwZrWeT8+RxojRh9igI+BaVXYPHK6253YqG7J55C5hBZhyZLSnXjc5xHNKgrVt0KggqPxcC5gj6fSwO0QH5eo2avtSNwPjqMtZkptXvaw7wH4wuyeRjLK6rfRikBejEsJ0wV0HtO7Mw1QPcJyvphipS1oRYGftarH5hvvVkmdxKrtvVkwGgtu1CKp84wvX+3CwZw==
Received: from DUZP191CA0064.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::17)
 by AS2PR10MB7480.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:590::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 14:20:01 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::93) by DUZP191CA0064.outlook.office365.com
 (2603:10a6:10:4fa::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.10 via Frontend Transport; Wed,
 3 Dec 2025 14:19:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 14:20:00 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 15:20:37 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 15:19:59 +0100
Message-ID: <7d765b01-f905-4139-a72d-059f748eba87@foss.st.com>
Date: Wed, 3 Dec 2025 15:19:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251118231953.578007-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251118231953.578007-1-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922E:EE_|AS2PR10MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff9494c-5be2-4b27-1a77-08de32770b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXN0L3ZqZmk0TnJWRGNrYXJzWXlQc0FSNnRHa0JXdkdybERPL0JmcFVTVk41?=
 =?utf-8?B?SFloNS9zOXc4STdZY3VwUDkrSXFsSFRySlY0Q0Q1UXVFYlpNMlVYVzZqeEkw?=
 =?utf-8?B?UkQ5TTRWQ0FBSjhpQUZRR01jKzhKcno3RFhHWEJRSTRLY1BKUEx0UGlLVVhF?=
 =?utf-8?B?dVhmNUFiWmNKZnlCNDEreG1YOG9MdnNRUnJWNzdHUmpySjNXaGhlS3E0TzI5?=
 =?utf-8?B?VXh6am5UZHJGdzVMbThQWnNKQVpNdHVlWmhjU3ZyMCt4OS9tZnBRUkRMRytU?=
 =?utf-8?B?Y1ZzZkZsdEc4NXJEV1N3RUhEamFjdVhwOU9BVTB5M1BwSmpYQmd3ZkEvOFJM?=
 =?utf-8?B?OEYwU3ZuOHl0ZDBPcEdTbHJCcjBjTTZPMnkxN3hVdDNNY25mQ2RzZjZLS3di?=
 =?utf-8?B?VDR1WC85K3piOFVERGtCYVFnU1dNOTZWZG9TZnJIQmMzY0lsbUxzQW4zbC9q?=
 =?utf-8?B?YXNvZWZwNG9LNjBpdU00Qk5uMzgxMG5MTGIwd2Vna1B1aEh3THVsbUVEa2lT?=
 =?utf-8?B?a0dLdmpwVkxvSXovdDhMQkJIaDloU3hZN1BFNUVsSkR4YkRzTWtRcjBFaUFO?=
 =?utf-8?B?MG9FeVp0akZHeW1WL0h2T1ZmSkgvSmlVbWswVi9WdkpLWjdhRVQyei8wVUFa?=
 =?utf-8?B?eGttVjh4eFg2aTFzQzhhWlJLcUdaeXl0cGxrVjVtd1FBZlNRU3QzeHpCK0lp?=
 =?utf-8?B?ZGJpZUt4Sk52NlpqMEtTU2piNWtxMlV2K00xSFdudzBSTlBhRFRzbXVGcCtM?=
 =?utf-8?B?YmwwTkdFanVCMEJTaE5zL2pVOUJHbXdIMEZuWlB6S1d1K3o0QzFjbExic0RW?=
 =?utf-8?B?L1NSZDZnYW53ZHRrdnRXNUROS0xTdTBVbFgvR2xNQnROOCt0ZEdIWWQzVGRY?=
 =?utf-8?B?Sk0zRnZYTUQ4dDQ2b0d6Nkx3bWZOYURXblhrdTh6WkNzbWRFanNEVDhzRnl1?=
 =?utf-8?B?bzZob2tkaTBsaE1mM29JVC9zd0Q3WENjUi9NT0g4Z2J0SFcxY3NNdU9PcHJG?=
 =?utf-8?B?WUc1VGFVNUpPOUJEY2tjSDZpd21SaDcwSlB3T3Q4NzhDdjZqdUs3QzBRTDJK?=
 =?utf-8?B?UHZrNlE0SUtueElNYXRoVENVbjZqYlJncDk3WWRjaDhtSG4zckZQU1YxaXZY?=
 =?utf-8?B?YlBsZ1ZLMmdFaUJ1SnQyUC9nQllmK01ReldmZzFNRTRPaDJwUlZmb0RET3A2?=
 =?utf-8?B?bUJ2ZHRBZUYybUJkdnhVZE1uclRjZkNubkxydHJqZXlVc1U3L21FVWZNSlUz?=
 =?utf-8?B?aHZmTXFmQnNTTERmNVNCTU83VFYzVDdrRzBqaTNPTHk2WnVXWitYUkVOOG83?=
 =?utf-8?B?UHo5dE1WOEJHN0JlTTVwZHFaSXIzMm1OZ0luL2cxa2h0bHhiZjJ2OFArSkds?=
 =?utf-8?B?Ym54VXMwZDEweTlEVmx3dExJRnhVempoeExVVUtiY2w3M3BoalZVVHhVR0kw?=
 =?utf-8?B?NHh5SklPWUQrQlZTVzhCYmlXTC9qVHFVNENWZTFaeWgrdWZ2TFhZbzErQ2F0?=
 =?utf-8?B?bHV0QTVTWWNQelRLSmZoS3ZKc1VZMUxFRWROZmtGeHJ0cVZuU1kySVZFRk1s?=
 =?utf-8?B?bWFsc0VuNTJWSDQ2TldDVjhKSklVUU1FMi9rVjZIem9Pc1FET2RhQXA0c0lC?=
 =?utf-8?B?c1MveDJhUE91K1pHRVJKQkxnbk4xcTR3UW5LMXhLcExwLzl5N1NrZElHTWFF?=
 =?utf-8?B?SVR5TXNQRll3WXBFcTJwV0FVL25scEJNbHpHZDhXTW5UN2dkdy9OU0RCTUhr?=
 =?utf-8?B?UlFMeCtBaDBnelNtMFViTHpRNDNVTit6OERhV0pKQndyb0tFYWFNWXpnYS9o?=
 =?utf-8?B?SFJ5NWptcHk5Mkxub0dhdGdsUFZiR0lSRkZ5U2NiZVQ1MFdvUHBXREMyQXJt?=
 =?utf-8?B?UVhCSjZlMm5LZys3VEphZGw2MjN3WHM5ZlZsamo2alY3U3J3NjNpNHNZb1Jh?=
 =?utf-8?B?THdtOFkwZU9vWVRMRElUTTFqNnFoS2MrVzB3RVMvVXQ2ZFhHWkY1RHNKTUh3?=
 =?utf-8?B?Kys0YWhhNjZZNkRCbTlYNmNzUjdaWk1jbHRKcTN3OHEwWkRMYmd6Tlg5Ni9L?=
 =?utf-8?B?VTAwYjFRTGRzZ2pNdnA3cVhpblBYMHdiODhCVnAvMk9TTzg1dlBWY1A0WmZv?=
 =?utf-8?Q?JwfY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 14:20:00.8506 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff9494c-5be2-4b27-1a77-08de32770b8f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7480
X-Proofpoint-ORIG-GUID: 2tfa4YAdGpc4EnAMcanwyUlMmTSEayP2
X-Authority-Analysis: v=2.4 cv=S+vUAYsP c=1 sm=1 tr=0 ts=69304716 cx=c_pps
 a=gpZAzFDmpECe51Nb6QHpHA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=5VH98buAzicV2Y1zDbUA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDExMiBTYWx0ZWRfX8y1PdfCodmuT
 YCGNcVAs3iSr8Zp40NKDA77IDE3k9hZs7nARRRgKtLN5kqHmoCD1CVO5mPzKCBc5g/xGDdQ+Ehr
 Anzw7mFlpI8CUjBAJd/+5kYS0OGKF6899nbA3jFbZAM3CAnQ310SuMjiVGq7nEASGKNJ9g1OXZp
 MGX04p5cvDmnXoCl9n53WaFdXRX2nJTlXnHaYoKWyxi8uVjwkaDkCJ1C6V42vGMdzoeES0Y2tEG
 cEpO0+vus2jpPMmwIMpMdv5TApskFXpInegsJzvpNW69rZN5TQ19+DwnOIeHObXQLwYIvPrbyVr
 sBT2mALEEGffYunsYPcbjBKxxokSjiV0m3wpsJHVOi8A8i0s+bVupTmtC1z/PX00kXHGBuj6Ix5
 ysBBDSfvuT6LO63IQufmHTac8Won/w==
X-Proofpoint-GUID: 2tfa4YAdGpc4EnAMcanwyUlMmTSEayP2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030112
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add 1 GiB DRAM settings
 for DH STM32MP13xx DHCOR SoM
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



On 11/19/25 00:19, Marek Vasut wrote:
> Add DRAM settings for 1 GiB variant of DH STM32MP13xx DHCOR SoM
> and support for SoM DRAM coding HW straps decoding and automatic
> DRAM configuration selection. Enable CONFIG_BOARD_EARLY_INIT_F on
> all STM32MP1 DHSOM, as it is required for the HW straps decoding.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  .../stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi | 100 ++++++++++++++++++
>  arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi    |   1 +
>  board/dhelectronics/dh_stm32mp1/board.c       |  30 ++++--
>  configs/stm32mp15_dhsom.config                |   1 -
>  configs/stm32mp_dhsom.config                  |   1 +
>  5 files changed, 123 insertions(+), 10 deletions(-)
>  create mode 100644 arch/arm/dts/stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi
> 
> diff --git a/arch/arm/dts/stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi
> new file mode 100644
> index 00000000000..1d268d58b54
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2025, DH electronics - All Rights Reserved
> + *
> + * STM32MP13xx DHSOM configuration
> + * 1x DDR3L 8Gb, 16-bit, 533MHz, Single Die Package in flyby topology.
> + * Reference used W638GU6QB11I from Winbond
> + *
> + * DDR type / Platform	DDR3/3L
> + * freq		533MHz
> + * width	16
> + * datasheet	0  = W638GU6QB11I / DDR3-1866
> + * DDR density	4
> + * timing mode	optimized
> + * address mapping : RBC
> + * Tc > + 85C : J
> + */
> +#define DDR_MEM_COMPATIBLE ddr3l-dhsom-1066-888-bin-g-1x4gb-533mhz
> +#define DDR_MEM_NAME	"DDR3-DDR3L 16bits 533000kHz"
> +#define DDR_MEM_SPEED	533000
> +#define DDR_MEM_SIZE	0x40000000
> +
> +#define DDR_MSTR 0x00040401
> +#define DDR_MRCTRL0 0x00000010
> +#define DDR_MRCTRL1 0x00000000
> +#define DDR_DERATEEN 0x00000000
> +#define DDR_DERATEINT 0x00800000
> +#define DDR_PWRCTL 0x00000000
> +#define DDR_PWRTMG 0x00400010
> +#define DDR_HWLPCTL 0x00000000
> +#define DDR_RFSHCTL0 0x00210000
> +#define DDR_RFSHCTL3 0x00000000
> +#define DDR_RFSHTMG 0x0081008B
> +#define DDR_CRCPARCTL0 0x00000000
> +#define DDR_DRAMTMG0 0x121B2414
> +#define DDR_DRAMTMG1 0x000A041B
> +#define DDR_DRAMTMG2 0x0607080F
> +#define DDR_DRAMTMG3 0x0050400C
> +#define DDR_DRAMTMG4 0x07040607
> +#define DDR_DRAMTMG5 0x06060403
> +#define DDR_DRAMTMG6 0x02020002
> +#define DDR_DRAMTMG7 0x00000202
> +#define DDR_DRAMTMG8 0x00001005
> +#define DDR_DRAMTMG14 0x000000A0
> +#define DDR_ZQCTL0 0xC2000040
> +#define DDR_DFITMG0 0x02050105
> +#define DDR_DFITMG1 0x00000202
> +#define DDR_DFILPCFG0 0x07000000
> +#define DDR_DFIUPD0 0xC0400003
> +#define DDR_DFIUPD1 0x00000000
> +#define DDR_DFIUPD2 0x00000000
> +#define DDR_DFIPHYMSTR 0x00000000
> +#define DDR_ADDRMAP1 0x00080808
> +#define DDR_ADDRMAP2 0x00000000
> +#define DDR_ADDRMAP3 0x00000000
> +#define DDR_ADDRMAP4 0x00001F1F
> +#define DDR_ADDRMAP5 0x07070707
> +#define DDR_ADDRMAP6 0x07070707
> +#define DDR_ADDRMAP9 0x00000000
> +#define DDR_ADDRMAP10 0x00000000
> +#define DDR_ADDRMAP11 0x00000000
> +#define DDR_ODTCFG 0x06000600
> +#define DDR_ODTMAP 0x00000001
> +#define DDR_SCHED 0x00000F01
> +#define DDR_SCHED1 0x00000000
> +#define DDR_PERFHPR1 0x00000001
> +#define DDR_PERFLPR1 0x04000200
> +#define DDR_PERFWR1 0x08000400
> +#define DDR_DBG0 0x00000000
> +#define DDR_DBG1 0x00000000
> +#define DDR_DBGCMD 0x00000000
> +#define DDR_POISONCFG 0x00000000
> +#define DDR_PCCFG 0x00000010
> +#define DDR_PCFGR_0 0x00000000
> +#define DDR_PCFGW_0 0x00000000
> +#define DDR_PCFGQOS0_0 0x00100009
> +#define DDR_PCFGQOS1_0 0x00000020
> +#define DDR_PCFGWQOS0_0 0x01100B03
> +#define DDR_PCFGWQOS1_0 0x01000200
> +#define DDR_PGCR 0x01442E02
> +#define DDR_PTR0 0x0022AA5B
> +#define DDR_PTR1 0x04841104
> +#define DDR_PTR2 0x042DA068
> +#define DDR_ACIOCR 0x10400812
> +#define DDR_DXCCR 0x00000C40
> +#define DDR_DSGCR 0xF200011F
> +#define DDR_DCR 0x0000000B
> +#define DDR_DTPR0 0x36D477D0
> +#define DDR_DTPR1 0x098B00D8
> +#define DDR_DTPR2 0x10023600
> +#define DDR_MR0 0x00000830
> +#define DDR_MR1 0x00000000
> +#define DDR_MR2 0x00000208
> +#define DDR_MR3 0x00000000
> +#define DDR_ODTCR 0x00010000
> +#define DDR_ZQ0CR1 0x00000038
> +#define DDR_DX0GCR 0x0000CE81
> +#define DDR_DX1GCR 0x0000CE81
> +
> +#include "stm32mp13-ddr.dtsi"
> diff --git a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> index bedb7c600d5..39ac5692e08 100644
> --- a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/clock/stm32mp13-clksrc.h>
>  #include "stm32mp13-u-boot.dtsi"
>  #include "stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi"
> +#include "stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi"
>  
>  / {
>  	aliases {
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index c18f1911fe4..55526189d5a 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -304,17 +304,29 @@ static void board_get_coding_straps(void)
>  int board_stm32mp1_ddr_config_name_match(struct udevice *dev,
>  					 const char *name)
>  {
> -	if (ddr3code == 1 &&
> -	    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x1gb-533mhz"))
> -		return 0;
> +	if (IS_ENABLED(CONFIG_TARGET_DH_STM32MP13X)) {
> +		if (ddr3code == 1 &&
> +		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-1x2gb-533mhz"))
> +			return 0;
> +
> +		if (ddr3code == 2 &&
> +		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-1x4gb-533mhz"))
> +			return 0;
> +	}
>  
> -	if (ddr3code == 2 &&
> -	    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x2gb-533mhz"))
> -		return 0;
> +	if (IS_ENABLED(CONFIG_TARGET_DH_STM32MP15X)) {
> +		if (ddr3code == 1 &&
> +		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x1gb-533mhz"))
> +			return 0;
>  
> -	if (ddr3code == 3 &&
> -	    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x4gb-533mhz"))
> -		return 0;
> +		if (ddr3code == 2 &&
> +		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x2gb-533mhz"))
> +			return 0;
> +
> +		if (ddr3code == 3 &&
> +		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x4gb-533mhz"))
> +			return 0;
> +	}
>  
>  	return -EINVAL;
>  }
> diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
> index 210ec201bf5..d5ecbac29e0 100644
> --- a/configs/stm32mp15_dhsom.config
> +++ b/configs/stm32mp15_dhsom.config
> @@ -2,7 +2,6 @@
>  
>  # CONFIG_ARMV7_VIRT is not set
>  # CONFIG_BINMAN_FDT is not set
> -CONFIG_BOARD_EARLY_INIT_F=y
>  CONFIG_BOARD_SIZE_LIMIT=1441792
>  CONFIG_BOOTCOUNT_BOOTLIMIT=3
>  CONFIG_BOOTDELAY=1
> diff --git a/configs/stm32mp_dhsom.config b/configs/stm32mp_dhsom.config
> index 56a40839d28..31fae2de19d 100644
> --- a/configs/stm32mp_dhsom.config
> +++ b/configs/stm32mp_dhsom.config
> @@ -6,6 +6,7 @@
>  # CONFIG_SPL_PARTITION_UUIDS is not set
>  # CONFIG_SPL_PINCTRL_FULL is not set
>  # CONFIG_SPL_SHARES_INIT_SP_ADDR is not set
> +CONFIG_BOARD_EARLY_INIT_F=y
>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>  CONFIG_BOOTCOUNT_LIMIT=y
>  CONFIG_CMD_BOOTCOUNT=y


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
