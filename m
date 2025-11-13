Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C86FC594FD
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Nov 2025 19:00:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD2D8C628D4;
	Thu, 13 Nov 2025 18:00:44 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 574C7C628B7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 18:00:43 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADHgcw9230861; Thu, 13 Nov 2025 19:00:26 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013014.outbound.protection.outlook.com
 [40.107.162.14])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4acq20pr3p-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 13 Nov 2025 19:00:26 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9PtpvDiJhP+muFcGNBBgVTwVHorjQ+Ow9W+vtQrEV7uhnvS/UPoFE9ofa9Kbcc04tYY71ZT9UzW6Y6lqiUZJ75CKyut2dfd14gVzuCmoqJu7KXXeJg8GyXCFiNlF4X+BBnDwf4N/ixbSupjo1ZjYcNrJi7BczwFGbx0/r28I0hHPRuudlDNr78EWy4T6+d0c3rmYhIbXPSpkiLyn2qTuIk46QwQH+oY5NG23+q7D69I0RraJbckuuJ688BWibCBZ/6QY5bbBxCX/jqImWZ2qn+WeRv48pImAqjlN6LA4mSmFTbYcP+TH9kAKXzuAawgSE0sONawmOIzVhq0hVqidA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duVYz1twzTMQTbsGWxcgEOGCLj4wZ7LLI8QBwSVwoW4=;
 b=vsrM6W6sm1DnvrFSVkAoBnwnxDjSVaHF1TZFWxqycqHplgFDdQ761k4fmf66LQN95+6KWvxYJky/MtsY4tnoawxatBk1rOJrjGUAIl+10eD0E6HEgw6YaF7QrqFGsWlM5K/F0h/WqhGyCpmCPJwHKm8CCJizA0+kV1mdDWU6XJW1/HmZIKCt2NunWdIOk7ARiDB2vUc/aQvDz4S5MzmGlUHwNIUyDxGTkgV4Eg+jfjwg+j1TrHbQZDIZn7WXynWM9o1knpeKk5KEWfssqCXAhhrJAmNsw/h1q3GUpLS5kWsC42aro0SGH9kvUHFoKegLOsojeLkfbQ6Nfn3beN+DuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duVYz1twzTMQTbsGWxcgEOGCLj4wZ7LLI8QBwSVwoW4=;
 b=lIaF8uULIJ2AN9ryLVZbzvx98IPocpXLSMGzLbUBZOaaveKrIXXNumLEaAsmOt5Pj+Oq4zuu8DiMCHKBnp7p5+5lH/Qvwikuygc45P1Qb/pYqiZCBQfTvFwflKRKukmbO5zoViCcPCwUk34iJrYhfkRsM7It009JtALuJg6RA9VqisksRbG5hUKptCw11tknwrKanyYlUz1KOWxKpS7M3jphh94NjpaPdWnpw6zo/7iJdV+Y6SMCG8GxZyvHHvLaMr2299BJ+m4fJ05VDy75zEAyf6pmxII3Dwr2I+Z7LW9st6nH4HuftrXa5cwd6IuAVW/Y7a2npo6kEI/P8VU2PQ==
