Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA02C3015A
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 09:56:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B35F5C62ECF;
	Tue,  4 Nov 2025 08:56:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3432C62ECD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 08:56:40 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A48teMt1235255; Tue, 4 Nov 2025 09:56:29 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a6u1xmvk6-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 04 Nov 2025 09:56:28 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTpckCBIgFB7cd3sSRLYzvhROsGA9gPCbF9XlCAnfDgWaEy+XFoTrM6U6PjLIIsKG8KyjJel7voHTGR0eqYYeO+SN1G4QBqLGrXvB4p+gK3C9UepTSmhX0om4CU5IgMp514et0zGGGdhQaFpJ85n/gFL0vwCD+uDpiMhe0FSfamyrRSS7mtTdUgK0gBcoK3pldJhIEz4WDPj23aODBhnUfl2RZPB9Xvg6MOIiVtHbTSMcH3l/Ikgl/z5tdDA5avvnuN9/AnCP9saCFsrZLQLgbiOxvYub13TlAgo4XcQ81gJSN46rZD57ECgj67p1RItEYw6D6q3wQ5GfYdq72sg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RGQr9ROHcgO+9FXgaZHwtX1dsvK3SJ0/0C6ROJGfV0=;
 b=YU7pwT8eqO01WulqlvaRfDPiBSZXPkbvj7+LOuWNbd9qXnaO8oNfouk8yJjkCB0Ck3lMsLdgcCpIa2TX+YPgj7NVy46bnoxj/9+2ioVnb8g/gAQnp6CJZbgoFbTFwS1vFmhmPaQucHXH8Brs40uVxM4tT/LGIzhP7Wx1bydn5Bgi+w7GELMMNwyJ9YD/gbAD20RN+Xz1q4W3wO+X86cBKuqVutkAHU7UztdMK2j8BRblvhgz0Z24lLvGWZ3r+gOucnqT/ode97XkzQvhrANq8ncYOQoiZkK8sfRdrMieKumR37AXftqsHfE6wDke8VF51o4S9Nlg4DhiFVXdOO4DJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RGQr9ROHcgO+9FXgaZHwtX1dsvK3SJ0/0C6ROJGfV0=;
 b=KRSPqcys4sndNmhHhX1SIXy8hGZm7gPUFF0q22a/j6FcZ3a2lkuS3KLkWxY8K00qZ7Q1CxmzDzVZqsYcO6L4nPqG+o+1Js4q3VQnY2ozVw1OpDs0VSAyQdFHGyD/al+ueKCpqwIfxlbqpz/JOJNvtcKVDxO83fc51UcGH8E/pH+oaQprbhgCImX7VvP8qe2RpFvun/i990MP8TRMl2uklLltTmmY6U/q+cjglZSzKBlvjsYyfUNv0HEdOulGpLOoJoRN1tz9/ACKDo7XmhR3xLFPB+wK5b8zYh5K6IU3LSQxjUFrD5EzeHGAkrB/XanD/tiJIrI8/pXFtxwi+Ggx+A==
