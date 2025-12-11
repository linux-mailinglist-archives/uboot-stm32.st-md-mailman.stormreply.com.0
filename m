Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67844CB6611
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Dec 2025 16:52:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED250C5F1FE;
	Thu, 11 Dec 2025 15:52:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E55AC01E77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Dec 2025 15:52:45 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BBFHh7H1326413; Thu, 11 Dec 2025 16:52:18 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013058.outbound.protection.outlook.com
 [52.101.83.58])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4aytfha0sr-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 16:52:18 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNDiQ2biUSxdactHWl32s4b2BIssVar6qE/LZ1YnhLAamu0LVESTL3GCRZvgyBdRSvJg0qWFcsscfPxsH062DZnyHUnDKQwaHV237K/T0PNQZf/oOmaxdt90V3MrzrOBJHTTtqljFePYCuYtafBQECUN5rhqUr56cXB6g3hBDYPbX89naaWw2KXkH9hyEnACkZD6nnmfNOvUnUGIXgAX3WZvb7s2NqyoSefPDabgEUVsmURCDYKsYdgqwJaPiic2mSssnWvRTNxR514H6v7ESPTe0mdoc9QLNs56smOSCLPxi81eeXAGf536aCMuuNHZd/uDlij4IyCi8JdWiBNgGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWGVJ70x4hsgC35QWVF4rOwPC4FM8OlRqI/S8pM0ops=;
 b=K6jFPvqIzyMVCy3iEIiPqb2IWenkJ0PYQj5xLyhW6TbFA7kNCBK2ga1oYIKE1muLZdJDTaZymRhoAfefjQMAO38uIM4GSUSGCD+ng5mPCuvsUyboJKBWq5AO7PCnYXMctvmAMfAEgX9jod5wttFSe0eMSjcVKHdCRMAqkXV0XPx+kUAPQq3XdQ79viiPr2Vc0VMu7NAXOH5h+RlNFuLey7iWez5ssvfk8+hhut+PsNQkA+NteAGvPVYqUad1DHPj/PV8Lxdkah6D464zsCijuDjf1Tw7kW2GqYl50uu1J20u4L6srtGbVTJyJolqRBHgxHXJUXY2o+5OuW8J3gNJQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWGVJ70x4hsgC35QWVF4rOwPC4FM8OlRqI/S8pM0ops=;
 b=Us+gdL8/dSUdC8it8LNOghlYYLAtm1k4Z3dx3RiRn2mN9YRtSrVwXuxoKPXxTAncIuBsMFN/YOeAx+C/E5JcgkAV0YkEI3m1eYA8lQaKygUWwugTsIV8L+rg4WArvA2zZZoVkAq9UQehpL3clyNWGMZ0J/nxP/PvVYx2kthLBsvjB7mLsB5F1X3H1vXPdWwxgvuBIYFIXkU3d5aAKCMvvsKdXgAbSj8llFSSymiBfpF9XJg2RVl3hJSGphMrsLtNTUqxN093Fv0QH41JecSQPImn9qajz+/l3O3l1PedogzelO4ursc5k4suLwucpKsrGdpxT2WNIxuEnOF6SQYpbQ==
