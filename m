Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF64C5E315
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E283EC628DB;
	Fri, 14 Nov 2025 16:24:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5533CC628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGEjC82686620; Fri, 14 Nov 2025 17:24:33 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013018.outbound.protection.outlook.com
 [52.101.83.18])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7m3rn5-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:33 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwrpL1u1V/SiefDGjfpO2Y3HkY6EHWQiiLu+ZoeMCd9EDT/wjoWRClj9f7mcdOd7g+9cDpG9//htrE4SgO9of/hzmpxwDnfwGy3tJrGDwKFhORPZmYzSKH27sdz54uFHjwIDaiW4hwSGuKcpCIuNuN3X364n4rjZonyd7aEadwlTufKd+x28hHkC9HEx7Ya5zh3K2T3BQkW0MyjOkSJ+7eWdiMiXZmOqMZTRVCvXdxOCJQ6hVzclNhItSg2dV1I2jW7rt7IOVhEPgtLZr3xOYRLJrhOKTRtt3DjVkRVO91kFlEicQjzR6Iy6NJqwS1U51NMfvRYUxaFR2quk524TOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eD0Cw7oqjBPgQaFrhRi0IOXFv84oqRu2Og4ghSzHLYk=;
 b=mNpTw567DXPyRoMzmCZ0t8f1MsQTUrBOOpQwa7koW7GGppcNpi1ohnHUhlCQhSoGqMgAt7PQAgNH5AqLg7/AM499hHH0o4L0wVm+4c8IWpw2r33AvMx50G8Ua1rGhfQNhpT7N2ti6W4s71A+AhaOW7ETyPrXg3iKZlFJ1y6ZpfafGhzvjUzB1AJ6fg/kzwNpbY7RxQYrHxWLMrb5R1yp0vu7LM3cB4ubItJlDoiT737J7S6WqEg/fm7sOH0QXdkoRP+qEJ5N6+cOOJpWvRihyNH4wnPmrgV6gCrm2xfpFw3STC2MTquVmWE1CdKZmN55uFEtPUTf19XxLEPts1tM1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eD0Cw7oqjBPgQaFrhRi0IOXFv84oqRu2Og4ghSzHLYk=;
 b=fMJa3CRz4Gj+abgWxbjYRUw6TLPWmWwLitdTU9IPfmaTG+HTQvcVT7czSPlWrP2YwN1XitF85Hk0FXdKU0ft2yb9SkmNAKe7NbJ+7Po0A2hHH7VMcdf49L1Rdo+8I+7v/zlFIzeOnWIAN8v37PboswKNx1UZBnH9kX5NeOEVhQmjT+2Azuj0k9T3mbkhDNofYiWOfTO2BlPe3nT8Q2v4C8hyGcsX87zPKBNJxRUlCpzjjpUuxksxZrv7IZhXTF9l8xAGGhXDdQzfD4/RQX20BIRW+bZ6ap9p/2x+dhf0pHS1wEnetH9/cQlzpALf7hdi/jFKSPTg78C9rDFn6P33LA==