Received: from DU7P190CA0029.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::23)
 by DU0PR10MB5559.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:31f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:56:25 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::2) by DU7P190CA0029.outlook.office365.com
 (2603:10a6:10:550::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 08:56:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:56:24 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 4 Nov
 2025 09:54:06 +0100
Received: from [10.48.87.93] (10.48.87.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 4 Nov
 2025 09:56:24 +0100
Message-ID: <94ed1988-13e8-4fe3-bdff-ba2c9973c556@foss.st.com>
Date: Tue, 4 Nov 2025 09:56:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20251017143757.202571-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251017143757.202571-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8E:EE_|DU0PR10MB5559:EE_
X-MS-Office365-Filtering-Correlation-Id: 788e5e53-7c4f-46a6-e527-08de1b8008d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTl1eDdZSVVDTW1GUUZNdnd6ZlZWZGExeUhtbTJ2MEQzWjRud0U3QUlIaVZO?=
 =?utf-8?B?R1ljRXZNNkcwNWpRdm1DQ0VhTlQweS8wSE1TTjM3UUM3RGpvSGt2NmZYY0dM?=
 =?utf-8?B?QWpqeEhTUENBNGhRTWZ2QzhKcDc0VHFoZm56TnRqZFZLeHlLSUdBZ3JZRm4z?=
 =?utf-8?B?cVJBd3B0ZDFYK0ZSVmlodEtCaFlPeHhCajM4TmFaajJyMCsyQ24xTlljTTZS?=
 =?utf-8?B?UHJmWGgzd3U3cElzbXI2Ky9UdXBaa0lkdlVXMElmaE81blFkWkN6cWI2bGc2?=
 =?utf-8?B?TlFkTldSWS9mRExRZXF1dHRROVFrNmlJbHUwM3RKR1IxeDlrNkxteGxxUllN?=
 =?utf-8?B?Z1ZtK25GYkhncWFEaFBnZTE2cUhtalZTd1lLNXUrWERMZGN6elFaeEdJa0hN?=
 =?utf-8?B?ZElTc1lHcXJhbnVLTVhHWDMzbHovMENYTng5NnkvU1l2V3ZrWFlPZnNMY1pk?=
 =?utf-8?B?OXh0a0E3US9QMUxGUWdRck5RMjI5YWFoRTRTYWtFZDJ4NlhTSmFGSnc3eWNF?=
 =?utf-8?B?REZHb2ZrWWJIN1lvUTZ5Zk9JQVdsVm5uMkJCTmlXNTNHOHlZSVVXSDJ3R0I4?=
 =?utf-8?B?Ymk4Z2xlTEdMSlZIRFdTUTdsWnpCMFNlUzJqYUVIS1hZeTBzRjlZQmx4SEt5?=
 =?utf-8?B?VlJiQXhwa09PdTZSRDdQS1hoRnRodFRQRWJUV3BQL29UaGYzTTVKOEtUUXBI?=
 =?utf-8?B?T24wU2F6NXQyanE0KzdyNGYwSDNLZ3ZCM2JLeEh6VjJCeHNsWjdqNUNDOHNi?=
 =?utf-8?B?V011c2FQdlBEUXlDK0o5YVUrekNpRHYyakxOU0tBeVB6OWdvb21HWTY5Vy9V?=
 =?utf-8?B?cm5Rb3JEYVdjL3Z3YzBRQTdCa29mZExDYk05VEVzZ3NMMTVDeE9jRk51T1FS?=
 =?utf-8?B?R2dUeitiMUdRUExZRithenFRRHV0d2dJT01mWXVLamVHOG9rZ3I2NkdoMnZZ?=
 =?utf-8?B?VE81ZitucGpJNkJoRzJXdW4ybFBmYWN0MWtLV2I1dGRFNDRaUGVHSHFsN08z?=
 =?utf-8?B?R0VVSFYwSERkZTgxeGJwVnhWd2xNSTRaeXQ4cnQyUWJLRS9KRUZSNFVlV1d3?=
 =?utf-8?B?MkpZRDRNNGJlKzBuMWNHaGhXTlh4a2dtK2g0U3NyMWZta3JkYVZGVFBWY25j?=
 =?utf-8?B?RVRDL2E4ZzBqYWZsK21ONXRxSmI0YXVKaUo3d3JXNEMybjJnUDY3MFM2NjFP?=
 =?utf-8?B?c1pSei8xZWFpQUZYWmc4djJ0cGxzc0hla2E2cjlLb3NOeXg5ZlNjZ2dpNDlw?=
 =?utf-8?B?T2FUZUY1QmFnTDRpcjYrT1d6aGk1RjNSWlhYNk5PREtMVTVYRENSZTVEWWNa?=
 =?utf-8?B?aThNMENWSVN0U2dXaTRhUFI3dk1xeUNSZjE4ZDdqekZxbHRBMEdGOFFMUVc1?=
 =?utf-8?B?Q0ZTOWV6bGN4S2RlbEtJWFlzYmxzVVlGUlFrMVBuMEczWGJOcUpRUkhUMHhU?=
 =?utf-8?B?UWRkVVlNZ0d1QzFVaUxLdzV2Q0k4elFWaFl1Q3ZJcTZ0dHUyVXk0REJuNitK?=
 =?utf-8?B?OVR1eGlWcm1lVzdONkJLKzdwV2VUVnFSNUxiVWZkcDNSeHlQTEUvMVlXNTVC?=
 =?utf-8?B?NEZmUHQ1RnhVQ1BVdUh0cFlud1hzck81emJJbGVJWXhSTEswTS9FanFmSlB3?=
 =?utf-8?B?RDB5S3ZjRmxHV0VMQ3VMQU0wVVpkTXlGMDdBcDVZSmpnNFhXM2NNeDFXSitL?=
 =?utf-8?B?OStlYjFiUkZRNElCQWlab1FsT1RlMnFQN1dIVkpBc2FOM3F1MW43cDJGNFlj?=
 =?utf-8?B?NDNXdWZBdUpqWGF0MktKR0tOTnJZQXVmYVF2bVhmY2ZZd2ZoSEJoeDIrRjA0?=
 =?utf-8?B?TTZwcjZaTHBmR0RobDFrbTJDNFJscXZrMFJIenJpSi93TWl6eFYzOVV5Z2pT?=
 =?utf-8?B?ajM2aVFoMGVRSm5PTUNxaTdzYUU2aHl1V0UzTGRCZnA0bnUxZzQwY3JwRFdM?=
 =?utf-8?B?MjYwbUNvU0pZZW13WVdXRCtpalpKM1lmbGVCcVN0THRmRG5sMi9BQmNlSFB5?=
 =?utf-8?B?aHBidW9rRHBHUjM4MTFzZStuV1R5SUVkR0JmYzR6c1BvNndKUnB0SGw0NVlv?=
 =?utf-8?B?Z2lTQWdpQmZ0WXZtbHZ3Z2Y3NUdmTGc5dnllUHRDcDh5QUNkVENIUXlUWldM?=
 =?utf-8?Q?dfbo=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:56:24.9940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 788e5e53-7c4f-46a6-e527-08de1b8008d5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5559
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA3MyBTYWx0ZWRfX55jqb7Nri3B0
 JKfOZtbr/s5UWQHe9qzQFlvcZnGRAJVIQ/2xYkflbGhXoWqj8iwliomhgrp2S9y9/XHIP4uQvWj
 qYzzloK0NbJnrhpGxFF3rHq9YU23/TsWtKowSc4PQQ3uHnDl/jwTplQmebGUrbkwQDLP5oFj+ld
 Q6xheYB6d98qr+N+OINU7vmnogplmOkAMb4mtYr8Jp9FlF7OS4bKG2+x5b2EFI7mONtSG1f/Fz1
 tZwfQRrOux/Wn6hafaLB9SoEP9VmD5GVfJEBtXQomFPs1Ifaz9OAhzLg83xgKlcv6Kb7EIMtCu5
 eVIYJf6uDkQTQJgRp2sw5Ghmbbqs2iWsYFEGlJyxkqSW5bO6SsoIY8Kq9a4dflqhRkUIST0uHmL
 AFAzeDsU9tT0dPwuC2xIKnCLBAHt0Q==
X-Authority-Analysis: v=2.4 cv=WMpyn3sR c=1 sm=1 tr=0 ts=6909bfbc cx=c_pps
 a=7RlnNBo2KbPEBnadbvKlxA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=voM4FWlXAAAA:8 a=a6uhc3V9Zyqh-PhCmrkA:9
 a=QEXdDO2ut3YA:10 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: Prjiefr95UdH8D0ooC0OwCmXzY_ehVqN
X-Proofpoint-GUID: Prjiefr95UdH8D0ooC0OwCmXzY_ehVqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040073
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 0/5] stm32mp2: Update led management for
	stm32mp2 boards
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



On 10/17/25 16:37, Patrice Chotard wrote:
>   - Update LED management for stm32mp2 boards.
>   - Enable LED_BOOT flag in stm32mp23/25_defcofnig files.
>   - Remove legacy "u-boot,boot-led" property in stm32mp2 DT's boards.
> 
> Patrice Chotard (5):
>   ARM: dts: Remove u-boot,boot-led from stm32mp257f-ev1-u-boot
>   ARM: dts: Remove u-boot,boot-led from stm32mp235f-dk-u-boot
>   board: st: Update LED management for stm32mp2
>   configs: stm32mp2: Enable LED_BOOT for stm32mp25_defconfig
>   configs: stm32mp2: Enable LED_BOOT for stm32mp23_defconfig
> 
>  arch/arm/dts/stm32mp235f-dk-u-boot.dtsi  |  1 -
>  arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi |  1 -
>  board/st/stm32mp2/stm32mp2.c             | 38 +-----------------------
>  configs/stm32mp23_defconfig              |  1 +
>  configs/stm32mp25_defconfig              |  1 +
>  5 files changed, 3 insertions(+), 39 deletions(-)
> 


This serie and https://patchwork.ozlabs.org/project/uboot/list/?series=476920 will be reworked
All DTS part will be removed and submitted on kernel side.

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
