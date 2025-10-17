Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F35BE93B9
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Oct 2025 16:38:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5966C5978F;
	Fri, 17 Oct 2025 14:38:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DF36C55586
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 14:38:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HDoSW6029992;
 Fri, 17 Oct 2025 16:38:08 +0200
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49qfavpf41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 16:38:08 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LT/AbmhxQ+Dvi4ppnBNvEc+Qjupd3uzVP7JJc6Iee5bIR8K5oPTmfTggUJuhDglr/oCjfTGHphki5RCP5GYnHqkmd5q7GMWHxuU7Wz+lvG7xXolXF4b+kCIZC9toDAAOHPqlN81NbP4flvQtuoa8XpU7gFhz2jWjCZADXk7iivxwGulMudDIQyyBpr9Ekz7m+VLeQ3r/T6LnXD9qamzLNgqZb/vFDmzvrYl/7q9loY9r/4Xp7sMUJcfVlFSdbHxK10QXxvDRAfaxr55SbIWfEE/l/7ftUXnI2RP+sW37u8IJI+4q9lJvkpLeL7FfbZgDaPKZQ4sm85Ms/t2/6rkXag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVTksjewCT3/M57HdDX49Nf7mLKX0tEO7+x4nCP6WB8=;
 b=f2VmUfUMPGTfO4S+B5RlQ6mPyV7OECFJ0M5JgLVpapTZ2Wf01JvrfKibjRUQuBJC7r5rl1j43OP8j/xOZeUklB6wjbsPhmUE7EQWVNQPalfIohOocpC1boMi3PJ1EqZ1FncquCJfxUnmhpV3CNAevQ0PHF/Bpc+bJPbbd35y5E9l5dJhKQJ3RHyfLKehd0tx8/w4z7MiztgJjfwH69xXWbRqhMEn9DVPdCbVhDIDCheSM82rE21/5nGcpwa1N8LcbWufCJOZv71alxETeTpK/gSyEixWLHtGUGHE6tMKu6wV0My+zwJbqLv5vGVPGj250D7Fs7AxTa7bPy8AnNuRbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.40) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVTksjewCT3/M57HdDX49Nf7mLKX0tEO7+x4nCP6WB8=;
 b=F4NiXk1MP9xzJjclCVzqtdCkw8neTSZfwDQnN/GLBQB2gHttpkYiVCdwQfyWUMaH7rKJrNGVkxNPEFG862Y9qbQAI6f5anvN4pgSvlfF+NLGhksn0FMknyDWXPPjuPjw6M5LOA5xna7of+AIO6U7ZaOIVsJIDqnJmEZxTZDlR8rFGG+xBJLVkxp/Ioflmbb+Byw8Kv8gIub08aL9t56JU0082uy3fxeOXuSx4lut/vkVhCyD6RyIvMyRjK1A7COoVFtyHreL4FSU7Jp+Q8r/Yiy2RmBE1wNuIPquUIYq7x2Ce/Isi0zHh9IOMLUEwh5ajw/epUMNkljxc+LczV8zvw==
Received: from DB9PR06CA0015.eurprd06.prod.outlook.com (2603:10a6:10:1db::20)
 by GVXPR10MB9064.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 14:38:05 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::ff) by DB9PR06CA0015.outlook.office365.com
 (2603:10a6:10:1db::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 14:38:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.40)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.40 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.40; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.40) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 14:38:03 +0000