Received: from AM6PR05CA0034.eurprd05.prod.outlook.com (2603:10a6:20b:2e::47)
 by VI0PR10MB8835.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:234::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 15:52:15 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e:cafe::26) by AM6PR05CA0034.outlook.office365.com
 (2603:10a6:20b:2e::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.16 via Frontend Transport; Thu,
 11 Dec 2025 15:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 11 Dec 2025 15:52:15 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 16:52:55 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 16:52:13 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 11 Dec 2025 16:52:09 +0100
MIME-Version: 1.0
Message-ID: <20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-3-44e6e7de2beb@foss.st.com>
References: <20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-0-44e6e7de2beb@foss.st.com>
In-Reply-To: <20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-0-44e6e7de2beb@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>, "Peng
 Fan" <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|VI0PR10MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: dcef4e36-9016-46c1-3f75-08de38cd4187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b21CS2cwUURNYmc1bjN1NzdlZEUrL2tTVk15V2pWZ2JZSXlleGR0REMxQ3Rn?=
 =?utf-8?B?VjlMYWdDV0g4UVR2ekQ2bC9hNmVYYmgxUXgzbVU5aFFENHJSanliZVhtVWxj?=
 =?utf-8?B?SkVuOGtNZ09xd3FZT01QampYV3MxL045YkFWdzBQWXN5Q2FZd0xMM1VtSEwy?=
 =?utf-8?B?MmVOK3d2TTdJbHgybEdrTzROR2liZjJkNVdrRDhXdEhza25zK1lVTHlweWJz?=
 =?utf-8?B?TW85VUpnTk05RDNpbkxqK0VLZ3JteXJLbnNNUFJtSG1JOXZvRkNSNzdXV0Y1?=
 =?utf-8?B?Qkl3ZG9Wb3dOS0RRd0J2MGVNam8xT1grQ0hMcVNGWVpQSVlNQXNDUWhiSG4r?=
 =?utf-8?B?dlFhdVQzeHc3bHBFOWJQK3FHN21UMUhUamJla2hndGl6SHRpY3ZqbkJBL0tF?=
 =?utf-8?B?a3lqaE9sa0R0VklCMjFTYXY2VGdJZXBmSUlFZWMvN1owcVZuSDNZcFZBQTlN?=
 =?utf-8?B?MzVRcWRaemg4aHZRQk1iUjBtYVFrMC9LK1h6aW8rWitqWHhaWnRTMUdISHJE?=
 =?utf-8?B?Yk5kVkJPM1Z4QzVXaFZzYjMzS2VqS04rUHlnK3paOEl4RGtQWnZzbUhiZm5n?=
 =?utf-8?B?dFk2MzNYbGNPdnFaQ3hnbG5tbnV6aXd0eU93NUtQVUdSMTdNV2VOSEEvSHJr?=
 =?utf-8?B?dFI4TEpyVDdLV1RtSUpPeHVBRmI3cGxISEVFd1pURUpBNmxxVUlCajZaM0FE?=
 =?utf-8?B?YjlPRTVvek5PNGhNSU5halVXSUNoUjZpT3Q5bHJEY0xXNVlVSzNWOHU0WFpD?=
 =?utf-8?B?a3pzVzBOZHVOWkJ2bmJxOE0vUi9mcjZseC8vRE84M2toYTJWQ1J5aCs4UUZw?=
 =?utf-8?B?dk5oTzRCaHlKWjcvUUVPeTRrY3BqbFdEUEVqbitwcnVnM0o4dElMRUlYNldh?=
 =?utf-8?B?Tnd3d0RXWGZFeFR6RmJlcFZFYTFvdzZPdWN4UU1PNjlBdmJJalhadXFvc3cz?=
 =?utf-8?B?NUY0YnBHQXFNakZmMVJ4bkRLRkpFZlRDajRTQ0NOeWJJRGJ0TDF4S0EwL1N3?=
 =?utf-8?B?MHRiQkZKZVVuN2VIdnBRTE05eHNWMnoxb3dsTFhDdjBxRG44YkhzWmpIWFVV?=
 =?utf-8?B?V0VzVG1PNm1sNkswSzB0M3d0RFhLNUNlMjYveWpPZ0gxcFloZTY5TjQ0MHZU?=
 =?utf-8?B?UTRqSXlnR0lqc1RLRkpvekNXS0ZBV1lhdmVFczdjeXFsYVc2N0ZDMjQyODR1?=
 =?utf-8?B?VnJ2NVFBNjZnYW1YdjM0cytCR3ZHdVBRUWVJdGt4UUJEM2VOcTNGSURmc1ZO?=
 =?utf-8?B?a2IyYSsxMStEOEthc01uWEVLUHJJUXpac3lSbllYNHExZmZ3a0JnUVg3OTNs?=
 =?utf-8?B?TVdMNy9xZmNmT0R6YUU2c2pGOVp0TjBGMWpTdEJ5NXZnV0RtbklNTlhTVFNP?=
 =?utf-8?B?WW1YOWt1dHJvcWY1NEp5OWhJL1I0OHkya0pXWEVLSjJGemJ0QWxMU3JNWFY4?=
 =?utf-8?B?R1BkODBDbkN0bkhHSWE2dzlKenZBQjBOU1BrOEhpNXlLS2pQTGhmU1JOU0Zn?=
 =?utf-8?B?VWV3US9VN1BRZ1htQXh3SmxwMXZsVVRySjBhSndYTGpKZXl3ZjhmSzMzbWhU?=
 =?utf-8?B?ZmpSZW1mVzBoRFcvZlVHT2M2MjViUStGMWU3SXZlMitjK1dLdG05TFA4aS94?=
 =?utf-8?B?S2hUNDJla0VMYnQxSlFGNmE1U0xVODQvT3JiVGxvMXZCZFcxTytVd3lsZ3ln?=
 =?utf-8?B?N0thK3lFRTUvRk56NnNmdHZ0a0YrR09qVi9jbmdPVGxWU0MwcENGTmdPaTBX?=
 =?utf-8?B?UlIrbUlIQ1FZMEJzOExNazJ6YUo4am1vemJIcktmczlLMFhnMGFqWkU3K29h?=
 =?utf-8?B?S3dNdUZGK0tMdkNTWEE4cHBlVWZsTXhqNUgzbEpFbFJSRkV1T2JTYnNmTUJU?=
 =?utf-8?B?d05aUThNSFZPZVVYOVlheU5kT3ZacnhERmdwWUZRVk9tNElOb0g3elNDcTRG?=
 =?utf-8?B?M3lzQTRJa0xRczd3a3ZMQkgwNmY5cEdhOWw3OGk0dEdhN1ZIelpYVDAwaWJD?=
 =?utf-8?B?Nkd4cWhJeTVmbitIbEFJM0NqdFNzQ0ErNU9DcHgxNzA4YXNxVnpkTk0zSjUv?=
 =?utf-8?B?amhpUDJ3L0VyUkNCbUIxY3U4MjF3NUFUUjd1K09CK3BiZFdEblRXWEloVkk0?=
 =?utf-8?Q?8asU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 15:52:15.1202 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcef4e36-9016-46c1-3f75-08de38cd4187
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8835
X-Authority-Analysis: v=2.4 cv=EZ7FgfmC c=1 sm=1 tr=0 ts=693ae8b2 cx=c_pps
 a=xFT3qlHD+1xS+TaMy1FbcQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=L0401qF_N2unGKMpHmUA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEyNiBTYWx0ZWRfXw/0ye0ycAVP2
 hG5nV2Z4WvXFxh66Bh7kWtv6Rs1BMlwHSBDvzNw42LjGxVHC4gMqCPAAKxQOVAlFegE1Asuj+/+
 FKpsbqP9YSQE5iSPmvRjwqJrSFkdGwemmqw7x3xiQc8dIaBfvYsgFYIOsamH98F7ZWl+uJnWO1r
 awx0GLlytikMkX/rZeSmRPIQ/3aMdG7NsCEwCcd0GY7Y3/EiU3JlWG4wCdoMumw8UokGpAdkiCC
 1HYfoOFmJAr0Fy2peVkqdwXeX3wfZbPfx4EsWM3vb4p/Q4XomaHIFI6kSjhn4XP0Xr+ZYNVem27
 w++LAJcwP0MtG54KM0EponekDwtKQrIEvrQ7uKOcrLBSLjvap4ZHwTB0ceswAtoUkR0mYYccmNy
 yHs7BK8BohDMb3hPIT/HaiqudvsZzA==
X-Proofpoint-GUID: L9cjrlmstsqYz8wwejIk3CJ7LwavlpvN
X-Proofpoint-ORIG-GUID: L9cjrlmstsqYz8wwejIk3CJ7LwavlpvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110126
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 3/3] clk: stm322mp25: Resolve scmi clk
	before using it
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

