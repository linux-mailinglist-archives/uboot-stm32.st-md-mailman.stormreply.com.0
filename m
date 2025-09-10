Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F289CB51B2B
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Sep 2025 17:15:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8CC3C35E2B;
	Wed, 10 Sep 2025 15:15:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19199C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 15:15:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AF2U0J003847;
 Wed, 10 Sep 2025 17:15:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 OSFJDPi81tRqoqP1rZyshNUk/Lktm1KnDuBZ4CtN0+Y=; b=nt+PVS18VEydjF4u
 7TAjfu1niqIrFGrK/Hcec586xlQPl5AiDkjNpdfTFLFKqJkSEsocppTQ1p0RyfR9
 lU4/7WGofhN9TR9UW6qV7jsRj8bYJEQdH7XvIhacawPprotiWrhKFJYDQqZaYTm5
 sPDVuf54FI7nhVDTZLL9VWLNz7rEGUqVN2MwirLTid70ybt9QBmDyiG8OylqYTJe
 f9pdYuURodXNCD9EMMAAAlzu61Jz10/JvlRINoRGPZiH40QlLlyGLhkiDJ5/52tQ
 dYqNI3+vcyWCr+UIYwJnAZlWQmcQIe637E4kCkJZoEUR9QH5cVGqWar0j0wc6hCX
 WF/NXQ==
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 490a388fsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Sep 2025 17:15:03 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWBaBQNMwY6HkFtUmBcTA6LbIpdJm8zzYzTTHsvToqxoqQ5vaxWFkH3cG5KO+wEL1ZEOyJpQJyjSsl/ORqQLvLZXLzOr8qtTRc9Rbj+sbKcFbmhfrYHyAE8tR+hLRAmUrc3IXET5HN2Nl4LlSUrUby/rWAVUZkdydtOU8Q9Eszvtn9GpyOyPw0rxrQlgCVJvmkr9FFFbw4OhaCYePh07AuQF7zeUnyYH+N/JmRPAnB0de3ZryFfdcHV1gnT6Wcx9h+B7Afiq+gYTiDfPNGFfLREuJg3gBOwXDsFc3vkRXcPzP/LbkJL5+aILnjRsfbnur2mcPCSnt3SxrdHy2W6j/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSFJDPi81tRqoqP1rZyshNUk/Lktm1KnDuBZ4CtN0+Y=;
 b=ZyGsIjrA9hPTZ17t5xGE4CenVg+4kGIQtwzPIrPVyBEOR5KvXHjvBj+gFU3exUBEHDPImOfNCZv8o+kcKGcTidPhy5AJJrihfWgJqHSYvdzqGke4NrPVTte4e2uwOvaevEuC+LJyyeQA95ZAnB1rkwwZPRGbpniN3UpVLG/0B5AGlb/wvZ7nhJT7EHULuyIBI0wXzU7AL1XhTZPE6e1KOsnRb+b+MrQMazFigehRWFqf/8rNzFSVpdTRBaMFUMvWL/rtH4R71Og7h0NCHVvn1O4A39RdynJaVf7KZGzFVHLHPawjywXzT+BwYuq9y1eiTkJr4nAUATraHt7kh4REgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSFJDPi81tRqoqP1rZyshNUk/Lktm1KnDuBZ4CtN0+Y=;
 b=FgHnHJMG1UBgCdDR+cZtdy1SGIGjGC4amxhiyoKY5SdwCpqT19Q9/9u9zQY358o8ICTmZ+Pw7XwsdedbgFT4RX8+8pFVL8XKzQsuaTERQhQGSc8G7WXvLcmgs2usjp5l+RfG+ZrP8wKqQPDqdmfDF+/GSSHhbnUdHEBBYysucho=
Received: from CWLP265CA0512.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18c::10)
 by AM8PR10MB4113.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1ee::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 15:14:59 +0000
