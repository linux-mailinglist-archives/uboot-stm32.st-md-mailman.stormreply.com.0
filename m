Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EF2D384FB
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jan 2026 19:57:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94B87C8F290;
	Fri, 16 Jan 2026 18:57:54 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013042.outbound.protection.outlook.com [52.101.72.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B01A9C5A4C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jan 2026 18:57:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikvv7Di8SzWu6vv8GXcydJCJt6in6s7jXwugDCwlK2clDJehhyATrs9hbj2z0kivpNuHdU/nu4Ys7Gsc3ev1mdFZhZDbszCNk5GdDnqoG7CjkCsqoaZsfm66g0M86pT/VLDl1pQ88eSeSmjPE3ELtxEsiUu4ijNScwWVoobAUxZFCKL55zXV66sukFncTlg62Gf2XnBzoPkMsDXtkg62VY1jf50qqAoTCrf1eueIzdULJO0QlZSTDjfyeylhjtnDM18T+piUVjf01si9U0r5ioENlt51OpJ0KQ/AEE5u7/GybNTnqoi69BPn8dbUplajBeMpNhofsDE0KHjQyYhCtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/JYoGQb3y/IYJDGSjCL3UrueO+FaAGnxukATJfJ9Gc=;
 b=QPfi/v75UfSCr7iMzVXWjU1wr+I5PwiF76jEEx1q1KNmRAXxm1etOza49jUh2SlLmowsnhF3IyrCHw510f62D9l3BpWNXhpn5fKNtnRls9kkd5/hDwbTRKkH/o6i5kCVWFsIro0A8D9BMEOErTFDn/jf193QWzyxucWd5/k2WK7tb4arA/1fGwPZZ1T2hvGq1Gz4hBpmWCglHCW5fLSko+BXvWYe86t1ayhUEPhtg1LK+LT370kT2zemUoaQfP2Lr9WzA72tS05ry8eGGUIQ/m8cF0qDDKUVVkNAkrSOvTOu+Vk85UZjmVUfo42nu7XmU17d9b88aM7VQu8t4uetlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=denx.de smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/JYoGQb3y/IYJDGSjCL3UrueO+FaAGnxukATJfJ9Gc=;
 b=GpG4jEsLFpV5lt7id+itAPRydLFtIe3nrPTIPkDeFajqj8o8RSPduA065SSFlzKnOigkc2JzCB+N8b/xhRCDLh6AGFEe9CKYteX0CEDyMzqB+LjMIXlvYOSh0YLLIr254mxQC69xifUn5lcIPPBmxp+MnJF3L/eiWqxqe1RVTTkkegCLXOzOVAntXXY6VUdFOYobTpUeIEJQ1RE8LG+tyNc/FYm+53zKFfPSSpsncE19l5lltrMCgQV7LFb3bO7lzsBysE4nZ7tC3xjs2ciVjBgp6vZn1mTs018rPZCt9WdIaj8Tr02hui07x9j3Puep97VWSJpB5LJ21lnlskFMCw==
Received: from DU2PR04CA0249.eurprd04.prod.outlook.com (2603:10a6:10:28e::14)
 by GV1PR10MB5794.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:61::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 18:57:50 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::f3) by DU2PR04CA0249.outlook.office365.com
 (2603:10a6:10:28e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 18:57:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 18:57:49 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 16 Jan
 2026 19:59:05 +0100
Received: from localhost (10.252.20.137) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 16 Jan
 2026 19:57:31 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 16 Jan 2026 19:57:26 +0100
MIME-Version: 1.0
Message-ID: <20260116-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v4-2-d7cf17cd678c@foss.st.com>
References: <20260116-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v4-0-d7cf17cd678c@foss.st.com>
In-Reply-To: <20260116-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v4-0-d7cf17cd678c@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>, "Peng
 Fan" <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.20.137]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|GV1PR10MB5794:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8945a9-4fde-4bfa-0670-08de55312520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmhTcUhobGluc1V3d3IzK2RMdncvSEg5SnNPQy84SmJueDNWWDZ2c3pUVjFF?=
 =?utf-8?B?OUhwK2lzdGpkWUdyV2JkcU9PcE5VOGxjbnNqRFZ2TU5wcm01WExSRlNJSHJl?=
 =?utf-8?B?VUdTQTI5dHd3RW9mcXk4ZUVubWM0RFlmeERTMUtYZmJjeGtpOXc1UlhBUjZD?=
 =?utf-8?B?UmUySC92U3Bxa2R4S0V4eFRuN0NhZVVCOXlOSWZLMldWTWwvM2dYTWhLRk52?=
 =?utf-8?B?Yzlzdnh0a3NaQkVMU3VFSzJUZDI4di9zTXk4QzN2cFJBUjNMU1h4UFRldGNi?=
 =?utf-8?B?RVNaN2RiM1ZYMTR5VSsvRTdzTk9jUDZQaFowblVlWTdrRmJ6ODJNeVMra2dT?=
 =?utf-8?B?b2laVjVsRFVtL21oYmE0Vy85bUN2WERDMlNLdFd2TzhmOElEM2FIUGc1RE9I?=
 =?utf-8?B?cE1QRzRvQjVPQjlYSlNnR3dMYitwVEJBU3VlMGxRQjZBcmIvMTFUOUE2UU5w?=
 =?utf-8?B?TGxTNnFYR2tsRkpZeWFjaDVXT25zODNtUlhWZUFSeVd0RXNYSTdraHBUS0Ns?=
 =?utf-8?B?QWtsbkRVbUlhWk1Xb2plck9kcWZhUDdVVVJnd2Qwa09uZWFsZlhrRWt4QlVX?=
 =?utf-8?B?YUtCMCs5b3NYMmtLUTJrS2NRYjM1S2lSdU9HWEJrZkl2ZkNDdWJmNHVDRTBJ?=
 =?utf-8?B?NHExbWJValZ3VHFzdTRNbTlkTXE1SFpveHcrUlZlZVJZaFBNV1YvcGh6d3FC?=
 =?utf-8?B?cEFPUmpjRkdQai9yNU1lN0l0Q3N4eG5BRjRBUHMvNU1rOG93ekpGMTRNWnhi?=
 =?utf-8?B?T09pdkcwTEZEamtQWFFWU2pzb1ZFYWdmUWFTK1lsU2htMzBxOVBPNFUwaFRF?=
 =?utf-8?B?aHVEZWNhVWpvTE12b2NmeXduWitINnlucy9ROVBxQXVwRGpxaVBjQVNRZ25m?=
 =?utf-8?B?UUg5Y2MwQTJRVkt3NzM3RjBDaW5kY3k5UURSdzMzVlpneDdTbFN0ekdHVFJi?=
 =?utf-8?B?Ym5jWkMvZDNKbHRtSmtpdFE1cGt2UUVaSGMxWm44SFBQR2hWbFplTUxhYU00?=
 =?utf-8?B?NzB4Ym8rU3BhSmJlL01KMEt4RmVCcUE0SnhqYTlRcVRzd1R6dExHZm5wU0Iz?=
 =?utf-8?B?cStZbWl5T01jWk5la2Z4THlHRmZIaWd3eEQ4dWcxMTVzOUFTM1FPNnc5L1l5?=
 =?utf-8?B?OWtOYUJLcE80S1Jqc3BuVlF0QUVuWWZIWlNOUUp0cm8vRjAyalE5TDBMQTBr?=
 =?utf-8?B?NWV2d1J4UjdIcG12MkN3ZGptYk4zdlV0Z243b3VnSTcvWm11NHBCWEo0U1RY?=
 =?utf-8?B?MERpN3B5TCt4a2dja3FtamtyM3NleVRPblYzckwrVFcwallzcHZTV1JmeGdp?=
 =?utf-8?B?RmxmNC9TMFkvdmRQckVZT3FpL2NYTDlhWXlac0ZqQkk0L1hPbTNIazZOZ2Jl?=
 =?utf-8?B?OFpEblRnWUUxUmY5VGNsRkZIbzhoeHlxYVkxU3Q1L0V0Y3g1YjBTSi9ycGtj?=
 =?utf-8?B?dkZ6dFE1YUZPTktYcUw1SVU2L1dJWXFjTWJOUUN5MUNyanUzZUN5anpvRjkr?=
 =?utf-8?B?UllCdzhaS1F5WG9SSHB4YUlsNHFtNmkwNytzMXhqcEphaWcwK2toK254ZFN3?=
 =?utf-8?B?cnk4clVNc0V0MHpiZ2Q1OVFBMGtETG5FZ3BLNDhwNHJvdkdKOWYrWE5pT0dl?=
 =?utf-8?B?MGt1ak9uK1BwOXVuOWRHamF0WnVNdDAvMkNtWVNJRDVRSUxjQTRsOU9tSTdr?=
 =?utf-8?B?UEkxOVN0MnZjVjdrZzBVZUgxUEtYaWN1U3orbXM0WDRUYWNnWkZ0UWpmWUl3?=
 =?utf-8?B?SjZreVZ1VFBHbG9IdUVZOEsyc2Q2RHRPaEZlY3lQTEhHUW5qTXlaNVcyQ21X?=
 =?utf-8?B?VHBVdFlLSGRaK1YvNmFSMG10N1FXR0NpZWtkeDNjOGFyRTRIZUt6TXZXVjFp?=
 =?utf-8?B?a25NQ1ZmZHN3T3lzY2tXdlV1ZkcvM3lZVktIQTVCM3hUcnZpbGdLQURTMWNV?=
 =?utf-8?B?elV4cXFBdDJDcmZtKzZnYkRCcm9mQmZaNnp4UUZTNVJBdFd4WXVSWHBDVFc1?=
 =?utf-8?B?Wk1Hek1VSCtaeTd4eHh3SFF4VWJ2elA4S3RqTlAvUGI2eWxOaTlEQUo1R093?=
 =?utf-8?B?NnVrbGw5ZHdXVE5xeW9saWpIbzJVWGNEU3hCRTBiTUFIcWkzYVdWWXQ0WDNR?=
 =?utf-8?B?ek81ZjJmak9saDY5dnl4Y0dnZVBOcm5jMFVucmg0VXRJL0RrVHRmYzhHKzVw?=
 =?utf-8?B?S1RyK29xK2sxbTd1dUh3cU5VTmlHOWtWbGNnaVhadVQrSXpFRGlUNHZFMHcw?=
 =?utf-8?B?SnowMnBSSTIrN29NWll0MVJkS1BnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: N03PRvVQs4HiB8cXHF0d3FAV+Nb+kfaBiUCtuF8KdJmTcVY/m9h4MbqJj9E0tnMBIl8ZPMt4HDxMkMOm6tIfFhr0Bf5p+FUTRDwBin6ibaKl5U3WfKFh5n+fpLA+Q/cr2AbIlHmvMzAVBeCf8k3MQWqR+F+d7LQae8cQ1qDd+hDKzlU0XmZoGsZ7BM8ztc2JrFOozXIk/Hxf3rKhQj+tcnuSopyvphyxFTqku3QkU42Wq4PYX4eFp8UjX8e6CpmMupp6lzzVLGU/iJw/R0H6c1/sbT4zFsQdbEOexaN7PXOs9LSMynICF3LnpP3uvAd7N6J9F/6+NeGAzC+hXy3ZK4YbFhACZwLUUoTsoqhrlqL+MnbcZN0ciKRwI/mbwNTaRXqI7aMt9GFWuOEG6yv9L0/Z+cCRb5Il2+KFPu9r8Bt+HYtiIW3T3RfMmB+2yAOaEU7CAmyut3ttYSpVCDSWJ+bhPwg/dF193WOb0m5xwSvqTSxPCYiE0KlT9+CIHPibJI5dCJNxPpyeKsPUQYykM3dasdOFlMfWcTYz+87QnaiOxmqDQPmODqlATtBt+4sT9igTvzI5f60d1gUVOIpSL/17Ctan0lrtaubmG/xUc2KeiGcZFPi8RwRpNVS9h217F57+dqgRq7TPFniQTqdZVI3veQKutMV261ce61OW71OX93m+MkuEcJeizRyQcHcB
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 18:57:49.6692 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8945a9-4fde-4bfa-0670-08de55312520
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5794
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v4 2/3] ARM: dts: stm32: Add SCMI clocks in
 rcc node for stm32mp131.dtsi
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