During clock's registration, clock's name are used to establish parent -
child relation. On STM32MP25, most of SCMI clocks are parent
clocks.

Since commit fdb1bffe2827 ("clk: scmi: Postpone clock name resolution"),
all scmi clocks are named by default "scmi-%zu" until they are enabled,
it breaks clocks registration and boot process for STM32MP25 platforms.

By resolving SCMI clocks before clocks registration, it solves the issue.

Fixes: fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp25.c | 139 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index b487f33b6c7..a0bf2a47332 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -5,6 +5,8 @@
 
 #include <clk-uclass.h>
 #include <dm.h>
+#include <clk/scmi.h>
+#include <dm/device_compat.h>
 #include <dt-bindings/clock/st,stm32mp25-rcc.h>
 #include <linux/bitfield.h>
 #include <linux/clk-provider.h>
@@ -43,6 +45,131 @@
 #define SEC_RIFRCC(_id)		(STM32MP25_RIFRCC_##_id##_ID)
 #define SEC_RIFSC(_id)		((_id) | SEC_RIFSC_FLAG)
 
+const int stm32mp25_scmi_clks[] = {
+	CK_SCMI_ICN_HS_MCU,
+	CK_SCMI_ICN_SDMMC,
+	CK_SCMI_ICN_DDR,
+	CK_SCMI_ICN_DISPLAY,
+	CK_SCMI_ICN_HSL,
+	CK_SCMI_ICN_NIC,
+	CK_SCMI_ICN_VID,
+	CK_SCMI_FLEXGEN_07,
+	CK_SCMI_FLEXGEN_08,
+	CK_SCMI_FLEXGEN_09,
+	CK_SCMI_FLEXGEN_10,
+	CK_SCMI_FLEXGEN_11,
+	CK_SCMI_FLEXGEN_12,
+	CK_SCMI_FLEXGEN_13,
+	CK_SCMI_FLEXGEN_14,
+	CK_SCMI_FLEXGEN_15,
+	CK_SCMI_FLEXGEN_16,
+	CK_SCMI_FLEXGEN_17,
+	CK_SCMI_FLEXGEN_18,
+	CK_SCMI_FLEXGEN_19,
+	CK_SCMI_FLEXGEN_20,
+	CK_SCMI_FLEXGEN_21,
+	CK_SCMI_FLEXGEN_22,
+	CK_SCMI_FLEXGEN_23,
+	CK_SCMI_FLEXGEN_24,
+	CK_SCMI_FLEXGEN_25,
+	CK_SCMI_FLEXGEN_26,
+	CK_SCMI_FLEXGEN_27,
+	CK_SCMI_FLEXGEN_28,
+	CK_SCMI_FLEXGEN_29,
+	CK_SCMI_FLEXGEN_30,
+	CK_SCMI_FLEXGEN_31,
+	CK_SCMI_FLEXGEN_32,
+	CK_SCMI_FLEXGEN_33,
+	CK_SCMI_FLEXGEN_34,
+	CK_SCMI_FLEXGEN_35,
+	CK_SCMI_FLEXGEN_36,
+	CK_SCMI_FLEXGEN_37,
+	CK_SCMI_FLEXGEN_38,
+	CK_SCMI_FLEXGEN_39,
+	CK_SCMI_FLEXGEN_40,
+	CK_SCMI_FLEXGEN_41,
+	CK_SCMI_FLEXGEN_42,
+	CK_SCMI_FLEXGEN_43,
+	CK_SCMI_FLEXGEN_44,
+	CK_SCMI_FLEXGEN_45,
+	CK_SCMI_FLEXGEN_46,
+	CK_SCMI_FLEXGEN_47,
+	CK_SCMI_FLEXGEN_48,
+	CK_SCMI_FLEXGEN_49,
+	CK_SCMI_FLEXGEN_50,
+	CK_SCMI_FLEXGEN_51,
+	CK_SCMI_FLEXGEN_52,
+	CK_SCMI_FLEXGEN_53,
+	CK_SCMI_FLEXGEN_54,
+	CK_SCMI_FLEXGEN_55,
+	CK_SCMI_FLEXGEN_56,
+	CK_SCMI_FLEXGEN_57,
+	CK_SCMI_FLEXGEN_58,
+	CK_SCMI_FLEXGEN_59,
+	CK_SCMI_FLEXGEN_60,
+	CK_SCMI_FLEXGEN_61,
+	CK_SCMI_FLEXGEN_62,
+	CK_SCMI_FLEXGEN_63,
+	CK_SCMI_ICN_LS_MCU,
+	CK_SCMI_HSE,
+	CK_SCMI_LSE,
+	CK_SCMI_HSI,
+	CK_SCMI_LSI,
+	CK_SCMI_MSI,
+	CK_SCMI_HSE_DIV2,
+	CK_SCMI_CPU1,
+	CK_SCMI_SYSCPU1,
+	CK_SCMI_PLL2,
+	CK_SCMI_PLL3,
+	CK_SCMI_RTC,
+	CK_SCMI_RTCCK,
+	CK_SCMI_ICN_APB1,
+	CK_SCMI_ICN_APB2,
+	CK_SCMI_ICN_APB3,
+	CK_SCMI_ICN_APB4,
+	CK_SCMI_ICN_APBDBG,
+	CK_SCMI_TIMG1,
+	CK_SCMI_TIMG2,
+	CK_SCMI_BKPSRAM,
+	CK_SCMI_BSEC,
+	CK_SCMI_ETR,
+	CK_SCMI_FMC,
+	CK_SCMI_GPIOA,
+	CK_SCMI_GPIOB,
+	CK_SCMI_GPIOC,
+	CK_SCMI_GPIOD,
+	CK_SCMI_GPIOE,
+	CK_SCMI_GPIOF,
+	CK_SCMI_GPIOG,
+	CK_SCMI_GPIOH,
+	CK_SCMI_GPIOI,
+	CK_SCMI_GPIOJ,
+	CK_SCMI_GPIOK,
+	CK_SCMI_GPIOZ,
+	CK_SCMI_HPDMA1,
+	CK_SCMI_HPDMA2,
+	CK_SCMI_HPDMA3,
+	CK_SCMI_HSEM,
+	CK_SCMI_IPCC1,
+	CK_SCMI_IPCC2,
+	CK_SCMI_LPDMA,
+	CK_SCMI_RETRAM,
+	CK_SCMI_SRAM1,
+	CK_SCMI_SRAM2,
+	CK_SCMI_LPSRAM1,
+	CK_SCMI_LPSRAM2,
+	CK_SCMI_LPSRAM3,
+	CK_SCMI_VDERAM,
+	CK_SCMI_SYSRAM,
+	CK_SCMI_OSPI1,
+	CK_SCMI_OSPI2,
+	CK_SCMI_TPIU,
+	CK_SCMI_SYSDBG,
+	CK_SCMI_SYSATB,
+	CK_SCMI_TSDBG,
+	CK_SCMI_STM500,
+};
+
 static const char * const adc12_src[] = {
 	"ck_flexgen_46", "ck_icn_ls_mcu"
 };
@@ -761,6 +888,8 @@ static int stm32mp25_clk_probe(struct udevice *dev)
 {
 	fdt_addr_t base = dev_read_addr(dev->parent);
 	struct udevice *scmi;
+	ulong id;
+	int i, ret;
 
 	if (base == FDT_ADDR_T_NONE)
 		return -EINVAL;
@@ -768,6 +897,16 @@ static int stm32mp25_clk_probe(struct udevice *dev)
 	/* force SCMI probe to register all SCMI clocks */
 	uclass_get_device_by_driver(UCLASS_CLK, DM_DRIVER_GET(scmi_clock), &scmi);
 
+	/* resolve attribute for all SCMI clocks */
+	for (i = 0; i < ARRAY_SIZE(stm32mp25_scmi_clks); i++) {
+		id = CLK_ID(scmi, stm32mp25_scmi_clks[i]);
+		ret = scmi_clk_resolve_attr(id, NULL);
+		if (ret) {
+			dev_err(dev, "Failed to resolve SCMI clk %d\n",
+				stm32mp25_scmi_clks[i]);
+		}
+	}
+
 	stm32_rcc_init(dev, &stm32mp25_data);
 
 	return 0;

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
