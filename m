Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E803CD02B4
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Dec 2025 14:54:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 226FCC87EDE;
	Fri, 19 Dec 2025 13:54:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93A7BCFAC40
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 13:54:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJDns1j849602; Fri, 19 Dec 2025 14:54:34 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013054.outbound.protection.outlook.com [52.101.72.54])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4r33benk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 19 Dec 2025 14:54:34 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FobooSjb+915WTzu/tiBBzPc+xVvuDAJV8u6fFIrurLsuWwOFv/W8iuNy2bnEmnqW9EgZUdKHpdNeY1UvjxINwKxfy8Jddi/wMKgrQrCetoxrztaP47H884IWzW0ISnVt1u+PuvfWdeRPdsifLyBL0HVrOwKnRQjqG1UnxvQR2p9UY3hXT2tFJVI6yOP6z212Apz79c1JPfqyb3TI+FMEnzGJuxfrpNwtSp2BLfUQd4buswroBY7jR3j2WPkLBex3d6GZIruu+Oz6JkXg4GvTi4xwnCyCHDvt37Clh94mb27ZOk5mgEh2q6NNh2ZX/Ggk2swS0vUNbXVstyaKXU2NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTzPbTSPrNUV4VR7eL9qlVE3EXtJ1CHJMVL9XXUiiGo=;
 b=FLljMrHgr2glH2GZHG9b+qKheTpzHxrQ10XnE2fU/dN7h5TBDE/N5s1/2HK5t5+n0Q12Qa+YrB4Jcub2xEkbDmABqxh4oeN3QV23kFBAM2vUt5xUB2LlN7PLHselPc5pVdgIHYtnadY3NiDPQ4RlnKTacgmMeUeWlYZmYUDNdNca4ekVNbJ2CwH7iPvHxsFHKVhI2dGkdfvmBkf+44+Oz6KrrO7tjhoHa469BRo7PjZ6mRiers0d9W+peHrbI8TRar5xyFZHm3BJy0yKi5O49STGDB1WzMO0CGCXREldm5cJ4UpQOOhle73KwqYvnAZekjwYvKTUttzJI34aJEf68A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTzPbTSPrNUV4VR7eL9qlVE3EXtJ1CHJMVL9XXUiiGo=;
 b=GHsTsgax/4q2uvLYTtZXY1yosPXnE8+l3AwCMrSsODsEWY1EeCz6J4Qrw1rTKP8DyfBIzTjDQdK7tAtle2wMYksdD33LGjRzVA9Pj3PRKZu55q6yT3oXCY07h1j/zLdmS7EE1d+uTpSWnU69fOeRHKq2XRMbIpHxqhGIE+YjrrTRW6SkdG+oL8lrFXUHqxtDCuJo+JUH4LI1QN6dxfEcpWRC/sD745U8cs5vtxEPR6yn23Po8yrg3f4PQJiEXxEIQjbfMTIpC/S2WoGb3CvJ1jewctGwJQ3BIoQQRLE8MufiNYug45QGK1rjQZR8TughHVeYmSdUzT/jAWaIJRW3lQ==