Received: from EQNDAG1NODE4.st.com (10.75.129.133) by smtpO365.st.com
 (10.250.44.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 16:38:11 +0200
Received: from localhost (10.252.15.38) by EQNDAG1NODE4.st.com (10.75.129.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 16:38:01 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 17 Oct 2025 16:37:46 +0200
Message-ID: <20251017143757.202571-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017143757.202571-1-patrice.chotard@foss.st.com>
References: <20251017143757.202571-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.15.38]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885F:EE_|GVXPR10MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c5b0e0-8d9b-4ad6-ed7f-08de0d8ac749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ajFYSUPX58HwMr8N60BFA1rFl/zTtMslbqg5X5avaSmYdEGaEjUVVsE4cyGp?=
 =?us-ascii?Q?vCL+LS52hcjmB1PKu/ip4+WAJyBzwijLT5TcJXao1DMgQsLocZa8IPfcX9vT?=
 =?us-ascii?Q?At2tKBmeJ569LFkXofg5n9JmJKisPIxguCdr+YWBU9QvHC9f2GSFtN79+T8A?=
 =?us-ascii?Q?bRreGwY6YV88pPS7ujTQSNq8fCf45NiOEQxmc9+Tt0pJ0TKAVRAyE4pbe4b1?=
 =?us-ascii?Q?PepCvYbBxYLuoFneo64T+FCrdo490aylblvzbgbnrpXroN6vXkBp3LnnyRP5?=
 =?us-ascii?Q?LT+UmrTO0GC/5kCqFiuvSBW7XO8wPGOEZnUl0Efuz8jKcKCgOMvvF6ko1UDN?=
 =?us-ascii?Q?fybnrRjvpgmmNZ8KF9gC/dU7BNPZijGzGCKVsOeeLV7fg1PAIBgJm+yN5vax?=
 =?us-ascii?Q?uaGpA2eQzrDvRC5MJz7CNgf7K3paD0GyG3SyOGbdU7cfWTWBz/qIZRpNLomO?=
 =?us-ascii?Q?Q3ibGHZ3/IlQuXEuojb10EDl/BtRQ26ovx05c9pdc0UqtZ3KjWEYmHfNCyA3?=
 =?us-ascii?Q?2Tx83QXG2SIq0ON3qTQF9PAgBmEMDsNIsRoZqXXakR42a+LKFXWs93jhsw15?=
 =?us-ascii?Q?1qYkqv/H24RZxRMivSb9lbEfqO6aWePUi9SkEGUcc1geulnp1eT7DTmBxW5E?=
 =?us-ascii?Q?bMgTSWxoDjQBeYWd3GepvIKKTViX4XsLmkaw2TwS4pVi4az53gqUnyfsRNkl?=
 =?us-ascii?Q?0VgGe4rq+zxhI+PGTPsEbWIEqzlzTEMR1OIb7yrLrp4rYaAPYgYX7UPqLUZX?=
 =?us-ascii?Q?XalBLHU1P4CvWAECjqedKy1FbcCoT0ytH6htFClsWdxfC7mXVyhM+EwFK1wz?=
 =?us-ascii?Q?+kVtp62v8nzsG/hge9kczcc18EW4VcxHM0RLYSOTgjYKy/NWjRBkfSGnBG1a?=
 =?us-ascii?Q?JsCVpZJJUqqoLhlYRqW5JYCqteyLJ/24fOlmd3xJ23vKnPLXevMMvRyFg/mJ?=
 =?us-ascii?Q?mF8B+IaC7PJrWmZ7nxF5MXwBdPMVEaEzl4AkFooDe1ebayJp3fKQUxs6ZxWK?=
 =?us-ascii?Q?H9xililKe+cYbIEZLQkliIAtppQY2lMeGBwqp9Cpk0oZVXlakwfrXtpfOOIC?=
 =?us-ascii?Q?ogcNlDnZB/CXmM7xXyGHpf1qCmSURumxxNl252Qio+M2mDCnzn9QUuqJ9MZz?=
 =?us-ascii?Q?tEsAhFVfLsTrMKZ8jMJiHTy/Vi5xxCd6h9t2nyCc3o3FE46B/TmHEzHqpbCn?=
 =?us-ascii?Q?GC41WeSvCHf5aiuKrq9kr7/co87e7W8WGlWTrchtV2/NA1uNN44NYnrVkCRT?=
 =?us-ascii?Q?EuQSfm/eSXSdIGdWGzQt4gPidVv7uupcQyBuo/DPVXU3aZhli0quqhpRYMrO?=
 =?us-ascii?Q?1WGTRqFyvwIUDhZCTCwY/xDVWl1pNSn8G7QgMDnj3UrFH/cTQxpd5mD/CioX?=
 =?us-ascii?Q?zdBDjvlgE3PdzEjaStnbYO5SYMk6WLZFdgw3DWsYePxojDoRRx0EKnNdN0ox?=
 =?us-ascii?Q?enDxVnQkq2bj03h324UjvSFoZkDEJ/8G3U2OdKMwXh+36zA7oVOLgjsY0z29?=
 =?us-ascii?Q?BAB9YPQeiSxVYBHiYtEQfoPvGqz4+JTMQOVs+622H77Vsx53SJSEboEJqZFX?=
 =?us-ascii?Q?mYKPffcKKtPozJ1bmhU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.40; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 14:38:03.2321 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c5b0e0-8d9b-4ad6-ed7f-08de0d8ac749
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.40];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9064
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX+65cWnYF5vT1
 2HOP8udgecO0QLdV9+97uxAcHZ4BKCQwdqR23StawWdQm57umKDFNZ49Jxi2+PxIhn1tSnAauUc
 lAfKjmKxIUMh6554lpu0jfiqkBefUwgQMd1whhMwLZdwBXs2lPyo/7Bv1CAQXu8kzfF/oEcDF8x
 07uGwiHMDWKvk8nwkOtULHPJQ2kpKvmwKLAo5axull7Tu0dmBYXvKz5sZOR6+GvmUI22mfwBHN+
 ObsNY98UxePqy0Bhn1FUd7aD6W5HyN6Bc2fxHT9FUysXB8WAEgpLKsBdQZ/D6JICgxC3UhUCoiH
 PCvKjjpdBvGUKO+RNttj+5ng2FF7J238A3MhEd0eOtEuW3WZ/EGC/zsvZnjO2QUjtY3V3shuYH4
 6TYM7EGnUXZ9kc3lxk+2sfvb4BHouA==
X-Authority-Analysis: v=2.4 cv=Ne7rFmD4 c=1 sm=1 tr=0 ts=68f254d0 cx=c_pps
 a=QfNz7WxyfdFdmo+E+Fz36w==:117 a=HHWmdgNZ66UcX3Fjl3KRHg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=gt-GhcMM7esA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=8b9GpE9nAAAA:8 a=eFOqJ9MERmbbS8AOseMA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: KrRTOKFkIstoAD3ACkJGmN6LUCUVikML
X-Proofpoint-GUID: KrRTOKFkIstoAD3ACkJGmN6LUCUVikML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 2/5] ARM: dts: Remove u-boot,
	boot-led from stm32mp235f-dk-u-boot
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

Since commit 69542d06920b ("led: update LED boot/activity to new
property implementation"), "u-boot,led-boot" property is no more
supported, remove it.

It will be replace by /options/u-boot to configure LED device as
described here [1]. /options/u-boot will be added directly in kernel
device tree.

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/options/u-boot.yaml

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp235f-dk-u-boot.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
index 84279c4712a..2b41bd29cca 100644
--- a/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
@@ -7,7 +7,6 @@
 
 / {
 	config {
-		u-boot,boot-led = "led-blue";
 		u-boot,mmc-env-partition = "u-boot-env";
 	};
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
