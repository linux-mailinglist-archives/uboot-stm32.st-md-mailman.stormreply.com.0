Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC76ABE8905
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Oct 2025 14:19:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F922C59788;
	Fri, 17 Oct 2025 12:19:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86C84C36B10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 12:19:14 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HCJ3vN030800;
 Fri, 17 Oct 2025 14:19:12 +0200
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010046.outbound.protection.outlook.com [52.101.84.46])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49rynhyy4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 14:19:12 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAiG/sP42/ml4y5fl0XZk7y7T1Ssd0tQp9ZxXHYuVE7foDxOo+25kQvqBMatStqJlPE41XhyZCY7p5J58CKiKyUQfTA82S4585qqs7NObNPl+j1RDRaseUETbCn69BzSRRhaP8u/BpBhY5Cdfu5a84MafCuM/Ej9p36iqF5MIlACW5ZEIJT/+pLsvwUQP7lnOLp2zDWMxOSrcGsYEbrCGVDR/8sjW4wxC0xrYD0lF5ENr6NFr7xOkEDYzYzVeD5x2dKxVh6UuhQQ2XAcSVpYwlXJD0JYsnVm6sLME8grNfI+7DsJ8+VG+DSmrmkeyaBkByykWOHLCY4Dld6+ZdRfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RKXKxrjFM5T+5VpD3RXlEwSIhQf9w6mPvd3kHZeAws=;
 b=xjivsbtOPr/Vl1Milz6hscLI/s0MfMzQm8ytSHh4kt2bGiYGz3XUdku8GMkbeLbWrIXNgJp7zbRFj50HPzP2vzpd3mjEvMzW13OByM8P7zXD4EMsYjDKFyAAEoA24ivH067Cr9FxkpKPywc8DLX0lYfoT+H+DLOcLuxYrCnKWb5xcpobQHV6g0hjQEuIerw1FTZgB56GGBFM7BXVrVzge/Ek9KKW9dtYi1c+nZ89qwthe8AswOwSuM2fj0SAAIggL26VjWrG1yRGT0uGYOVA4M5/3hjfJPyhax944ay7pF4Qg1K3BHASAgvRRoYfhcMvHpMaKByVr8LMqxxr1R4unw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.40) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RKXKxrjFM5T+5VpD3RXlEwSIhQf9w6mPvd3kHZeAws=;
 b=g+aJm6EWeYoDfiGAxNPzI3de2e7RrXc7vBX0bizfnYKNMWkop5fAt58jScesKCUqjBwq8gZSXNKJ75XZ/hXPOxlerNn9Ld81cYG2Y6Q+ex2RXBlLSmQa5MLMZw5QYpbBMrhgGtR/mo9Sx7c39lmeERO3wOVSO7RzNEp8iJPs7jsKWHqBQcolexIaSFtgEFGhZaNUr8SUNEXsaNCUYyZhct3zqhSlNumf9ThusyVBNaDrQdN4Xe+xCm8ojajudKn/UGcWR99FJ/jyMvFw4jq0j00O9Ejbft/0hWUwTQmet2H+Ls6K1+RTTQ8kSySg5KoZCXklRkTRyViqDiA6B7SJAg==
Received: from AS9PR06CA0318.eurprd06.prod.outlook.com (2603:10a6:20b:45b::18)
 by AS2PR10MB7851.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:645::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 12:19:09 +0000
