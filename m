Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D49C5E31F
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1003BC62D20;
	Fri, 14 Nov 2025 16:24:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 934EAC628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:43 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGGK3O2633998; Fri, 14 Nov 2025 17:24:30 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012041.outbound.protection.outlook.com [52.101.66.41])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7k3vyj-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:30 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVwQPPVVmwACp7ftrWDYIMH3PSxIfV367DPmi8Lyv4zi4O6Ph5bmmcHNMq4VonlQ1AdLq3bfUBT/KnH1f3a8wQ6/oLTYZ+bADbYp65B0RLhZXcIP/15zeMZ2VmJ25tATFYY9PQVG/cpc+uPbVw/sh5pjf9evzpImYJJ+igbCKhFr4LsbB3nRQOpp6Pbbp98jVDzrPfxBmq+GUjHhUnUk6Z6XlGtsbjkfeTKI8ryvvkFpPORNCUKghVF6hGSBspLFUtJMhpfLs/omRDqP7JkCkhXJWpJGyTPfNr1M2AmlKG+2f7j+oaT1jdL6QHHc8LalLv0Z3VkJwQIQ+MmKcg8Caw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bE1qMQS3YH27NKFOeilmC5MlQqju5jzPn2/gzaytPk8=;
 b=JCt9wl5/se8Zr246SbpcsSTfyFEVYDQcTlfNHDZrtWuZexpTnLFxTah/6rKFqiaVpl9i2GmfYKnBLTMl8+Ztu/D4WwfHqXTfpOV/j61RNIgJGQ/BekxJ1t9X9GkYtDW8REzKArUCYXBcm2/SHAlBtFL6P2gajoEK6PbEiYNSo7/RcquTidLcCDaVGXH+A7WE7y2g8sd0RkzR8I2rRkm8isQCHeDvsMNrAjOL8u23hMitm40jCxqKnp1KI09wThNlupkUsrBDchuSVPrCIIclCVaIuv36lTxHa0f3rgQyU2XQQ+GtT5kDn4Oa5CjXQBr1D1mMWno6+UQ+a40MBI91lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bE1qMQS3YH27NKFOeilmC5MlQqju5jzPn2/gzaytPk8=;
 b=a1jTbuR6+7jeN4+blUJc8/aLJeq4Rh4aaBzQfWY1JceU/ch0SRgJ2VO605utnmoC7zTrpK2vv8jowoVFvw5IO6uFRSuujFyN08rMTnfb9vbpaNF+3mfzJf3DIHdcNN6Z18B5xD2tnMSN90vjDtGp3cP/addEGNyid9eGBZ9ilKrrh6f0hHadZ8qiquYwLZ7loBT+oyc1mD6HhXNjeUlZL1ztoNycnUjc/AWL4qD7Od26W6/6EzfbqFslfVbjTBQNmuElbjElW1fJTEyCLlXvACaR3kyrPTpLXDUu6NyuMkqA8S9kQOFuY/3wc2OV6oLDYL/j4JtKkr1YY9SU5D2a8w==
