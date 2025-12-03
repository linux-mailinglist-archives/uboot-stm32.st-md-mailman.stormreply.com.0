Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D1DC9F5B8
	for <lists+uboot-stm32@lfdr.de>; Wed, 03 Dec 2025 15:52:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84524C5F1F7;
	Wed,  3 Dec 2025 14:52:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6BA0C5C842
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Dec 2025 14:52:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B3ElZGx1650348; Wed, 3 Dec 2025 15:52:10 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4at2bxmegj-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 03 Dec 2025 15:52:10 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSlz+BDPTXkrRlG6BPSuWt6m5NkpK58m/tWFaFUQWTXmVrx4keFNcxf5N3qki0vyzWUzt9y1YcYuHXrpC7F/x+0Szdc0CaUEFnFu5rvsHhqEtsgH5xmIz3rE3Eem8zpI0dkN0imCxowZPDrXF9DsN36nWzWjzOmGhABvXjNyhWgtw1rK9EIYMVCfS27ZVl6ZnEUOgeRyfKR5yI9ALEmSZpeOIC/xHeK9Ycqt79A+ux1o676kAXQx7a4Uu7gJ52CxPuVktuq8zXKJ94Qh4fBQgbUjIqxNXsGqTCjpaecit0tRd7V2C4cDAUHb57OLXOxT1M3th2iM5GZlzkcXwe8G2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEdiXYfA8gbreIHCWBP2oCuf+jssnkAKyUeL8PsM87o=;
 b=pcZKRMdvLQe0JnJqHJKns5eQ5rbfiI0M/Zf/0af3QH5TsdGIZJQYK5/QYcahp+fQpth3/n7u7RLiq4XdjoQUR0ZURRHHLW369bg5bDGLoWSSNPGGXwdFuRsZFDvu1mYwDCIMTAR6t+wjf4kLciqNeNCdI6tDT9oj/mO7v2YrmwMMA1mEtKmenxN8fkd58giZ+xZc/fM7rrFlczyMdY2aVtYiumWkTfX/jtgcLD6QNsEm6K1ck95vEZgNAFpCoHqGDYZSSQiB62GTWrglulWYIAuJ56HYONwYr4i3TaXBELnoRRgHUHmVmCNShuF0Zs/cthgffx50XzovRj5Mlm06NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEdiXYfA8gbreIHCWBP2oCuf+jssnkAKyUeL8PsM87o=;
 b=ABGgNQ3SeDTOb8X7yugyZMJ9CQAzCCsGQhCdE5IP/ISsE4x+68m01T1mT3tTfJXRgnlPQ0TuLYFJHvf3N/wb1YIbTzu3P9YPR3jp5u8pkAnQVYDsoQ8Lm7TpNHtw8VYPeisT69IO7r4FEJ2icDoSvXQmmYeQUATWZprV+RnUnU//IL/Bg3acy9NVAqkUwSScvwmRA40vOLzai1ECvdJBznUm2fdKWR9d5+PAbUrPc6VfNOtnB5G2iM49HTR0SZaAgzCg+IYCLscz/SS8RE0aGMKHKp/vK72I4wmxnEtr7tNhZ1h161xSWM3XClBgPV9Uny0FHrHg10DgUpSoCqBftg==