Received: from DUZPR01CA0044.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::7) by DB4PR10MB6072.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:38c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 18:00:22 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::a5) by DUZPR01CA0044.outlook.office365.com
 (2603:10a6:10:468::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 18:00:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 18:00:21 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 19:00:31 +0100
Received: from [10.48.87.108] (10.48.87.108) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 19:00:20 +0100
Message-ID: <8cda2e20-98eb-4767-a887-1a4db050f46a@foss.st.com>
Date: Thu, 13 Nov 2025 19:00:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20251009152610.300154-1-patrice.chotard@foss.st.com>
 <20251009152610.300154-3-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20251009152610.300154-3-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.108]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D04:EE_|DB4PR10MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f220769-81cd-4806-c585-08de22de8391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXNCM0R2VklvZWRJa0t5T2xjUnhpdWdUVklhbWhqSkVvWXFBdXlML1dVbTdG?=
 =?utf-8?B?bXNJRFNnRzYvaHNOb0p4SHlGNmV3NFU2TUZ2SjdnaXAyVHJ5eGlkMk1zZXk5?=
 =?utf-8?B?MjZId0xJT2FHeWVOTU5wd3lackhrRURaWDVseDhtVFc1Y0wrL05WdWlnYzRP?=
 =?utf-8?B?TE9KWmhpWks2clVQdGlna3VYMThRR3IwbzNTbmpQaXhlTEdNdUhkandoTXY1?=
 =?utf-8?B?MnVyRC80UXo1MWZPcVgveXRxNkhhYVhIVXQxK29MZ2dlZ3lEMlpQdUZvVkEy?=
 =?utf-8?B?ZzhiNGIyTCt4NkNkaEFxT1E5bkY5S0pRQ3pNY21GT1RLU2cvYWJHdFBGL3Iz?=
 =?utf-8?B?c3VmMG9CeEg5K1gveUUwWThQQ2VNWmR0bXpYRW1PWDF4R2lHaEMweWpWNTJn?=
 =?utf-8?B?V3U5SW9CZEVoMm1pSzFwbm1XNG9qUTJXSjRuUVRqV3BXOW0rU1JZVSt6a3I1?=
 =?utf-8?B?RWM1OGtkaUVMcW16UURvbVZkMUVsOXYyRWE2YW82aDFibmczWHN5ZmVyZFAx?=
 =?utf-8?B?U1JwLzk2OUxLc0VTeUJMYlp6b0UwUklXSmVVZ2RHcllNWGFSa0thcjlMMmdB?=
 =?utf-8?B?VlhSSWZjOTh4bmtOQVlyTlRnUGI3RmY1Sko3dHJOUnBtOGQxZWRFVU1XdVdu?=
 =?utf-8?B?WC9hQVcwdDJvRFFEd3BPbWlqZHpTZkprSXo1ZjdrcGo3QzAvS1NyWXhndDBz?=
 =?utf-8?B?OTJucU54NG9RdmEvemJOejUwKzMrK1Q2YUJHRFJ0UTB3VzZaZThtZEFCVkkv?=
 =?utf-8?B?NW4zSGp2aCt2NmJwOEJyTnBVUlhGeGt1aG50VDlzV2tKRzJBYWluQ3ZJRU5u?=
 =?utf-8?B?M0V6d01pdGdUZkI2S05uREVmRGkxRlgrNDIvdjdvc2V2YlZWTENiR3F0RUVr?=
 =?utf-8?B?OXhSbnpFQnVYbjZ4b1doZmhGSFk5eUpMVmRwQzBPUVFzaVAvUWZFS1NHcnNX?=
 =?utf-8?B?Q1NTU0t4eEh5Yk9CMk5pUUFqWnkwV1BRTEx1T28rWmZZTmV0UXlKa25vdXhM?=
 =?utf-8?B?Ny8yc0c5bnFtNzRpSVpuL2g5VVdOcWFEL2pYclNza2NVQkxMVTllZWhoYW9C?=
 =?utf-8?B?d21kQXA4bWpiYTRNYnVVT1NiVTVPVWtyMzFaRmxhRlZkcS9lcWVBYS8wVDN6?=
 =?utf-8?B?cGFEa20vakpZMEsrOEQwelQ5NkV4d1NOT2RDNzYrNm9CUzFBM3h3bWtObE1i?=
 =?utf-8?B?N3lpbFhGcTBYQm8yTHVEMjVCUE5nZEd3eDk4UFJDNkM4K3kwZVUrRTBCUXZ3?=
 =?utf-8?B?R3FxQmlWSnErbUpEamgydHU4bFJtRDNsOFJDOFA4TWxyZ09pS2lzSFk0VzJp?=
 =?utf-8?B?MzVHN00xLzc0TWp2SldpZ2o3RDNhV3BzclBhMXZoQTF5MDVHdXVSSWNsc1h3?=
 =?utf-8?B?YmU1bW9YTElXODdxb1JyNHZ0QkZkVFY5WUNGbHZRa055bFpyT0ViUWUycGQw?=
 =?utf-8?B?Qk1yenQ1RU5xTHZvbTVtWWtnYU9KeEROU0ZWTmdaMVp2ek1TVXFQS3B0NE5T?=
 =?utf-8?B?M0F0YUZ2YllleG1XeUdFbUo4dUgzRFJsblVsbW0yUy9uREw2cWJRS2xYVi80?=
 =?utf-8?B?ZEdHaVFnekNDVmQwVlNOZWduU05hdjA1dVFBRzF1YmtGaWdmc21rM2s3WEU0?=
 =?utf-8?B?SklGRWxQV25yVHZWQUhTVWFkaWYvVThoQXRwc3BwbDR0QzJIODFmTENpMVFL?=
 =?utf-8?B?NGFHMyt6aFNkVmljR29ldlZ0SE12elhuS2pJNE45WktjSTBaaEhUTTdUY0pO?=
 =?utf-8?B?eHJBZ0RxTm5PczNKWmdhb1FiTmhTRVJuSDMvaTFrT2wzYTVyVGU2MEtkU1U5?=
 =?utf-8?B?U1RPNkMrd3JLRVJmSTNEVS9FS1RUWEpzVmM1T0YvUDhMcmV2ZnlFTS9vMGha?=
 =?utf-8?B?WjJCZnprb1lFVXlESVJCRVZVSjhURE1VOHlkY2NOcGtLUk51R2hlU0g2YmFL?=
 =?utf-8?B?WGJ6dWFCcTdsVzJrTGp3b0s5VEtJcnRzVzhFZ1NQNHBmdzhuMlFzL0s5dG1k?=
 =?utf-8?B?U0dMU0NHd2NpUW1vSzZmRHNPZFBMdmZJTDR4a0doZXJ3a1dUaExObmJCRkV6?=
 =?utf-8?B?em91eTNiR0pPclJ5eGVIb015aTUzdU5FVWJaMXJNdGU1NUMrOXVkb0JXcG5C?=
 =?utf-8?Q?ny1E=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 18:00:21.7542 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f220769-81cd-4806-c585-08de22de8391
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6072
X-Proofpoint-GUID: jEgwfgotj9InKVVSN6QcKa59Q_iuWBOf
X-Authority-Analysis: v=2.4 cv=LaQxKzfi c=1 sm=1 tr=0 ts=69161cba cx=c_pps
 a=Yt70oan80WMSQ1q6qWWjaQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=q6CKDgr7omsA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=ddLDBuBgM-EMqZRvaZoA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: jEgwfgotj9InKVVSN6QcKa59Q_iuWBOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE0MCBTYWx0ZWRfX+a4GTnXZU92V
 MFR0T80CyEvOeV6PUjp6g12d7YeK35v5nXa5mEdphKfEleeVZvZv0tIbTvtfaCHtQy6FiWeGSCe
 dH3kULcpQR7yQsVvSMzQb/kj7kWtS+OAghPG9qb6eYoJB4STAUOStl6dm0yyfNfJXL+s/mxuFxT
 EJ1LEUUxl89wxtEwVtP18HYj7npLiZe8qhBZtCtJlHej0pnkiMzOSqNWm9ry025ydb4GGy/6AfD
 hBdS+o4HQ96F10jUw7EzfdN/PipY0PtxeJyXqEm3h7Rn1KHpEcy2F63l1nfGerUK4m3ixlE3dFM
 Sf6xQKOMsN5/RwZ/+wgMssjH5uWSHunw+me6mhoLMGOkm1DCGHBBFtfGcFIZIFbLnJ/QO5xdk9p
 //onKmnBpWC93ftK4WlcxF40NTOK7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_03,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130140
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Cheick Traore <cheick.traore@foss.st.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: Re: [Uboot-stm32] [PATCH v1 2/3] configs: stm32: Enable ADC support
 for stm32mp13_defconfig
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

On 10/9/25 17:25, Patrice Chotard wrote:
> Enable STM_ADC and CM_ADC for stm32mp13_defconfig
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   configs/stm32mp13_defconfig | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index 3283e910219..8ef465ac222 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -29,6 +29,7 @@ CONFIG_CMD_NVEDIT_EFI=y
>   CONFIG_CMD_MEMINFO=y
>   CONFIG_CMD_MEMTEST=y
>   CONFIG_CMD_UNZIP=y
> +CONFIG_CMD_ADC=y
>   CONFIG_CMD_CLK=y
>   CONFIG_CMD_FUSE=y
>   CONFIG_CMD_GPIO=y
> @@ -56,6 +57,7 @@ CONFIG_ENV_REDUNDANT=y
>   CONFIG_ENV_RELOC_GD_ENV_ADDR=y
>   CONFIG_ENV_MMC_DEVICE_INDEX=-1
>   CONFIG_ENV_MMC_USE_DT=y
> +CONFIG_STM32_ADC=y
>   CONFIG_SYS_64BIT_LBA=y
>   CONFIG_BUTTON=y
>   CONFIG_BUTTON_GPIO=y


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
