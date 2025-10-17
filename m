Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D67CBE93C2
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Oct 2025 16:38:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1484C597BA;
	Fri, 17 Oct 2025 14:38:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED534C597B1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 14:38:18 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HC7rDv016470;
 Fri, 17 Oct 2025 16:38:08 +0200
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012036.outbound.protection.outlook.com [52.101.66.36])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49u0ap6pbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 16:38:08 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssttIEUZRZi069K95EqwELw3LMVGO7vzth9i1TpUJIh246IrW9qKx2OGihFOsktARy0klB5H72tOCBq1ijP+kOuSVQl4NgZh/g8mQki82iXRuU+axFkG4wau/Ns63NeFhIzI3omwHwSubSJkprA5rsB6z+1t+F52t+14LQc9hCoDtJc76bGiMPvCo7UGKGNZIrIeNXODPzsmAVuFo9k5hvX3SVhak/ZliyO1JuPULz918NSyHcTqgkgCoKTkU68UfVrukEB3ZCyPHIUuTHUR8iox4brof8BkB7tJAk/H7g2R5ppB+NiZkRjIJH8ibj7mCFAraQLrOWRm3V0aV/Lqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1Qzx/xy8XaP4ZCKPvjOF4z9CaovdSfiJJGE/iYQeAg=;
 b=T0K6FDZ1i7OT/eiyISqSOlRtJZjDesCIILQEBcKd6WOpIbP3jTOKCic/MT1GIWAHrsNsnhOEqZLwjzoprRJ8oM05RlRtNLIMV5LbfgSQlGuZRJc6OnLiNgrgxxrKAVZH4btgKJkfHTH39HYu42laW/wiihLQyiSlf4xr+VkpOXkxhixjTgu0mHxGkFdgpqtUTPVT83/d906D/haPNoJo4uN40VN/L3UzPXqmwijX1LyP9Obn1P9PCczSXEU0ywuaw9KlQv1mRWgGBxXysjzFcsSOUcblhsFA0Fj88a7LsestpRVgN7T0q6yIWEH3ze81rhUl5af0QxD72Bk7uEVcBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.40) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1Qzx/xy8XaP4ZCKPvjOF4z9CaovdSfiJJGE/iYQeAg=;
 b=jY5D9twmwHB3unFthYR7mrqQ4XBveDH6IpW8bTerkXxO997hPaA2cGnEPVqPn8OSEwcyNBhyzMLk8j4teJ6H9Ja4Lz+OqipjBNprTXAgemrD5UmmzD3nn0XmzqhIViwU4ply3AydzLn3ObGxK2y9j6ODttMUXf7KeHM38EOS5arsIhRM+5KXHK443AH40/vgHPJaT9SP2IgfM5qlNcdEP8C85Wp3uhV+qh+kD2JgIhFwsutqCNhVxAlYZyl3ZcOhlVTrS5Kff0GFHo9mwdiJcbTZiO4cyv+nIMgSQdCkub8enhRJpPLG2jjhfL2R7YisO6Swg7CM/vmwtZTq2n/iuQ==
Received: from DUZPR01CA0298.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::15) by AM0PR10MB3601.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:158::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Fri, 17 Oct
 2025 14:38:07 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::4f) by DUZPR01CA0298.outlook.office365.com
 (2603:10a6:10:4b7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 14:38:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.40)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.40 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.40; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.40) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 14:38:06 +0000