Received: from DU2PR04CA0346.eurprd04.prod.outlook.com (2603:10a6:10:2b4::33)
 by AS5PR10MB8203.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:652::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 14:52:07 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::9) by DU2PR04CA0346.outlook.office365.com
 (2603:10a6:10:2b4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 14:52:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 3 Dec 2025 14:52:06 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 15:52:43 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 15:52:06 +0100
Message-ID: <b97630e9-d93d-4c63-84f7-685027b54957@foss.st.com>
Date: Wed, 3 Dec 2025 15:52:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251118231717.577932-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251118231717.577932-1-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFC:EE_|AS5PR10MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: dc77fe37-635f-41c2-b98c-08de327b879c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wlp5b29hQm41STVibTAxWFNmV3hMeUMzL1FxajZtbGhFYmFBU0ZQcVFQajY2?=
 =?utf-8?B?a2V2NU9aKzdOblZtSW43SmUvQWJvSHZLQnUrVFZxRHRFSFBQaFdyeFkwd1dW?=
 =?utf-8?B?SnhjajRaeXJjME9iaytYREVVSHozU3VjcXVsVTBXK3MvblpQb1Bwakx0azRF?=
 =?utf-8?B?dElnQUpXVU5Tb3B6QUc1SlluVWJ0UVFqNmxZWWp4Znd4RXNIMjg1MjVzZVdn?=
 =?utf-8?B?K3gzT0l6d1IvOXh3YkdwemNTL044bFN6NUViMnRxVThWQjYzMy9xUENzTVZO?=
 =?utf-8?B?QkkvVWZzbERLbVlnVEw4b09KUTJIVm1tSEJUQStZSGJrQUFKcUZ6TENhQkZ4?=
 =?utf-8?B?NXMwbzRlR2t3U21hUHgzalJzN1dEMzlNV3cxak1rWXhXb0FOODhuN0dFbFBx?=
 =?utf-8?B?K3k2b0U3L2hRVi9HZm03UVZQVWhRc0FMZnpMZlY4NkJib1puTVgvZU1oWVpk?=
 =?utf-8?B?RjFodjkycVltaHF4ZzZxcXRjdi9sTTZQNW9Ud2hBc1MvSlk5UzZYeWFMbGVs?=
 =?utf-8?B?c242TjMyVWhya2tMR1VqcFA1S1Q1YUtZd25FQzB1QlFJRDFZWWpUUmtnTVl0?=
 =?utf-8?B?QUo5b3dxMHVKY2taZXJ5eVo4d0FwaEtVeWhvWVBzcEtTcG02WktqYnhNcytj?=
 =?utf-8?B?S0NHcU8yYU1mSjZmckYxQUE5dWpMVFY5dzFOSDdhT0g0OGVDU0dPTE1TK3B3?=
 =?utf-8?B?QitxbHhPNjRqRWpmMXlMYUVMMVJqTXl1ZC9tMXFYbHlibnJBd2JGN2dxNm5G?=
 =?utf-8?B?TFpmSERjN3F1bUxNeTIyWERIVGorU05yeUp6K2h2b21XaTR1cnkvbXRBdlNU?=
 =?utf-8?B?VHdKblQ2L3NkNVJIZkwrTEdDWTJucWgxZlVjM0s2OEI2Z2w4UElwajcraXBW?=
 =?utf-8?B?akxvUE1JSHFxNU53dnZtOGczbEFEWmtURlZDU0ZoOG9tK3NrbmJPeEVxV045?=
 =?utf-8?B?cEhSbFZVUXFrMVhEN2pXVFQ1Z0U3Q1lwc0JYWXF1MGJGcnpBMzg1YVI2TGNw?=
 =?utf-8?B?REJWR2lUZC84WjdwR0RUQys4U2VReWpaS1lCMGhSWHRYNk1RWjNCWUkweE5W?=
 =?utf-8?B?Mk43cWswRlhpZnlORG5Qb2tZMVlDN09TK3RUc01FclN5dWV2REQvYzhCb21X?=
 =?utf-8?B?enJ4djlpL0JRbWZkZmVrWnZSUUovWXI1V29pRHE0UEM4ZWRmNHpWVnBTTzVM?=
 =?utf-8?B?OEVHaXRLNU1oeWcvTGZ3aTYrMEl1RytRc0U5TlpVZm1TLzh2bEN3VWMzVTFa?=
 =?utf-8?B?b3dSYWRNRmg0a2tncUNSMnM1QnlOK2xmaHIxbHBPRmZtVjBuWmtQNDhYQm5M?=
 =?utf-8?B?TkZyaTUzei84eVFSK2VWRXd2Q0RUS3dKSk4wQlArLy9PSnlYQVd6R05JUDR2?=
 =?utf-8?B?NThEOTl5ZUxxZ2RDMDBONWZQQmdRdW00L0VTUGhHbVByM1FZam4wb3ozMU1K?=
 =?utf-8?B?alh3bjZxY0p6RkJtSnpLNGR1YzVmZjh3RDhHVW5wZXJBZ0lzV2NRczJ2VnBS?=
 =?utf-8?B?eDZScHJPeWlqNDVMWnJTY3psTXVPWDRjUkg0T2dHVWJEOEZveUJDYVI2SlI3?=
 =?utf-8?B?MTQyRE5JZjlzT3V1VHZHVEk4QVpTSVhrbEdoQ0RZTGRZNmlSRmU4b0pOaGw4?=
 =?utf-8?B?Zk5qVlo0VEtkckUyVFdFdGJsQXpoYmMyQXBZR0ozOTZTdEV3cVYwRjVXY2xw?=
 =?utf-8?B?RlZTbTZHVktZTmF4aXc3WXIya0FiMU1FdUt2RnRVRmwweU5LZ2w1elc1WFJi?=
 =?utf-8?B?MnlVdWo1WjRCclNtZVdBb3Rib0hxemJOV29wM1l5WUl4WEJvRERDUys2Mm9h?=
 =?utf-8?B?a1BBbTA0bm0wdW56cVFRVkhnTDdUbzdiQ1NDcmk4MGlObXJoWXBtZDRSdk9l?=
 =?utf-8?B?d2ltSXlPN3FRdzh0NmRtK1hZRGhVT095YjlLaHM5RlRuK3F6SU5wOW1EWlox?=
 =?utf-8?B?VGlDTjZNd0EvdVYwOHhVQVpIeFdJdU1QRlBrdEZFSm9MYUcrMnNYSGJyR2JL?=
 =?utf-8?B?VURVdi9Pa2luOE1nM1lvdTZIOTZ4VTMrdEdEUEFsVGFmS0ZrUU5wUGlJVTlQ?=
 =?utf-8?B?Ti9RalE4SEJFa24xYnBVcnJ3MjlDVUU5bWk4RmNOcFNNclVqNGdJa1NrdzhF?=
 =?utf-8?Q?3zIg=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 14:52:06.9662 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc77fe37-635f-41c2-b98c-08de327b879c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8203
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDExNyBTYWx0ZWRfX3nCfEKAvKPip
 Gmu8KXcTDLKsr5iMZ/nLW5xsB+AtYW8KUdIBDlAFlRM4ysh4ITCR2tzT5ea15d1z1rYi+1PZzO1
 4gXM5HshhMpKmi9Busgyyaq/LMKYzD0enulTw5SGTMcVwg74XRdjopj5AyBGuE1sLzxcfWNgXhe
 LT+kBiOwRo/AH1TrsTd6EkzIOeFVUGZgYaHOYI2GfmsekjFhac30NaryiTbhzCkYrToC4SJb0Os
 y+9VyfbvZMHb+2rgpkHJJb2kOX5G0plancyoPdHlTQf0hAE6sI/B3rdub/Bi1ARBDtWgEApOrTB
 bACfk8utaeAAD2ancNdpdoMTRJ9tqqzS+MvZ56qLEf05PKUuppYMdwvRFMZjxLUtsLD+/2ND+Qf
 utO2y2BhN7PsSBbFUDBUrGV52x9p2g==
X-Authority-Analysis: v=2.4 cv=buhBxUai c=1 sm=1 tr=0 ts=69304e9a cx=c_pps
 a=/riwZtEhZw8wleqld+6sWQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=vMDSZMCM2png5bxp:21 a=XWp4PHTOCikA:10
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=SoRHu5N-5CeALsXmRx4A:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-GUID: Q7OeMjTQtAUQysD07BysSPIqHnHemWId
X-Proofpoint-ORIG-GUID: Q7OeMjTQtAUQysD07BysSPIqHnHemWId
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030117
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: Fix handling of OPTEE in the
	middle of DRAM
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



On 11/19/25 00:17, Marek Vasut wrote:
> STM32MP13xx may have OPTEE-OS at 0xdd000000 even on systems with 1 GiB
> of DRAM at 0xc0000000, which is not the end of DRAM anymore. This puts
> the OPTEE-OS in the middle of DRAM. Currently, the code sets RAM top to
> 0xdd000000 and prevents the DRAM range past OPTEE at 0xe0000000..0xffffffff
> from being set as cacheable and from being usable. The code also sets the
> area over OPTEE as invalid region in MMU tables, which is not correct.
> 
> Adjust the code such, that it only ever sets RAM top just before OPTEE
> in case the OPTEE is really at the end of DRAM, mainly to be backward
> compatible. Furthermore, adjust the MMU table configuration such, that
> the regions over the OPTEE are simply skipped and not reconfigured, and
> the regions between end of OPTEE and RAM top are set as cacheable, if
> any actually exist.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@lists.denx.de
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/mach-stm32mp/dram_init.c    |  4 +++-
>  arch/arm/mach-stm32mp/stm32mp1/cpu.c | 11 ++++++-----
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
> index 34b958d7afd..e36e42e7c61 100644
> --- a/arch/arm/mach-stm32mp/dram_init.c
> +++ b/arch/arm/mach-stm32mp/dram_init.c
> @@ -65,6 +65,7 @@ int dram_init(void)
>  
>  phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
>  {
> +	phys_addr_t top = gd->ram_top;
>  	phys_size_t size;
>  	phys_addr_t reg;
>  	u32 optee_start, optee_size;
> @@ -86,7 +87,8 @@ phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
>  	/* Reserved memory for OP-TEE at END of DDR for STM32MP1 SoC */
>  	if (IS_ENABLED(CONFIG_STM32MP13X) || IS_ENABLED(CONFIG_STM32MP15X)) {
>  		if (!optee_get_reserved_memory(&optee_start, &optee_size))
> -			reg = ALIGN(optee_start - size, MMU_SECTION_SIZE);
> +			if (optee_start + optee_size == top)
> +				reg = ALIGN(optee_start - size, MMU_SECTION_SIZE);
>  	}
>  
>  	/* before relocation, mark the U-Boot memory as cacheable by default */
> diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> index e0c6f8ba937..252aef1852e 100644
> --- a/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> +++ b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> @@ -82,11 +82,12 @@ void dram_bank_mmu_setup(int bank)
>  	     i++) {
>  		addr = i << MMU_SECTION_SHIFT;
>  		option = DCACHE_DEFAULT_OPTION;
> -		if (use_lmb &&
> -		    (lmb_is_reserved_flags(i << MMU_SECTION_SHIFT, LMB_NOMAP) ||
> -		     (gd->ram_top && addr >= gd->ram_top))
> -		   )
> -			option = 0; /* INVALID ENTRY in TLB */
> +		if (use_lmb) {
> +			if (lmb_is_reserved_flags(i << MMU_SECTION_SHIFT, LMB_NOMAP))
> +				continue;
> +			if (gd->ram_top && addr >= gd->ram_top)
> +				option = 0; /* INVALID ENTRY in TLB */
> +		}
>  		set_section_dcache(i, option);
>  	}
>  }


Hi Marek

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>

Tested on stm32mp135f-dk and stm32mp157c-dk2 boards.

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