Received: from DU2PR04CA0089.eurprd04.prod.outlook.com (2603:10a6:10:232::34)
 by VI1PR10MB3230.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:136::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:24:27 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::f6) by DU2PR04CA0089.outlook.office365.com
 (2603:10a6:10:232::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Fri,
 14 Nov 2025 16:24:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:27 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:37 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:26 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:41 +0100
Message-ID: <20251114162417.4054006-8-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8C:EE_|VI1PR10MB3230:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d31d4bc-0891-4be5-9d09-08de239a47f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DQCB2NbarhZwODI93iZOGjRe7a1oAB1Im8LOIw3h7Z5B0lfr2VyJAbvpTk/V?=
 =?us-ascii?Q?wwjfgofGnPz6qtgIpL6eQhPZJJ44XGLK3LNRWC7ElBIry9cDuwdTGDrm9G67?=
 =?us-ascii?Q?bdeQlmgCh9hKvSV9o2j6bTKn/KV/UNHEAcRznyo21qWQSv4nvP753FU0/C3D?=
 =?us-ascii?Q?DViDYX+re4EC1wBk8vY6TC57/MYm4wcQZPIsWzrbsZ9ybxNCLRQ91yAlD1Np?=
 =?us-ascii?Q?AN2APeYmfl0hV7qoCfmVG5ShO0PrFRynJB+48BLQHLLq17ThOiTvWa/qHxac?=
 =?us-ascii?Q?h6pqjuGSlp7FptugI6kKkHA49pHmNN+h+tKcIhnSFsLPweRNIPnml41a2Ru1?=
 =?us-ascii?Q?ysxPDLqxwf8h0FMU9qlykuvc9SY6N0R55d/c9ofmERct8mrz3jmvkkCvY7gf?=
 =?us-ascii?Q?c02NW2paNZYT3yOLtDk5GOAgXuQ/nxeYTRylblnKg8l6hugFeqbpRSURXK+S?=
 =?us-ascii?Q?RaZ/MhLQEwgD89FHuMzjGIgaeqLUHAxCxEDOag41V3IQnHrk38xKK/LLIdEy?=
 =?us-ascii?Q?Uoujg4h7bKeP6xsqXBSnxXWD7yI2k6iD7MCkWjvUhFgLj699rnJbt1v52UYu?=
 =?us-ascii?Q?If6FWsAGVNC6TLgkJnNSu6mx5v1wpST86ELk91Mr3DE162oLiKlv57XNYkPf?=
 =?us-ascii?Q?GfhkvfzgFF28e7nT2PHGs0C6Yl/t3+BUu8oeGZlELjfwetzVmD1lVQB4xhSn?=
 =?us-ascii?Q?uUGCmSvDCppCW+VrmIdCkVf35Mv3hehlSDvdqdEGFOafGtYuEiiu5Ewvl6cY?=
 =?us-ascii?Q?AA21cyvO++wuGopUIMNbMpa5FgUtA0XpGL64SscAiA9/13mysXapyuz5OX4l?=
 =?us-ascii?Q?6FXPr+k9ndyAbXzs9Pf3NVFt2SBxVogf0wlUeiYS1jziu2YG/nrBOYk7/35B?=
 =?us-ascii?Q?cnXJSsOBi8ezB23goQvZ27l9sH7zJlD7K5Y2YTUOFGIZ8yeqIlyncIAcX0BB?=
 =?us-ascii?Q?6fp9OhD7Fq2pViAsGrGzLhi1IZ3VLR9qotQv3+oYy33u8wM2fL8zPhYO8WhX?=
 =?us-ascii?Q?nRvL+ax4r3SnFFIhXmlOL3Y8kB9SK1IgL7vQKgRbDjeq7K6ttkxFcBBEoGnc?=
 =?us-ascii?Q?fSs8uK2hqeXNU95gXyVsFH2Wm6RWRs1DIyJpydz0dwRGY9E3allZ0SKbK9x+?=
 =?us-ascii?Q?D9attG5v/FRXgbjjOia2JfzGrT1ScfODpBMu1kRuHTajT/5f3pvoiwppJxkg?=
 =?us-ascii?Q?CNuiyzcjZumHnPRaXM6FM5f29I9rH7nwFTnAviGHsy7TzYJ5EtZnY1l51Qny?=
 =?us-ascii?Q?DAH9xt4MnPBjcGb31PUMrx7crykTbF6U5af7pIOUKCl2fUVPzQhdC1gMjKGU?=
 =?us-ascii?Q?I6jMLDfaSBW6Ufu4Zb6Xb8nTPiZAeETXdkIgGuPZNnTXca97C2lMcudS1PhY?=
 =?us-ascii?Q?AOLSO8rGBD0wB5QtkY2ruVnd8VhcXzgCm+rKcnYjiduAzwbUR3Dw03Y613zo?=
 =?us-ascii?Q?dBsVr1BkQjkYScDF+qX20lt+uEddKTFD2o7/K/JB1BoHelZNyXGfYv4Oe7mu?=
 =?us-ascii?Q?SHs3Gl76NHzl9XZazx3eCznLL7jUFWPmGkY0668A9MJCncCY6Tum3QLk9RjM?=
 =?us-ascii?Q?o8CjWfpyTpggp942u9E=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:27.1313 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d31d4bc-0891-4be5-9d09-08de239a47f5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3230
X-Authority-Analysis: v=2.4 cv=AZK83nXG c=1 sm=1 tr=0 ts=691757c1 cx=c_pps
 a=WLQhmQFNynyssipmWK3jpQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=w0laviRiYk_44oKw3S0A:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: UFn_yFFghAzhdfZwNlIoTml7VXcWWO7Y
X-Proofpoint-GUID: UFn_yFFghAzhdfZwNlIoTml7VXcWWO7Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfXxmW6Avurtu3X
 bYARhIHXnlv8zSoEwW5czbJYmzm72KHO29mI79khp3jzr9wiaJ4JmGSDFsBNQlENJl6SEMbqbNk
 1PkKvV4kQd0j0y3lI9ZBn/SGYrfjkCzUs9xwu34dNAmBVWFz++9dUKCesViOfwbwkUJ3+UJdqWR
 mAJbFgEFMK4W4/3dEz3Kbzpr5NHncS6uzb8tkO27B1DoP3g5eho5cTXAzbo4Vay18dIJrYkfwGu
 6JaqCmG26g0XO9o/6RfP5rMR0pxlwq5fM8vQIXymEwA181fgv2IPqtz27S2pWIsPsZJ+JPsnQDp
 ps+t8NEvHBwxHSvHA3zENMb9ob7fI7lJsc8W2cXex9kp5QNXidGi+tndt5qffI+dt9z8HFilPiI
 H+UxoOg8HjyVd/p5YANi1aQ/C/yckg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 07/23] configs: stm32: Enable LED config flags
	for stm32f769-disco
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

Enable LED, LED_BOOT and LED_GPIO flags.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32f769-disco_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
index 8cda9e3dff8..5eafb6842e2 100644
--- a/configs/stm32f769-disco_defconfig
+++ b/configs/stm32f769-disco_defconfig
@@ -38,6 +38,9 @@ CONFIG_OF_CONTROL=y
 CONFIG_ENV_RELOC_GD_ENV_ADDR=y
 CONFIG_NETCONSOLE=y
 CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_LED=y
+CONFIG_LED_BOOT=y
+CONFIG_LED_GPIO=y
 CONFIG_ARM_PL180_MMCI=y
 CONFIG_MTD=y
 CONFIG_DM_MTD=y
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