Received: from EQNDAG1NODE4.st.com (10.75.129.133) by smtpO365.st.com
 (10.250.44.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 16:38:13 +0200
Received: from localhost (10.252.15.38) by EQNDAG1NODE4.st.com (10.75.129.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 16:38:03 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 17 Oct 2025 16:37:48 +0200
Message-ID: <20251017143757.202571-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017143757.202571-1-patrice.chotard@foss.st.com>
References: <20251017143757.202571-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.15.38]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008860:EE_|AM0PR10MB3601:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b432785-3e02-4e00-942b-08de0d8ac968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LxBiia6uzJcYBDMyBMe9La3HEXaE+ujEUChSsmtX8sbY7KmkMuJBFhaZEYm2?=
 =?us-ascii?Q?Zm7CkPR8nymHrqO/oXRL8BOtnzWZAik3AkO2uFbTGL0UJwgTwbGbvMZ2vWf/?=
 =?us-ascii?Q?bWXBTFNBVgK/MUip7nP3/o5mp8OSFSgiDHKKygttGLOqHu1fJ/aGZCEkhMyW?=
 =?us-ascii?Q?gSpu8tfvvliSmMG/5dceH4w58P9eQQRVaNNwXHKRVfiOqCJ6gNlFfFJwW79G?=
 =?us-ascii?Q?vvIY1tEexu/lX136NAXWpAn2GyQbC8Znp2U6qtwtoBk7iIBvlPI8WLUiaVu2?=
 =?us-ascii?Q?QjOF6Wj4Ml2ULLpwnyPfm1fMmPxYvVpY32gj3FdJZePSObGxLg9bQS0K7FEA?=
 =?us-ascii?Q?U0QMV9sYq200t0nIKRxbNts/aZuyI5yOQRECp8lKNFvq6tUHwAhchKumVyTA?=
 =?us-ascii?Q?9GCNgOQWoVJ7/dnKic501QVE+BImfkxGL8nKH61MtDHpeOiIOJu7v2P0SNK7?=
 =?us-ascii?Q?k3rvjKbL/Paemi1TfeYaPtT60yY4j7BNKaGQUQ0ZpX0Cx/1kt08ruVGBt5ul?=
 =?us-ascii?Q?9XA9HBaeu8rqQSef5VP1BOgeCM48AGeiO8GX2/5nwelKgvhHsYyEQ6P8ERBj?=
 =?us-ascii?Q?fX4CG1pAG3EskiR2sPVO737aYud0vSHfLw6lQNOT5ARk1/txcYbc5b5aDrNy?=
 =?us-ascii?Q?eh+PP49vJ1ej8En3FP+PJAm+mfR90mXaKaei1MuGtbxGHnf/riGwYCsfe1Yb?=
 =?us-ascii?Q?fuNG9/TlbwXtu/yTRczEFd/JruF3BgKi+7SwFVjhJblYbHh683UMEw2ZMijU?=
 =?us-ascii?Q?qkDQ0bhtYf1Id0Puq+aXlFxKXC2Sx5mAosezMBkgkRdzpu+FE4Xi0qPRCjGj?=
 =?us-ascii?Q?4lXE+5zYNYX4/+v2Jbpj1j+TXOVQAtBE9iQipSejHEbNai3gdlp93rZrwJ3b?=
 =?us-ascii?Q?WtUz9pP8OCfx4k/vX2baAFf7bRuJD3aWXEIyeP3QcBMGDOmf7XF0EwcF6Skz?=
 =?us-ascii?Q?jZSCrhDEgCRnCq2NWoX4orkDLB8GMh06416WzJKxo72auuufyhenvZGwDZGJ?=
 =?us-ascii?Q?RWMIrlsy/IZR5oUuXTYi6e+U0YGJDaPJBNlEG2KvfDCbySwZ02YbsVhf93xP?=
 =?us-ascii?Q?dCBfwo1yZ2Aw+RgBKWYewS10aLeOlEZNQdudePQ7R6vN0/Y7KT5oblwjJwA3?=
 =?us-ascii?Q?I9OQBxcpA6Cy4H7WXc0EK8+3KhfKp6YbYon6iHqynNnR4Pcc8MmhDXbL+zWC?=
 =?us-ascii?Q?SuG3SIJQz/l2U2N+HkJAD54+YZFA4Po2B2RafhMGHlf/X8oJreA9ur8aLm7d?=
 =?us-ascii?Q?hKHQuZgU5E8jNQC3ppanbWtOu6/nMLESSN5hIcLvGrl5/Yn1k1fGJ/be2vsW?=
 =?us-ascii?Q?rf+RCTEI2JXwnV1bYfAymmcjHD2KUTWM0EvxhcO8aPWxnclQu66tc4U+dflc?=
 =?us-ascii?Q?qFO4FTrbby5CvruzD++sS5OtHWZvwgKHbzUjNj0WqFR7sWuna6GIybELmdT6?=
 =?us-ascii?Q?TubssAKlva+aVVP7JXlIvq90U12v7yYBk1WZL5oWD3J8602RiGDaqIWOcQjZ?=
 =?us-ascii?Q?4DFfGnkkH5QGBViENd8fod1FqawRxyIwjRnZ0RgbtsmxI4N7cp0ncH2OOw0e?=
 =?us-ascii?Q?Ng85IR8Tkyc7dJrtcZk=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.40; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 14:38:06.7829 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b432785-3e02-4e00-942b-08de0d8ac968
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.40];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3601
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA5MCBTYWx0ZWRfX1M6gbzn4rJUD
 KsaG/cHYScwGpdif6yjEavrwDNcuInnh8NZ42XQM/82+kFYiZLFzZ+PYrqiFEWS0L4xG5JZzmfr
 61zHqv86rXCOlykBCMlbUYCNjZTrZj9ZWE7Sk+IcMT7xVJZ7WLyNKpJ50ywbOlCdzo+pauBSwXn
 WOPbLQ5e2fDrTBLNChxA79mhSoNJFOcLiq1nzRUQKj+p/l2JN1BKQgac/QKaBVJbZSGsmwaZ3hi
 s5DbAHb+IIWnSEyPTg/Mi84RuBGw2mhH5tsjDNn7oSZr3glnOOSJR+DAMkbrcEaj9lerq0WgItW
 nMSwgFfRJqGx/qnbgQuhOtsnHkCpSzxHq8QVwkCRJ4Giv1ToRcyL8K13hu3rVIhhBGG7oMm8+Sa
 aQATpVYHJdjyN4xfC5HNj6cNnmFMGg==
X-Proofpoint-ORIG-GUID: -XN9fFWiRYowbPN1eExN1zbRDh4SjnHT
X-Proofpoint-GUID: -XN9fFWiRYowbPN1eExN1zbRDh4SjnHT
X-Authority-Analysis: v=2.4 cv=eoPSD4pX c=1 sm=1 tr=0 ts=68f254d0 cx=c_pps
 a=DLPEDpPie7O+kleDMbMdfw==:117 a=HHWmdgNZ66UcX3Fjl3KRHg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=gt-GhcMM7esA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=SxxZRTMbgU000sIlMgoA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160090
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 4/5] configs: stm32mp2: Enable LED_BOOT for
	stm32mp25_defconfig
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

Enable LED_BOOT to use led_boot_on/off() API in board file.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32mp25_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index a5ee02a09b4..7c3b46fcf94 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -61,6 +61,7 @@ CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
+CONFIG_LED_BOOT=y
 CONFIG_LED_GPIO=y
 CONFIG_STM32_OMM=y
 CONFIG_SUPPORT_EMMC_BOOT=y
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