Add SCMI clocks. These clocks are used as parent clocks and are
referenced by their rcc's node position in clk-stm32mp13.c

Fixes: fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/dts/stm32mp13-u-boot.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
index ad63d5027b2..623c796cc79 100644
--- a/arch/arm/dts/stm32mp13-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
@@ -186,6 +186,33 @@
 };
 
 &rcc {
+	clocks = <&scmi_clk CK_SCMI_HSE>,
+		 <&scmi_clk CK_SCMI_HSI>,
+		 <&scmi_clk CK_SCMI_CSI>,
+		 <&scmi_clk CK_SCMI_LSE>,
+		 <&scmi_clk CK_SCMI_LSI>,
+		 <&scmi_clk CK_SCMI_HSE_DIV2>,
+		 <&scmi_clk CK_SCMI_PLL2_Q>,
+		 <&scmi_clk CK_SCMI_PLL2_R>,
+		 <&scmi_clk CK_SCMI_PLL3_P>,
+		 <&scmi_clk CK_SCMI_PLL3_Q>,
+		 <&scmi_clk CK_SCMI_PLL3_R>,
+		 <&scmi_clk CK_SCMI_PLL4_P>,
+		 <&scmi_clk CK_SCMI_PLL4_Q>,
+		 <&scmi_clk CK_SCMI_PLL4_R>,
+		 <&scmi_clk CK_SCMI_MPU>,
+		 <&scmi_clk CK_SCMI_AXI>,
+		 <&scmi_clk CK_SCMI_MLAHB>,
+		 <&scmi_clk CK_SCMI_CKPER>,
+		 <&scmi_clk CK_SCMI_PCLK1>,
+		 <&scmi_clk CK_SCMI_PCLK2>,
+		 <&scmi_clk CK_SCMI_PCLK3>,
+		 <&scmi_clk CK_SCMI_PCLK4>,
+		 <&scmi_clk CK_SCMI_PCLK5>,
+		 <&scmi_clk CK_SCMI_PCLK6>,
+		 <&scmi_clk CK_SCMI_CKTIMG1>,
+		 <&scmi_clk CK_SCMI_CKTIMG2>,
+		 <&scmi_clk CK_SCMI_CKTIMG3>;
 	bootph-all;
 };
 

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
