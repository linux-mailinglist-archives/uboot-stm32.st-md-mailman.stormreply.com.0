Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE63CA7A5C
	for <lists+uboot-stm32@lfdr.de>; Fri, 05 Dec 2025 13:52:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6497DC628D4;
	Fri,  5 Dec 2025 12:52:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C246C01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Dec 2025 12:52:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5Ckf1K2417490; Fri, 5 Dec 2025 13:52:10 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4aubndm2qp-2
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 05 Dec 2025 13:52:10 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HuZuc4wCNKC6uE53GCG0IjNE8NJ5wS3LOIkRb7mkN1H0SB7iyw/f8ExAPgnNRrkwDvYpoWquU+8zLPUZac8XNFuPPVAdlmakDlcImNztKo4eak9rQrQ0QujXINCGkCkTuJCIfWrdsWuNNI3wta7rkqAa0bwU5LeZLiuzDbd+pe90OA865QKypR9EACMjSn2nLoh6MoEp2O2Lkm6jCl2Vfyim3S1R39vTRazcNMGAdm36B/Q+eVXFiVuo0m53qj+cQUL/dIj0d3J3cKsbdctIOAISVaFFOw7xUgUsJ3P4VYUKN2J4fS0Vq6cKNlJKwO6bRyTRlmHzFz/7FA31425bRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTEwMiyaqYI2lQAmZnKKqVG9iCCqHAXexDkqAucm0CM=;
 b=Jv7+anHhdU1brbselV35+6T0N7yhYs3glWjpiSSWlaxNI0v6RGyCA+mE/oGv8K/xfDAc6QOFyjQL1Fa9ivOnGjGYx2P2OOj3Si/negQmVxlKGYrshsyEDsoDrXK7hHirKiPKIuF3DQHVZatP3EbDfiBz94Swbno+9WxqWWqgOHAahYdL3HFPQ0u9s+ruFu+HY3jO6VBAhsvHobYjAlw3BjIMjpxSl5oOom49Xa47CK4sFQ3QyaseAt+QMP0nFe5t+vrDUiViXCUfDIRUytQKzw/kb9Iw5osWZGLVZrir9fKSQSw/Fm3jbU4bjSx8ypyXVesYQaLx+0SgLMSo+ZY+Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTEwMiyaqYI2lQAmZnKKqVG9iCCqHAXexDkqAucm0CM=;
 b=Atf9PxUEBqeZ+UdkWiSDGLuLzBxmKjqqaJtVmKO2bx4UUn/+lHJzDfbR7+jKVkpDNylaAvG5cXpcdjF1Y2QvVtreSCYEv+td8kCL/YGRdOB4+D20GrmEaNjhvvwIBTKRFsl62zBkEHTq0eaT2XAO1BDKQrfP0BTqBSRnF3CBiQ9HU70EFmUafcXRPECJ5j9IBkQonkMIsyRQ9qOT5iDPJ0ZCh38d+ISEjj6mVIzRz1pfZqmvXbPWcRD8BC87RrIO/g915coWXvwWd290aIVpMWJ+xjAthPpQX+pUBkLYPhyiWvmi/yvI6PG0NxjDG8vdOuyl9rbId+gK08OZRKmKxQ==
