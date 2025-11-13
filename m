Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B8EC59365
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Nov 2025 18:40:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B24A2C628D4;
	Thu, 13 Nov 2025 17:40:20 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D9DBC628B7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 17:40:18 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADHamJP220679; Thu, 13 Nov 2025 18:40:16 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4acq20pph1-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 13 Nov 2025 18:40:16 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s29OWR2qmgmRNXDNEKTjJOYgQ7dLhKa4SgAWHpYovJv1sWLtAZDX90vkusXhpdZtjpyLRXHWVNRskYTg2fhsvK/MeRknTeOijggY1ygpKcyx03CGlyXjhPKhpYhs0UGBllMS9+l4WGp4yGByLDhcobhKBO0PKAZ2wD1vTDW0GvJ0NalrnSuDX+1Xy5m92UTFG+ZSa4LczOxcsqVWqqLfwfXVx5fG4L+jJADT3BQ3I/1bskIqm4Y7IXRrp6QiYHeppjRsC59KNowSdBFOX5TRdXvuUmhwKBPzD5c1vq4VslwJNOZ6BkSlKi/JQz2MapcW1YK8GaIQx6Yycfdvcy12Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eE7CwCA9fCcitxVhkxnw+v1A1aZtPQZT/HAHJpdHPRQ=;
 b=qetk4sZmBwaM89CA5+uhTiy4VGqSJBXooC1IMfQ/X3zNRN/XlKQWwsNAkk5q7aiBMjAMQe+Y8gRBvOUIoCV+qlmKCCIBsRjOCh52B18t7HGycMWNaft9m+7NtWfjJ2HQ92HCxuYOG8khMs+gQ8Dz0SdjenAr7Bveaqsa4WF3uzjlxOXgT1arbR2Er6psPm587Wm8odsi/wVvbxr2pq76ZV06eRON1qsU83xPtTctnQE7isSfByZAJ6D9ZjhDJMamc0P2+X4pYxkcDpQ4T5kMfliysb6DdKsRiTXnyREmC16CiYdlJJrIoWee9QZi6WEp6YYRBJSIUgd6QluL4XsFJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eE7CwCA9fCcitxVhkxnw+v1A1aZtPQZT/HAHJpdHPRQ=;
 b=NvDfVMUht6fQU7voJ4rHBXqNNpgi9vuaU3oX0zXut1XgSJF0YCzBaKbKdwK87lJo/yDOqVUK4TBErLg48OOBMC07D2TwTGtv20xWNDFLZKFOIeG4E2Z2Tvng7wzXbPhG2MyUo1wmNmyfvqQjRGDSEISP54AuInINjFKv3CmKYDgV5YMwz05AiBCgrqs3HJsMDqeO5ofHVqfvGXo4P6UPEYiZAes76xdNFM7wYRJldMm1qyVxNnkzNED8jJGVK41yOXkSdsO8R6vSQ8B3NBhpkU5iyjW4Ee+LWh2PVpMtzN8rrYngb2t96lffusGu8zCSL51LUz2Y0ohLFXO8I6lsog==