Received: from AS4P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::6)
 by DU0PR10MB7025.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 13:54:30 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::24) by AS4P195CA0019.outlook.office365.com
 (2603:10a6:20b:5d6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 13:54:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 13:54:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 14:55:08 +0100
Received: from [10.48.87.14] (10.48.87.14) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 14:54:18 +0100
Message-ID: <f2310245-35cc-47f9-ab16-7a0537fe3479@foss.st.com>
Date: Fri, 19 Dec 2025 14:54:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>,
 Peng Fan <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
 <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-2-d055da246e55@foss.st.com>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-2-d055da246e55@foss.st.com>
X-Originating-IP: [10.48.87.14]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A793:EE_|DU0PR10MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4eccd4-7267-409f-3acf-08de3f0621ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3BtS3ZaYXg1UXpZZUpVVWtxcDhkNlFyTGxFdkxXR2RhNlFMck1hcXZINnc5?=
 =?utf-8?B?TnEzRThubVh2R1dHZ05XaFQ0ZEJiZm5sR2JkcjNSL3F1TllRS0YwMlp0NGtj?=
 =?utf-8?B?enZMOTRIOUtPbFRiL1EwY3U1anh5dytuWmFGKzc3SFZEbVFYYnFvQ0oyTUx2?=
 =?utf-8?B?eWVjdnErYU1EQUNyR2xIblAzQklNSVhQL1drUDB0S1ZMSFBFYjZqUDQ0dlpO?=
 =?utf-8?B?eTZiMFBvRDJhTXpCOUU5MnozWWFodE5rbVRJVFNDbTliWWk4UmxnREdvYUZM?=
 =?utf-8?B?ODlkRUtUOE1BbWYrVUVFL0ZNVjBXWHRBS24wNWtUQlpzOWtrTjduUmJBS2FN?=
 =?utf-8?B?anZrMWlVd3Y2WnVsZkZrb0Q4aU84NFZpVkl0VEg5R1NBWExDV2RHWDJJWFpE?=
 =?utf-8?B?SUlTQUdpZGUyam5JWlJoVVB2T3BsdDMvUWZ3Mkt0YVRaaHJ6WFVvMnNWOFJY?=
 =?utf-8?B?dDJ6Mlh5MGJ5RW9NRkFGSlhhZnNleDVUb1VMK0VaQWtyalhVQVVxYnljMFNO?=
 =?utf-8?B?MnpkZ0tWQ2hIcEk5Q1oxMjE1UTNCVVU2cFE1dEgxdEZYdVM5OGJTUHhLWnBR?=
 =?utf-8?B?emNla3FRYThFT3Q4WlNxdDlqUUhSMEZYekFWbEhhNDBsL1dONGhsTkIrTnRY?=
 =?utf-8?B?Zkl1d1VBNmxkSFc2YnJTNnFYZTZoVElTb1VIYlhZZUQyM2Yrd1BKL2E0cDRT?=
 =?utf-8?B?M3V4NklrN1JoNWhsb1B2TkFQSXFjUHh4cVR5Q3Fac0dLaCtRM2pvSklneDk5?=
 =?utf-8?B?dituU3N1OEtySjhnUWtRdUZTSVlxb1F2RlpSYzhWd0xZeEkyYVRmYnZKbVNX?=
 =?utf-8?B?ZTY2NnJLeDUyQmZqNlR2L1VGSDlPb3lzb053Szhrc1RWQ2JlaE5JMnJnRUFk?=
 =?utf-8?B?YXQ3NnlKZ0kycytubUN3WHo0Y2FaUFpYME1DL3MzSVBrRWlpQkxDaVpGMWJs?=
 =?utf-8?B?WXJsWEV1NWUvcExRRGJ2aDgzL0hQb1hoTjUveDZ3K2ZGMW52L1h2S2N2VFZ6?=
 =?utf-8?B?eDRleFczVXY3SmpRLytIYnQvb3RTYzloempyNENqS1U0ZXFPSFJXMTJpa0ts?=
 =?utf-8?B?OEdXdU1WQ2NCWmUwK3J3c2tMajJ5L0hxN1l4eUYzSWIyS0xGK3R0NHIyRlJn?=
 =?utf-8?B?dncrdTBXYnQyTDhKT09ZUXZDNXB2VEpTWi9xRmZ1WXRuOTYrTVUvTkxVSHdH?=
 =?utf-8?B?NHRuQkxKSXNRRW15cDk0QW93TnRBRkJFUEZ6eHhSWks1YkhFN3Y5ZEMxV2J3?=
 =?utf-8?B?eXNuOTZHei9Kc0xvNmZLT1RNRHRoeWZwYUhnYjdCWnhmSHRWN1JZaG9BL2lY?=
 =?utf-8?B?ZjQycldadFF3TXBiYWpGdzVxdjVXUEl1eEtHbkhsRjUrTlhTR3loNGdwRU9p?=
 =?utf-8?B?d1kwZWlTSE5ZRmJRRFJha2JwVkg0YkVJZzRSbVlsR3RUbXNsMDAvOU5YZHc0?=
 =?utf-8?B?cmNpMmlUSldaUGRNaUpGT1Zzc3ZlSE1oNnZ4S1hiRFlWM09nRG1mb3gxNnBz?=
 =?utf-8?B?WU1qaTFOT1pZVlhtSHpBOFFVUzJLalZFaHRkbk14aTd3Z0M4NE1ZeUFLV0I5?=
 =?utf-8?B?am1nZVdEVXlhd0JDWjJrV3ZON0svUUg3V2lBU2p4dy9ySkRXUXRaYzZNRjVv?=
 =?utf-8?B?VzYvb3Iyd01VYnVVenhQOFFYNFhNcjl1T0R0cndVUXFzZVlNUHYvUHNOSWMv?=
 =?utf-8?B?WTZNemZEYzIwMW9lZXBiU2xISWV5dkFiaWRCWEpwTG9WRUlyc0JqT25odWlm?=
 =?utf-8?B?d3A0R1p4M1FOSzVqRFAzdWhIL2xpbG1SbkFRWDRSTTYxNkVvNWxSbkhFaWVF?=
 =?utf-8?B?V3ZRbnEvT0kxV2ZKbVRtcGU4elFvTE5acFNaby9SUkUrVFZPSFVzQnNxMDQ1?=
 =?utf-8?B?cWZSeEJyRXNOWDR4dXpjYmc5djdkVmd0alJHQmppajFkVThCcVcwaWhyMEFz?=
 =?utf-8?B?K3BmVVc5TkV1WTdhWGRvQXRFYlpFTWZJT3ErWXVvNnVNaWd5NkMxWGlMeStM?=
 =?utf-8?B?WnZTaG4za1lDRFpvalBodWVrSHhpeUtIcnRuZk9uZHR1TE9TSXpDRHV1cWhL?=
 =?utf-8?B?TkIvVHJUNWN1MEF3cWIvTmRNL1hXSTgva2NUYWpRSk50Nzg3NUZnTHduaG5R?=
 =?utf-8?Q?wUzk=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 13:54:30.5049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4eccd4-7267-409f-3acf-08de3f0621ff
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7025
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDExNiBTYWx0ZWRfX05I3ET7v9ndb
 0PZiGkZBzzL0nLXOIBxvVASEfeINPUUX8WrOj07K5gjlKDv4fl+GCEv2SM+NgggFzJo6NgymztW
 +aZfg4hyLSmF0JjMxjQbo5M41JhyCEAu68BHmiBpUnEZRpEIIeNqmBMCfqME/KYUUdjk7NNLJgR
 B7DAtJarPC0WrqFiaP+BCwaVHT5SV/1ZdjDGkmr3QEAu5jkJX5OhJEWQQ85RWG42wWPvMhws1jU
 Zn0po401qS2UCh8vasp8rDF/K80nmpFGyxC+GyJat+IYsHIgZgbOR3nUNemzadEOvoqGMeQ6m+R
 LRYc8f15AKMv099rABz/8dyjzJAbfVBgc7f/PMdSCoFQ/LRNb8fwebGwoRbf7/0Et+PA4wLI613
 vApPYgrtb10Bm8gWJs9KU+j0J1defMN2OLJXBzZgRiruoBzKZ8CGvyLWRox9Ej7UsaffFvdsVBx
 xtUj0rfpaudkUoJQZzg==
X-Authority-Analysis: v=2.4 cv=afBsXBot c=1 sm=1 tr=0 ts=6945591a cx=c_pps
 a=nq2KdwYzughPaYVZqSXByA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=o3YcbkTvxikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=goFYKN2dyGwo_dc-xmwA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: xscPaW5ukq8vFyIl5Gmv7roNei7IuN93
X-Proofpoint-GUID: xscPaW5ukq8vFyIl5Gmv7roNei7IuN93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1011
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190116
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 2/3] ARM: dts: stm32: Add SCMI clocks
 in rcc node for stm32mp131.dtsi
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