Received: from AS9P250CA0011.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::17)
 by AS8PR10MB6416.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:56a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 12:52:06 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:532:cafe::26) by AS9P250CA0011.outlook.office365.com
 (2603:10a6:20b:532::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.12 via Frontend Transport; Fri,
 5 Dec 2025 12:52:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 5 Dec 2025 12:52:05 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 13:52:43 +0100
Received: from [10.252.31.202] (10.252.31.202) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 13:52:04 +0100
Message-ID: <8056284a-1191-4877-b051-9eba81adcdd6@foss.st.com>
Date: Fri, 5 Dec 2025 13:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.252.31.202]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|AS8PR10MB6416:EE_
X-MS-Office365-Filtering-Correlation-Id: a70ae689-7e7a-4c71-2985-08de33fd1841
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXRiZi9DN2lSSUk5N1hSb3lNRU9haStCNHRZbGRtZmovSGl0dDJJdURBV28r?=
 =?utf-8?B?SjRKdy82ZWxaQkZQMzFCRTR4d3ZiYXJBZENHc1FiRUVsNkJCb2F3OGFHUFdz?=
 =?utf-8?B?L0VlZVBWVkdEeVZja1FQVDZPdUNlbkx4QzV0NGw2b0N5VzZaUXFIVStVbkZK?=
 =?utf-8?B?NXFPOUtrcFhXc0VLdVRYZDNvNTk1MktlYzZ2eWJOcUxTdkZwRy9OY3A4QmpP?=
 =?utf-8?B?ck1rKysvdW5Zb01MWk9KMVh2ejMvVFoyWjdIWXF3L3IvcndFdG9IY0pJQ3ZF?=
 =?utf-8?B?QlIrTVFqZWJHM0trTUt0Ris2TWZBNHVnZ212ejU1bWdIYUtCcjBvRkZkZEZH?=
 =?utf-8?B?eTZQdWpyQzBuNVNxakxZeVYwbERSOWdrQXNpT2RhTHVhZGg2Y3puR20zcXFQ?=
 =?utf-8?B?OU9pZGRSY2w1YncxVEhTN24zU1ZZUmd1bEp1Nyt3ek9uYmxEbE9TeWJ6SVBS?=
 =?utf-8?B?bVVRNkVLN2JzYm9DUm5XdFZ6UTE2SHoyZUdkYmxxQUVGV0NBWUFsSmszbTJr?=
 =?utf-8?B?Qk9IVWhhbU9GTEpSbXJaQ0cxcVNrbGhIdUVUdHVtTE1NcUVOWlZWWnEzYzZs?=
 =?utf-8?B?OXE2MkM3UVpFMFkyUUJTaGJsclUwakRTVXdEcWlONk5PT2ZSYkpzUjliak9F?=
 =?utf-8?B?S1NOTE40ZUdOT2ZzM05CclN3RGRGaHF4RU54UXFlQVVoeWkvNTdELzVHYW1X?=
 =?utf-8?B?RXRJM1dZVTdtak9CNlZ2eGxMZHA2cm1oS0I0cFhLdkN1cStqYkN0dHU0NVhL?=
 =?utf-8?B?Q3o3TG93MXgyRTJFNER5bGUzek1pM3dpNUo3amo5NitVRVVJRW1EZXBrWG5T?=
 =?utf-8?B?R2V3OFBkdmUyd2lzbWZUS1V3R0ZwWnEwa1ZaTjBVdEdSTTN0dys0VE9CRGlE?=
 =?utf-8?B?bFVLTksrZW84bWRKWFRVQWxFRE1OMWtZZk1WeHB0cmdVbCtCdVRVK1lXU0ty?=
 =?utf-8?B?cnNaTVBhN3hueU53ZzcwaUdtZGlBemZ6a3lJeVFNMzc1dHJlZGdoVUpGYTh3?=
 =?utf-8?B?WW5Qb21WRHlVMG8yWDZzdzhIT21GQWMvTWxCUnorbEhUQUkyV2VPaVdFR1dD?=
 =?utf-8?B?R0Y5MUxwdWtYM1J2TnNPc3ZidFIvTXoxNzB2NUlxS0xValZpd0ljYVdtVVhR?=
 =?utf-8?B?U1gwRktaYjh0VW15MVdxQmhIelpzTzFUTzRQN2tYNW1TRzNNSkZaN1JaMjdo?=
 =?utf-8?B?bktKNDB0TkRwalJtQkgwM1BYYWFVZVB4eTcvQndQNWVZSTFNWWRXY3prekdr?=
 =?utf-8?B?bjY4SjR2WDUyL0pwa0NWNUVlWjQxWDJ3Yy9VOUNvazdSK1VUOHMvdUVVVEd1?=
 =?utf-8?B?eTFQb2NIcTF0aWovd1hsVVF5TzlCMWZxdVIramdZTGxmOENLOElaeE9YOEZN?=
 =?utf-8?B?eSs1bTJnczBhWkZGVG5MYXhtU0VlZFBaSzB6Y1JWbjdaQXB6TDdvbmZyRnh6?=
 =?utf-8?B?eTZrTHZFZXRJSlJJNkZIMmo5WGxIWkVtc0ZSejFUa2ZlKzl6NkwyZXkwcTNV?=
 =?utf-8?B?TUpzaXFwSTU0bVBoZ2kzZE95QnZIZ1dPaHl6RlE5MC9FL2c5T1lUT2VvcjU2?=
 =?utf-8?B?ZlpOeU95VUZhSE9OeE9obVBWN2RxNGN6MW9pL1V4Vys4YWhsVDhRTFNGa1Zi?=
 =?utf-8?B?T09ta3VqU01DOE9vdmRsTmRJc1ltcjMraFB3eFVsUVJrOFI1UjRveTkwNGJN?=
 =?utf-8?B?RU5RcXVlVEU4K3hoWmZNaThkQ1dZYXhBUlRPODloTkE4aVNteHhaV2VPby9o?=
 =?utf-8?B?MmF4Mjk3SlhsRzJVN050OWxCdWVDNkh1RkpUQ3FzbzIxK0xSbUZ6QnV0bFd1?=
 =?utf-8?B?eGRGWWFVdncvN2pMbHdlSDRGcTFrUS9HWFZOUWpIakdJTEVQelVFaDQyUHNE?=
 =?utf-8?B?cnIxU1dJTHRQRjRKK0dwZjZlV2tXcUlyVnJVaGJCY0poMGg3RFV2QlBHTkhG?=
 =?utf-8?B?d211SVVQMzRaQXMzaDlYc3A1WjdvaTlUUjhxdVdLS0MrVlA4SHdJOW9lQVRs?=
 =?utf-8?B?c2NxTXY4UWFMK3kyTFFTWHNtSm5CUmtEeFhOUHg2Q0Z1ZHZTa0xqNy94NWlq?=
 =?utf-8?B?ekZGT2x3K0JCL1F6STZUM1Erb1R3NWE2WDc1MTAzaGdueXlUbDNuV3J2dFpU?=
 =?utf-8?Q?sW+U7ifeRbz4Yo0Yf6IWdrWQq?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 12:52:05.9014 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a70ae689-7e7a-4c71-2985-08de33fd1841
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6416
X-Proofpoint-GUID: _lXeqrD4qlHP81VRbPdbGI0h-NykruMX
X-Proofpoint-ORIG-GUID: _lXeqrD4qlHP81VRbPdbGI0h-NykruMX
X-Authority-Analysis: v=2.4 cv=FtUIPmrq c=1 sm=1 tr=0 ts=6932d57a cx=c_pps
 a=1mLpANhVl+IIdY2X1CxjjQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Uo5EeBN78AAA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=voM4FWlXAAAA:8 a=YG64nluAAAAA:20 a=VwQbUJbxAAAA:8
 a=3h80KCe0HThqiSDmvnQA:9 a=QEXdDO2ut3YA:10 a=IC2XNlieTeVoXbcui8wp:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5MiBTYWx0ZWRfX6Kc7AQQc/rS/
 AL0f5XXMum98Hw6nE4hniqod9jiyr6At1S0JHLYowuXuFRyg8Igv/M+Q/Z87zjiHDm7bVeLC1Hp
 vkozktfVJs/W1gcOZPsFvRyoUVEdCOTvN4/JQD17zwzkaKKDODq2z6ZaVNemGZHvTaGj83IYgVp
 4U8yVAGCh5kArGJtF2eb/lGdND3EKy/JfiiWv3nOpwi0+mdSqUiuCzHASSZysjtp9pcI17CbXWY
 PIytKcy7hY9Ye+x5TSlsd4YXgs0DTCKTf3SbU/6PRxxrxNEfmSwsU5yk7r2O5UPqTD8H+ZBoPfu
 kdgPttwB0NQzg9teK4oGpB0nNUts6fQKssQegrC8F3OMhW/024yBSyy4aUNt+UCqoPXaw4ggORJ
 cb/a5jGOWFxHPRVbY7pA0uRaZbQLMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050092
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>, Tom Rini <trini@konsulko.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Peng Fan <peng.fan@nxp.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, Linus
 Walleij <linus.walleij@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 00/23] stm32: Update led management for
 STMicroelectronics boards
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