Received: from AM2PEPF0001C709.eurprd05.prod.outlook.com
 (2603:10a6:400:18c:cafe::23) by CWLP265CA0512.outlook.office365.com
 (2603:10a6:400:18c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.23 via Frontend Transport; Wed,
 10 Sep 2025 15:14:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM2PEPF0001C709.mail.protection.outlook.com (10.167.16.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 15:14:59 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 17:12:37 +0200
Received: from [10.48.87.108] (10.48.87.108) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 17:14:58 +0200
Message-ID: <c0e47210-7c45-4213-8a64-7002d3b86d74@foss.st.com>
Date: Wed, 10 Sep 2025 17:14:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250808151154.472860-1-patrice.chotard@foss.st.com>
 <20250808151154.472860-3-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250808151154.472860-3-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.108]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C709:EE_|AM8PR10MB4113:EE_
X-MS-Office365-Filtering-Correlation-Id: efed5fe4-d96c-485b-8e8a-08ddf07cced2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUltVE43NHZOUXlyRmdTdWlJNDIzSDVkM2hGWXc0Y3FLMkZ5SWZ4dTI2L3VN?=
 =?utf-8?B?enhzVytCa1hFQU1naW5va2d2V0ZQcGRaZzlEeTFkdFAyeXNmeVpESTJXUy9Y?=
 =?utf-8?B?K0tCczVBcGNxYmlLcW1TeGV2dG1RWkNlM2hLTDg3Z0JSOWFoUk5USzBVb000?=
 =?utf-8?B?c2FYTXFnWTBpbndxRVdMRFY0ZFNYODNFY1VWejNPcU9oYVFKNW5PQ0lPVnhj?=
 =?utf-8?B?aGZ0czd1MnVUZFNtQkM2MmlLcENEbnJUTFAvMFVPaWNCS242VDRISy9Zbi91?=
 =?utf-8?B?RXBHZ1NQM2thTDl1czRGbTBGT2lSdWF0Sm9iQmpnTUJKNE05dURzdHVDV1gy?=
 =?utf-8?B?QlViTFRjQitxWHV2ZExoVEZyMUY5d0hsNTNOcXhHZ0lOU04wYlJacDA3TkV0?=
 =?utf-8?B?Z2FzQXZlWUFxL2RFaVB2R21WdzhtVG15dXkxd3d3M25RMCtFR2lTOUZtRkFn?=
 =?utf-8?B?QkVmYVM3MHBzOEpSRktnT0ozT3ZSTjVXcEdtQXM0Q2l5NzErczFJbmFNelUr?=
 =?utf-8?B?TFd6TFdFNEorSGhGbXdFRFpPZkg4bW9YNUtFSUVYZWI5Y3JwTEtCQWkvWW05?=
 =?utf-8?B?L3F0K01GQW9yRXFqbWFtL3F5MXd4cW1kUTVmeUUwanVBV0IyVmpWa21HTFdR?=
 =?utf-8?B?UmEySG9BcWlwbWJ2QnBoRllGZmc0am5qbGtCT3p2bmZhZktHcDFINGpFeitw?=
 =?utf-8?B?dGxUanM2WDJEWTVxdkEvYUhJdy9vL2Q5UFBQMEkvWlNYdThqd3YwaW9xUEJZ?=
 =?utf-8?B?U0pPOW5wQjgwTEdSMGVUdG9WR29sdWVKOGJ2OEhoZWlXQXFhRzBTWGRUM055?=
 =?utf-8?B?cUt3aVk0TFFWVWJhclRvSis1aVdFNmtFeE1mejFrWVUrM0VXeFh1eXBpeXVP?=
 =?utf-8?B?Ykx3VU4zRjE2RUJ0UlQ1S1pCSDFhTlhGSU1DTFNaMEFCZlZaQVR0MmU3WmZ0?=
 =?utf-8?B?RkJvMnBibStoUDNKMHhaT3VBRkNUUU1vQVBsSVdyRTN0d1BjcEdidlNhY2th?=
 =?utf-8?B?dkhDZkVPYmJwZUpOZm1pNXdYVCtpb3MybkxES3p0ZW1Tbk51ZzFQOWpMMWd1?=
 =?utf-8?B?K1VlcldKb0piR3UrL0hNbEw1VmFNc0w2SStVU3Rka0JvRUZVeDJyQk5KNmt3?=
 =?utf-8?B?a1g0YVhDd0ZzcmFoOGNmV2lHV1FQd01uTHhVdWRXYk1WVHJoaDlwNk1VQUdy?=
 =?utf-8?B?Z0NxQmlBcCsyTndtdmNwWHpxUzUrTEk3clZyWWczL1h5ZWY1eFRCYWlWbkI5?=
 =?utf-8?B?S2R5SXlDNFNtWm9uc0lpcXNocHpWOWhSN3JqUDF2YWNZYXlLUmpRRjM0VGhI?=
 =?utf-8?B?TVdlSit5VEMxZjViaU80SlBLemVhUzZ4RmZBem5jeEhIZ09LNzI1ZHR5QXNC?=
 =?utf-8?B?VFU2T21tM3kwb3lqeXFlNlk5QmQvbzhqUTJsL3FCdnNkQUxXZ3RmYzZ6ZGsy?=
 =?utf-8?B?L1czZ3ZtK3FlWHkvWUFqT1p3dDRSb0pGdEpBQWo3TTI3blVsMkkvWExVdzNi?=
 =?utf-8?B?N1hCbk5aaU1PaFhCcTA1azk3Um1KKzArR1FndGNuK2xsc2RWbzAwNVBnWndO?=
 =?utf-8?B?SVE1anZmRVFiRGM3dGlZcDVJbU9CUmdvMVZRUW50a2pzTU9reDJ5dmNzdExZ?=
 =?utf-8?B?OWZXY0htcVZZK1g5UUtCRHNrMS9vbHNmc3BqelY2SkxHQnNsUC9yZWN1REF5?=
 =?utf-8?B?RnJ0VlkyYTBMUEY5dm81OFJOazRqNnFTeHVyUXZ3SXd0TElaR3J1ZSsrS25B?=
 =?utf-8?B?UlBpT0JJajJacmZBUGFZYUdCbyszV0poL1hXbEliVFJiY05JTGxQbDNhY2li?=
 =?utf-8?B?M0tJdHlscEMwdm1Qejh4WlpScnhkREY3dmNUSHREcVpSb2gvTHJPd1BIWXAw?=
 =?utf-8?B?NWRxYWIybXRBK0pIbEp6d0JJZlJHSnBCc0JUTXRUcGxuZnAxVTQ4MTJoOW8v?=
 =?utf-8?B?YVN6VDVuQlZBTHdnT1ZDVW5jaDJLNVFVbERxRUV2NWNaNlF4aEE0TURrNy9y?=
 =?utf-8?B?RDBuZUYrOWF4SWo2Q0RpUThpVjdGckpUblF5SEwvQXYzRG52TDdab1ZVbkZN?=
 =?utf-8?Q?MvbKBu?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:14:59.2102 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efed5fe4-d96c-485b-8e8a-08ddf07cced2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4113
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDIzNyBTYWx0ZWRfX9rZtSmdOK6Bz
 //1aKYoNfvA2SFe134A0A7aMYZfH64N+z/Of6F8NBryraJNIePA4VyqQJ3JGShVYjH6Sg3s+/y0
 aOOip8C7M0vO1FdEqSHvEg2GE/h49u3NRd+nXNZdWyTmrOlc3IhcV05LkmW2DTIBKN1+8FtC9KI
 l04Fa51KSFGsmhHNW6Wm6kbMZ2t9fOqUOPu2LHghpLc/s0A2IGk+0WB/9uFyhwA1YPKfsgyoigL
 Wk7eP3MAHjoUO3nZPG1Nsv9Z/xrXhZZag5ehVYaT95BCg6xP7+8FggwrruJnVbuKBicfE5ss88C
 8PAwCaiYOIPWFdSYQsP55dY8pYWYXYtZKJJxWPk3JFsCEvjdOVimGQn2cMRjbDsw+2PHUZQCP8u
 bdS76NWu
X-Proofpoint-GUID: pV2HvzMb26zoQW7Y5Gl1nyOoe1rkGEmT
X-Proofpoint-ORIG-GUID: pV2HvzMb26zoQW7Y5Gl1nyOoe1rkGEmT
X-Authority-Analysis: v=2.4 cv=WLB/XmsR c=1 sm=1 tr=0 ts=68c195f8 cx=c_pps
 a=6ND+V5wNEo1yJtsqAko47A==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=q6CKDgr7omsA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=v3s8gjOfBfMl5tEdEBEA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1011 adultscore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2509050237
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: Re: [Uboot-stm32] [PATCH 2/5] memory: Add STM32 Octo Memory Manager
	driver
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

On 8/8/25 17:11, Patrice Chotard wrote:
> Octo Memory Manager driver (OMM) manages:
>    - the muxing between 2 OSPI busses and 2 output ports.
>      There are 4 possible muxing configurations:
>        - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>          output is on port 2
>        - OSPI1 and OSPI2 are multiplexed over the same output port 1
>        - swapped mode (no multiplexing), OSPI1 output is on port 2,
>          OSPI2 output is on port 1
>        - OSPI1 and OSPI2 are multiplexed over the same output port 2
>    - the split of the memory area shared between the 2 OSPI instances.
>    - chip select selection override.
>    - the time between 2 transactions in multiplexed mode.
>    - check firewall access.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   drivers/memory/Kconfig     |  17 ++
>   drivers/memory/Makefile    |   1 +
>   drivers/memory/stm32_omm.c | 421 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 439 insertions(+)
>   create mode 100644 drivers/memory/stm32_omm.c
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