Received: from DUZPR01CA0252.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::22) by DU0PR10MB6057.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3e0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 13 Nov
 2025 17:40:14 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::ce) by DUZPR01CA0252.outlook.office365.com
 (2603:10a6:10:4b5::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 17:40:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 13 Nov 2025 17:40:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 18:40:23 +0100
Received: from [10.48.87.108] (10.48.87.108) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 18:40:12 +0100
Message-ID: <eedbc5f9-8c21-4841-9a05-b457e601ab5c@foss.st.com>
Date: Thu, 13 Nov 2025 18:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20251017121852.109561-1-patrice.chotard@foss.st.com>
 <20251017121852.109561-3-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20251017121852.109561-3-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.108]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFF:EE_|DU0PR10MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 6521b5b0-ebde-47cc-6659-08de22dbb38f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjIxSlg0T3pHQzc5cGp0OXFMR3FFZnFFWW5CNDJGa2s5bC9qYjdKUU5iTmZt?=
 =?utf-8?B?OTdUeHJvK1I4YVFhOTZzemREd29VTEdXNzFkbjI5d3FWT2dncm5DWE1CZW5O?=
 =?utf-8?B?ekdMbFN5bEJBclhheWJWYjRyY0ROd0pyMlFCS0o1dlVxU1RWK3hmNzRLUFdy?=
 =?utf-8?B?eE04WkpoS0xUUi9ldUY3cFU4VGU2RHpwMVZORVpaNWFONWt3TlFyMDJ6Rnl6?=
 =?utf-8?B?ajVJZ1Bwb1djNHB0UmFjL0FGUUk4US9sdmhQK2MyUjFsL2UyUlhmVTZjdjdl?=
 =?utf-8?B?Zlo1c2ppSzAzR1lIeWQ2bXVSVTJyM3RBbE14Zi8xQTBNeStGZDZDUkFQMmdV?=
 =?utf-8?B?YkFITjB4NXpLb09wb0dFRXRLaHo3QmpoeThQY3JKRVFhZ3RZK3AwRHZ5V2I4?=
 =?utf-8?B?b1NMa2RJeUM5U01zWWZ6WlpweEI3OStrYU0vaFh2cmV5dE1XQ2Zrd0RpVHRE?=
 =?utf-8?B?bEM5NnByK1lRT3llaWhNaW1UVGRSYjVjdVdRRm8rR0JJOS9jUVlyam9Gd0Ur?=
 =?utf-8?B?ZEl4L29MazNlY1VFaG1RUThrY0VxaUxFSTJnak83QUVOTUg3SERrTXdSSGNC?=
 =?utf-8?B?WE13UzZqZWp3M0MxWkhlVWlUTVJmS1dzK1RKdmd6SmdzbVpKRDY2WDh0WWRM?=
 =?utf-8?B?NnlxYnl5RzAzQU9KZHN4cmVRZHpCOW51Q3lSeldFMHdlWDJvVlFCWnlKT3hD?=
 =?utf-8?B?bEQ1MzduaHJ4K3JjU3VZV0xuT2oyc2hkK2EzRnlPMHZrQmxZaGYrUVR0bkh6?=
 =?utf-8?B?WUJ5V0k1bExYNVU0R1o1eWJadWVaTE5IcTA4MjI5bE9qSzZmRGM4OUhJeHNn?=
 =?utf-8?B?R1JkbXZDcUs2SjgwQitMdjlpTHNkZ2NDZUpadGhRL0s1Z2greEl3cnQvMjhx?=
 =?utf-8?B?TkZxMDRCNW9QZnNqVWluekRKVXFvcmx5aHg2RGNqZW1OZndSZ2x6UndhQjdP?=
 =?utf-8?B?a2lDQVJKZUNlQXdMRFR5U3R4QUtuV0wyYmkvVldmeDc0OUVPdDlrS3JzdWQy?=
 =?utf-8?B?N1hSQnEzTmk2T2t2ZEZvK282WUhQdTB3L1FaNnJrc3FzcFk1WGVvbkN6ekQz?=
 =?utf-8?B?cVJ6QmUrbnBPd0JlLzJrOTZKWHlhVC9jRkgzV1owZ2xvM21PMmZRQ1NVMk5I?=
 =?utf-8?B?Sjl6dkc4TWh3OUlheW9yV2tvVnl4Q3pSM3ZQY3dST2pHTXN0a2UzWW1jWU9M?=
 =?utf-8?B?RDBOQVBJbjQ3TW5LTXBNcWo2YkRweUVxa1NSaVkvMnpHcGNVWGhSWDBocEh5?=
 =?utf-8?B?b0EyaWdzSEtXeWdyWUZscUo5S1lTT3EvWndwd0p0a3JXMVFyaFUreHd0NDAx?=
 =?utf-8?B?dEtxTmxvS1c4andTL0NpRHZRRWdKZEw2MGQxam5keXl6K3pzYTYxNHlFSFVm?=
 =?utf-8?B?TVRDOFVjRHUzQ0dYeHJka2FVV0pwdGJ5WlE1M2tkY0RPQ2NBYkRWWGNMc1h0?=
 =?utf-8?B?VGt1a1RQc21mc2N1K3N2UGs2eW1aLzJBK1BORzU5SWljTUNScUlmV3FONzJR?=
 =?utf-8?B?cEFrU2t1U2k1MEN3ZVNJUTRLTVo3T21MTnpQS2JLdHkxYkUyMVpOUGYwRlVz?=
 =?utf-8?B?cU0zSWdzdUw1K0Zwcm9EbWF3Qk1qdU5KTTlvNzlCVk1HRzZyTEZsZm43dDFI?=
 =?utf-8?B?dmxhN3NhZXQ1MUwxbW1iUDQvajFjc1pzVlFaUk9lRE9xcXhpemdxdlc5alhr?=
 =?utf-8?B?Tm52V1ZHQXVySlJRS1RCNUxlWm5tNUEyMmc3MCtQOC9TU3pNaitiN3AxQTUv?=
 =?utf-8?B?YTF5TUNzVUVvTzllS1ZaR0tjVStRaUFOVThscGJFZFE4bEw5ZC9jRUprdXUv?=
 =?utf-8?B?ekcyNjZwT0pzTFU4bTJuNFdFUHdrUWFRRlpGYjlvRG01YSt2eDdiN25ocUNl?=
 =?utf-8?B?d1FsWFdxTnlPSlR6NmhxWDlRQ01EUmRLOHVZNDYwdk40R0txbXVDN1FxaE15?=
 =?utf-8?B?UkRuaFlzYWZMOFNUa01rNGRkWEtSeXdERm13REVQc2Yxc3VLU0lJem1vcXc1?=
 =?utf-8?B?VEcxWHhobjlFTFJyQ1JYNlovTytYOVNVMFljdlRIT3MvOXVSZmRzTjlVZ3hx?=
 =?utf-8?B?MVo3TGtQWlhiYTFQUnJiNUYzdTdaUlhHOSszbnJNUGNPQzNQQWphOXp2MnJL?=
 =?utf-8?Q?OhSA=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:40:13.7724 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6521b5b0-ebde-47cc-6659-08de22dbb38f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6057