On 11/14/25 17:23, Patrice Chotard wrote:
> Since commit 516a13e8db32 ("led: update LED boot/activity to new property implementation")
> "u-boot,boot-led" and "u-boot,error-led" properties can't be used anymore,
> and in addition these properties are removed by series [1]
> 
> Instead, make usage of "boot-led" property in /options/u-boot node ,see [2].
> "boot-led" property is added in kernel DT [3].
> 
> "u-boot,error-led" is replaced by LED labeled "red:status".
> "red:status" addition has been submitted on kernel side [4]
> 
> This series also :
>   - Remove no more used board/st/stm32f429-discovery/led.c
>   - Update LED management for stm32mp1/2 boards.
>   - Enable LED_BOOT flag in STM32 MCU's and MPU's defconfig files.
> 
> [1] https://patchwork.ozlabs.org/project/uboot/list/?series=481840
> [2] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/options/u-boot.yaml
> [3] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1022570
> [4] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1023034
> 
> 
> Patrice Chotard (22):
>   board: st: Update LED management for stm32mp1
>   board: st: Update LED management for stm32mp2
>   configs: stm32: Enable LED config flags for stm32f429-disco
>   configs: stm32: Enable LED config flags for stm32f429-disco
>   configs: stm32: Enable LED config flags for stm32f746-disco
>   configs: stm32: Enable LED config flags for stm32f769-disco
>   configs: stm32: Enable LED config flags for stm32h743-disco
>   configs: stm32: Enable LED config flags for stm32h743-eval
>   configs: stm32: Enable LED config flags for stm32h747-disco
>   configs: stm32mp13: Enable LED_BOOT for stm32mp13_defconfig
>   configs: stm32mp15: Enable LED_BOOT for stm32mp15_defconfig
>   configs: stm32mp15: Enable LED_BOOT for stm32mp15_basic_defconfig
>   configs: stm32mp15: Enable LED_BOOT for stm32mp15_trusted_defconfig
>   configs: stm32mp2: Enable LED_BOOT for stm32mp25_defconfig
>   configs: stm32mp2: Enable LED_BOOT for stm32mp23_defconfig
>   ARM: dts: stm32: Drop "u-boot-led" and "error-led" from
>     stm32mp135f-dk-u-boot
>   ARM: dts: stm32: Drop "u-boot-led" and "error-led" from
>     stm32mp157a-dk1-scmi-u-boot
>   ARM: dts: stm32: Drop "u-boot-led" and "error-led" from
>     stm32mp157a-dk1-u-boot
>   ARM: dts: stm32: Drop "u-boot-led" and "error-led" from
>     stm32mp157c-ed1-scmi-u-boot
>   ARM: dts: stm32: Drop "u-boot-led" and "error-led" from
>     stm32mp157c-ed1-u-boot
>   ARM: dts: stm32: Drop "u-boot-led" from stm32mp235f-dk-u-boot
>   ARM: dts: stm32: Drop "u-boot-led" from stm32mp257f-ev1-u-boot
> 
> Simon Glass (1):
>   board: st: Drop old LED code from stm32f429-disco
> 
>  arch/arm/dts/stm32mp135f-dk-u-boot.dtsi       |  6 ---
>  arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi |  6 ---
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |  5 ---
>  arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi | 14 ------
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      | 14 ------
>  arch/arm/dts/stm32mp235f-dk-u-boot.dtsi       |  1 -
>  arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi      |  1 -
>  board/st/stm32f429-discovery/Makefile         |  1 -
>  board/st/stm32f429-discovery/led.c            | 39 ----------------
>  board/st/stm32mp1/stm32mp1.c                  | 45 ++-----------------
>  board/st/stm32mp2/stm32mp2.c                  | 38 +---------------
>  configs/stm32f429-discovery_defconfig         |  3 ++
>  configs/stm32f469-discovery_defconfig         |  3 ++
>  configs/stm32f746-disco_defconfig             |  3 ++
>  configs/stm32f769-disco_defconfig             |  3 ++
>  configs/stm32h743-disco_defconfig             |  3 ++
>  configs/stm32h743-eval_defconfig              |  3 ++
>  configs/stm32h747-disco_defconfig             |  3 ++
>  configs/stm32mp13_defconfig                   |  1 +
>  configs/stm32mp15_basic_defconfig             |  1 +
>  configs/stm32mp15_defconfig                   |  1 +
>  configs/stm32mp15_trusted_defconfig           |  1 +
>  configs/stm32mp23_defconfig                   |  1 +
>  configs/stm32mp25_defconfig                   |  1 +
>  24 files changed, 32 insertions(+), 165 deletions(-)
>  delete mode 100644 board/st/stm32f429-discovery/led.c
> 

For the whole serie:

Applied to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