Received: from AMS0EPF00000196.eurprd05.prod.outlook.com
 (2603:10a6:20b:45b:cafe::8a) by AS9PR06CA0318.outlook.office365.com
 (2603:10a6:20b:45b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.12 via Frontend Transport; Fri,
 17 Oct 2025 12:19:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.40)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.40 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.40; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.40) by
 AMS0EPF00000196.mail.protection.outlook.com (10.167.16.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 12:19:08 +0000
Received: from EQNDAG1NODE4.st.com (10.75.129.133) by smtpO365.st.com
 (10.250.44.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 14:19:14 +0200
Received: from localhost (10.252.15.38) by EQNDAG1NODE4.st.com (10.75.129.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 14:19:04 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 17 Oct 2025 14:18:42 +0200
Message-ID: <20251017121852.109561-6-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017121852.109561-1-patrice.chotard@foss.st.com>
References: <20251017121852.109561-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.15.38]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000196:EE_|AS2PR10MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: f4901f47-c8e9-4181-2253-08de0d775f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W5GSjKHImN3YawTY52NyO5kwDHj508WHPHNdESkKfZ4+ZbpA1f059cRVS3Y6?=
 =?us-ascii?Q?B4HXf2+WrYymf7B6SS0X4udPmx6yAX7SPT2EZtIP5iyWD0l0+fqJokSpTtr+?=
 =?us-ascii?Q?6sLY894/eZMeQl3+esLSfG/6v3Kd4K/G8oOerePVnVGeJ7H+48c5D5V+JAjo?=
 =?us-ascii?Q?K9iuclnOOejEJCwiuxWENpyJHTLyRgXhmyqdDO25fm6+OHJYtkxyO2h6wNlA?=
 =?us-ascii?Q?DodyF8YmQ+919WiztSPoeeR6JTPoxhDIJeD+W0uqQSFG5aP6wVhuNUIvaZUK?=
 =?us-ascii?Q?/U501T24fHV86wlIm5gHXJbwlNpK8xIhRfHequP2I5RG6kcaHAfag4hPnY5J?=
 =?us-ascii?Q?H5uEDzrLlqAGenIfvaujGOa15q5Vv4smuz+41dsF/9QY0LqGPbK3teKKssRx?=
 =?us-ascii?Q?QfxMITtqHj8ax4ps7tl1uB9ajKDCuWt33i4TzcIWz6eQS/cEtLPOSkZAJgkb?=
 =?us-ascii?Q?pbcuHEq5Sh4kfyQaLVT/GVRgyN5a3v8+Nn2FwuWSf3nyKaYc7dmL71vfTI4h?=
 =?us-ascii?Q?AfDTBDnNYWwOMXHEHFRziocH3QTf9f6IjR64es0DRD7UbpnvisAnlrw8oVyq?=
 =?us-ascii?Q?DJTkIoJCkCGydLfdGo75/Do0AXMV/AgNgB1Zo6QSAOkcOCgMg5XKYuax7gQk?=
 =?us-ascii?Q?O8WiPWjLV1Yrph7bETyFxveDiTfvLBTN8OGcjAwkU9Dse+wajSRHyMKkIZHD?=
 =?us-ascii?Q?HBoOBvn0c57KrZpXckqrzCbWT8FdoyM5MN0ezlWekPkBfBgz+rCt4R2i+Xel?=
 =?us-ascii?Q?PnaSSqHpJJTTab7CAtYzxqrvmMkUmT5CvIKxQ8qKZi78sjmQBVo/rsUTx0Gt?=
 =?us-ascii?Q?hB8vTbeqgnliydRSiNUTWizCzawIuuH1pd7ouFOTcGEVBvpSQDGXIYTeEsQz?=
 =?us-ascii?Q?6J2ulDiB6ZyFr8urnD9naXsK35CLLHBbXoLgA4D3GPPnjPDiDli6qMz9Wln8?=
 =?us-ascii?Q?dZYTAbXvovCwa8p1qHsbwS41ZlX/jFQOaK6KqQ76/SUcN2Gl88D+LOXhgfns?=
 =?us-ascii?Q?ApthpONZIkEQr8qhH7fAhf9UpQR+5nNf5ZcoQ/WXugyxMej4X+NIxPM5AxaN?=
 =?us-ascii?Q?DKbxfTFLO39G6Jxk14H2wC++aw3dviAludqfyLtcWFxWR6+W0hP9TIRtMjJH?=
 =?us-ascii?Q?jO1Glny2qbcF9alEGA4RBJSP1Qczyc3/MXFS0x9SciaEGjqSLhwrS5v1pz7L?=
 =?us-ascii?Q?2P/mkt3w27PUdvjRafSOI1UZB7uyPNOeG0FsiFuZGqIVN6l3XQ9XH8S8DwWL?=
 =?us-ascii?Q?JKWiibn8bl1APMF4G/1PUwwnITIymN8wYCqAV2ravk7fPmj9wjU+6+bPtq97?=
 =?us-ascii?Q?Zs0KCoz6qUnabLoA9EOviIyGYW3ilSgXchQW4x0npHOyP6MGNDD93+q995gu?=
 =?us-ascii?Q?nWsSSw9+s1po0VNT4uQ6rv34qvZwH777kaT2Dqcgo3KFuNpLnlV0dqak15ei?=
 =?us-ascii?Q?VPHLdn6e1W+gKAZQSTl3Oa8dhA4JY6VBeB6CrftQRMdQN2eRGuCG5s1k+zm8?=
 =?us-ascii?Q?QLp1765HCyK3BUflEAVg8f4jKeb2eZEo0/MlP3cLHvhxmbwZxAmP0yXXasKF?=
 =?us-ascii?Q?Xd58AgC6rlBO49rQDi4=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.40; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 12:19:08.2655 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4901f47-c8e9-4181-2253-08de0d775f44
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.40];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7851
X-Proofpoint-GUID: beRRZX6WhkeOAst-dQOcXbRuDMHal7XY
X-Proofpoint-ORIG-GUID: beRRZX6WhkeOAst-dQOcXbRuDMHal7XY
X-Authority-Analysis: v=2.4 cv=TtPrRTXh c=1 sm=1 tr=0 ts=68f23440 cx=c_pps
 a=YQ/CR9wnKyXFbnzcPJTpwA==:117 a=HHWmdgNZ66UcX3Fjl3KRHg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=gt-GhcMM7esA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=uSSM2XGA7ffeOgOSMc8A:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA0OCBTYWx0ZWRfXxYdJ+i8xE2Tk
 rlzHhaGCjaPkzI4efDrETnbPUQouajAF8VydWddbVzjFrWrmOokpPx3hFnF/TKRUxMLliklmj/6
 5CwM8niP/9JL1n2BtZuS0eiPStyTXsMr7AkzSnqGnH/c8/OINWsZ9qNgvDlEfwboAvbAVjgXhMq
 1jPkDJbVM7GVrjMdUg53ENz5zEUDn5kP1JpKIB9E2+klEXdEc4tsERyVNt0UwtEcb4NVKCSX7kz
 h9wAhK5Wa6PcPsPfO42PIqo7yI0TxAYzf6aS5qmI7Z27gd2/EdGTJnC66pzvtcnq2wqxZHypJfF
 99NsShcNlE9pb9yXl5wNtJjW0XB4yQ6Gu7dvwuByf2/Rf1uKD2gllo9gr8u3XnECMx02/lFcuGo
 aqVJTaVGzkwynZPLQX25RvMasmFwhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510130048
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 5/5] stm32mp: Add stm32mp23 support for syscon
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Add "st,stm32mp23-syscfg" compatible.

Fixes: fdd30ee308a2 ("ARM: stm32mp: Add STM32MP23 support")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

 arch/arm/mach-stm32mp/syscon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-stm32mp/syscon.c b/arch/arm/mach-stm32mp/syscon.c
index 8bcbd979340..b00897e87ec 100644
--- a/arch/arm/mach-stm32mp/syscon.c
+++ b/arch/arm/mach-stm32mp/syscon.c
@@ -10,6 +10,7 @@
 
 static const struct udevice_id stm32mp_syscon_ids[] = {
 	{ .compatible = "st,stm32mp157-syscfg", .data = STM32MP_SYSCON_SYSCFG },
+	{ .compatible = "st,stm32mp23-syscfg", .data = STM32MP_SYSCON_SYSCFG},
 	{ .compatible = "st,stm32mp25-syscfg", .data = STM32MP_SYSCON_SYSCFG},
 	{ }
 };
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