Hi Patrice,

You can add my : reviewed-by Gabriel FERNANDEZ 
<gabriel.fernandez@foss.st.com>

Best regards
Gabriel

On 12/15/25 15:56, Patrice Chotard wrote:
> Add SCMI clocks. These clocks are used as parent clocks and are
> referenced by their rcc's node position in clk-stm32mp13.c
>
> Fixes: fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/dts/stm32mp13-u-boot.dtsi | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
> index ad63d5027b2..623c796cc79 100644
> --- a/arch/arm/dts/stm32mp13-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
> @@ -186,6 +186,33 @@
>   };
>   
>   &rcc {
> +	clocks = <&scmi_clk CK_SCMI_HSE>,
> +		 <&scmi_clk CK_SCMI_HSI>,
> +		 <&scmi_clk CK_SCMI_CSI>,
> +		 <&scmi_clk CK_SCMI_LSE>,
> +		 <&scmi_clk CK_SCMI_LSI>,
> +		 <&scmi_clk CK_SCMI_HSE_DIV2>,
> +		 <&scmi_clk CK_SCMI_PLL2_Q>,
> +		 <&scmi_clk CK_SCMI_PLL2_R>,
> +		 <&scmi_clk CK_SCMI_PLL3_P>,
> +		 <&scmi_clk CK_SCMI_PLL3_Q>,
> +		 <&scmi_clk CK_SCMI_PLL3_R>,
> +		 <&scmi_clk CK_SCMI_PLL4_P>,
> +		 <&scmi_clk CK_SCMI_PLL4_Q>,
> +		 <&scmi_clk CK_SCMI_PLL4_R>,
> +		 <&scmi_clk CK_SCMI_MPU>,
> +		 <&scmi_clk CK_SCMI_AXI>,
> +		 <&scmi_clk CK_SCMI_MLAHB>,
> +		 <&scmi_clk CK_SCMI_CKPER>,
> +		 <&scmi_clk CK_SCMI_PCLK1>,
> +		 <&scmi_clk CK_SCMI_PCLK2>,
> +		 <&scmi_clk CK_SCMI_PCLK3>,
> +		 <&scmi_clk CK_SCMI_PCLK4>,
> +		 <&scmi_clk CK_SCMI_PCLK5>,
> +		 <&scmi_clk CK_SCMI_PCLK6>,
> +		 <&scmi_clk CK_SCMI_CKTIMG1>,
> +		 <&scmi_clk CK_SCMI_CKTIMG2>,
> +		 <&scmi_clk CK_SCMI_CKTIMG3>;
>   	bootph-all;
>   };
>   
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