Received: from AM0PR02CA0127.eurprd02.prod.outlook.com (2603:10a6:20b:28c::24)
 by AS8PR10MB5949.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:528::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 14 Nov
 2025 16:24:29 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::9c) by AM0PR02CA0127.outlook.office365.com
 (2603:10a6:20b:28c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:24:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:29 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:40 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:28 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:43 +0100
Message-ID: <20251114162417.4054006-10-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000043:EE_|AS8PR10MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: cac94ae7-6947-4881-215a-08de239a4916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jslsnjzbkJwFvUVy1Adqn5mhCwMl7KpF9SnbvSdV4uXZDV7ukLWRbkzT8eVQ?=
 =?us-ascii?Q?a6dVOPU+TTCLZfqzwujk+a4wjoqfKpBqS6hP4Jel9sO+AtKWCHcuQPu+l2YD?=
 =?us-ascii?Q?ZC4R6IoHTfwBHNIoJyVDRCS8KV3Rp1EZd58bqoajd3J83ukJWv5FE69muzsX?=
 =?us-ascii?Q?ZRVkxe4MCSL1DdCkWPgy2TZG/7kLA7ShTPVAdZMMqeCtOd5h6P+QcuV+DRDi?=
 =?us-ascii?Q?7/H7Dkaf1K6ExjrH+2SoiP8E2hUmcBppxC96oBBhS0lLVK2fGc3DVo4L1u8V?=
 =?us-ascii?Q?Kvp3he6jObo1MJKNCRGyttwSrL9LFCWAsPcRx4rprvrA+EqPg38uYFNhSRQv?=
 =?us-ascii?Q?cVblsvxkcYfylB3d3ghMNoLO4TWCDtgPaCG0WuCyOlSIgcmg2oO0ik9DriQf?=
 =?us-ascii?Q?VYI8GoYJxVIV3Mk65FdK/WgFrn+cy4ZY6rctxo7UAT6y2AgPXu8Jx+CRyI97?=
 =?us-ascii?Q?4T+46nvEg3c0ofCyvh9BeAu2FNJcNCAiUTtIWB0yjZYNKuKUcsYHxKIKggH5?=
 =?us-ascii?Q?LTdxb7KOhEJsdFoSYHoA+4tK0smub3PcvHdzf0yIt1LvvMgX31206251qMO2?=
 =?us-ascii?Q?GoC5Z1tt65Xnfx6K9djDnhS4bpPSuVwH1SdTCG3nbiuuUVS6YyPP/csCOj2e?=
 =?us-ascii?Q?NJwjjbaa8GsJVOBXxU+36qak2RTZ44VM8WqtoNJAz03h+My8qsDMw87NhoJp?=
 =?us-ascii?Q?IkcbgD/DMOSDWmIfvGo6DIvYZ2mphRb5Flt62qlCjB/MkGwSEQW2MVUu3zIt?=
 =?us-ascii?Q?nAr/40EqWZbwM/ykEPvu4+e7Y5zs3KVqk2vgLqnGHPDwYvNjJHU2p5Z9aB+s?=
 =?us-ascii?Q?woyzniMyl+6YDc1zbfCFz6CKa8PwpJRkAocsTawJwxF9RRkVA84EaL/MCznT?=
 =?us-ascii?Q?TnBdDvaeLFBAVfjesvZDbIUou55BymYv4KJdp2hZisRmyTLXg+x7mXOf9LrA?=
 =?us-ascii?Q?LmdgORZkg9uPV70i4OCheiL6z1ZukUhbDCeBfgLXhC8ymnOKX96lS4L9Llme?=
 =?us-ascii?Q?PEGosjTmCjeZ/5fRJWkEAGVX/YhOQ36E0WBFbvDVV7UN7tZeSmaoMB9DNv8u?=
 =?us-ascii?Q?A3TRD2qXF5JIxer+hzTYOgIB5eQOoztWO2IYiNPmVpwE1mdTO5Zt7R6gnkq8?=
 =?us-ascii?Q?7yQ9iiCGOOJtJCsUmMYu1brC/sQQJaBFKX7VSXICjtK1u6W/tZKwzDDlyEzK?=
 =?us-ascii?Q?lNbE9H2bMTqkDPTaTpVNxp/XJ7FWA7IwBk3WE+KeRNoRMgj0M25KRnVzehlG?=
 =?us-ascii?Q?ottR0MD6dlXrYp9EiGXuvT/FuAtxX/OyRE1uyppFPu9nr5YmoRcH5pEfbSmN?=
 =?us-ascii?Q?G8Dvbd7EdUiTiri/WbBW1c0xZDL2tsd5nLggS2Bar14LHcfpzxPisTfBdu4u?=
 =?us-ascii?Q?BDgfetHUt7qy6LbQwWDpiS/vsbtHBMLXU/s0vDU8jANWwdtip10RBYcc9eJJ?=
 =?us-ascii?Q?Ng9tcUbtKfM9t7hAmTM5Ix+P04GNqYeJkYm8BpRt3BCZrwpITIEeWiPTn862?=
 =?us-ascii?Q?up4FxJ8BlqS+AMB/EFGNP9RGu0AlDKV+2+8rk4sWoStey1B3m5nQaPvp42QO?=
 =?us-ascii?Q?1ob+jBQ01T1MNe28WEM=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:29.0574 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cac94ae7-6947-4881-215a-08de239a4916
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5949
X-Authority-Analysis: v=2.4 cv=KoBAGGWN c=1 sm=1 tr=0 ts=691757be cx=c_pps
 a=GxenEFv9DmgebrKzBBA+LA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=8hQu2dKi1ahytCdZBwUA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfX+XK2fbKsYuI7
 wTcZM9OG37XwCEeqdlKDCgps69THLWuTfWWtEiXT4q4EncVfv2xJNn7mhJ8inBFIY50c1InntBq
 FMdn6h6GwAJxAJQsNQwMjTPoHjmu2si2ScgEm4plQASiMjSXW/ejF0XmxgOGIigM7A+D6nQ0ZjI
 cIzjU9Pw17HNmVstiYZhf3NGq0N9y4vXFsKab4Oom5U80FCIUJ2P0JM+QeLYn4JpV9H7A85AiS9
 u7qEQHoATYosHHt7gmbvPCOyIALVeHVkE7zTOq2FeATRkCNDddaDLU613GnpcB9LRNvGcXtS1se
 zpgZ3c3YLGTbl0VmotUG3mMuBBC3ppg+KsmxUMLwp4hrgKSX3BkvB2JfJ5XjdPcv2wA48qFw9u2
 EYJcadksvEO+iSrVlV89QmDsEDiyWg==
X-Proofpoint-ORIG-GUID: HWYSam_BkQRT7dVw8Wf8hjIaMkwS3cib
X-Proofpoint-GUID: HWYSam_BkQRT7dVw8Wf8hjIaMkwS3cib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Peng Fan <peng.fan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Subject: [Uboot-stm32] [PATCH 09/23] configs: stm32: Enable LED config flags
	for stm32h743-eval
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

 configs/stm32h743-eval_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32h743-eval_defconfig b/configs/stm32h743-eval_defconfig
index 3ee8d082da8..5384592b1fd 100644
--- a/configs/stm32h743-eval_defconfig
+++ b/configs/stm32h743-eval_defconfig
@@ -32,5 +32,8 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_OF_CONTROL=y
 CONFIG_ENV_RELOC_GD_ENV_ADDR=y
 CONFIG_NO_NET=y
+CONFIG_LED=y
+CONFIG_LED_BOOT=y
+CONFIG_LED_GPIO=y
 CONFIG_STM32_SDMMC2=y
 # CONFIG_PINCTRL_FULL is not set
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