X-Proofpoint-GUID: DgFcdLfmQ5Yy3IPbmNniLeyB6vxEBgKG
X-Authority-Analysis: v=2.4 cv=LaQxKzfi c=1 sm=1 tr=0 ts=69161800 cx=c_pps
 a=UF7r5SVx1dPEhrSNKrAGtw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=q6CKDgr7omsA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=QSejWefRWs_1lVe0ePYA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: DgFcdLfmQ5Yy3IPbmNniLeyB6vxEBgKG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDEzNyBTYWx0ZWRfX3wuGsSC8703x
 HZ5tP/WWvzJsk/Xahy7tjS12208hbTBki9hiQ5tIPZ7AyQ79DPg7GZNOHZJTzbBL867E/dx+BhT
 bTdUl6wjkBpB3CtdILC+qs4Aj794C2Twia+5KtNGD3hWGIGsEeodAHx5gh2WqidK1bkmXiUnYhf
 S+fhO2GRctmQYGI7xJIN6ibxp/23OlwJ/50AvWPjY0xFz1b2rQn4uEH5Wx9tmdcYpFm7ijW3Yzp
 hUhMVb4KkeTnTNCcYceCLR3+RZxWfw3ux0iFePaRZM6PPLnsQGyB4rqwlRHTTXI9KszLmH4nsNa
 FF1ZrP684termaqTUK61ND0ARi/8j3nwVFtwUpbW6JvTvYV0bzQLZBzpAsHKFDOQkg2zrLfx8EK
 Yzsbx2qD7snLJJ+P861UsLSpkJo21Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_03,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130137
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 2/5] ARM: dts: Fix "arm,
 smc-id" value for stm32mp23-u-boot.dtsi
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
> OP-TEE "arm,smc-id" is equal to 0xbc000000 but kernel DT has been
> upstream with an incorrect value.
> Fix it temporarily until kernel DT is fixed.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp23-u-boot.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/dts/stm32mp23-u-boot.dtsi b/arch/arm/dts/stm32mp23-u-boot.dtsi
> index 872a8739c54..5a9436dd193 100644
> --- a/arch/arm/dts/stm32mp23-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp23-u-boot.dtsi
> @@ -37,6 +37,11 @@
>   	soc@0 {
>   		bootph-all;
>   	};
> +
> +	/* temporary until kernel DT update */
> +	watchdog {
> +		arm,smc-id = <0xbc000000>;
> +	};
>   };
>   
>   &bsec {


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
