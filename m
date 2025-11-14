Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAC1C5DF49
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 16:44:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CCC6C62D2D;
	Fri, 14 Nov 2025 15:44:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A24EC62D20
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 15:44:39 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEFgt0r2606409; Fri, 14 Nov 2025 16:44:09 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013045.outbound.protection.outlook.com [40.107.159.45])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7pbrhx-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 16:44:08 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEhVbkQ/xu1YP52y/vGYp/Y7t5Cr7k4nwusefn40DMIKq2h4IcqzetNtUBW/j6TB3/y3zh6H4ms7HsPC89l4IQHigq63abZHyYUepQ30zlZBHGgweOl0b+32o8HzkmkluaqDGE+XtQw3yAPIpHOkrvSYl04kjZnxIVBBiavUdz4VoBC5n0jR68ch/h8U46hu3Az4wEll6akeOXERj/byOBqpaYcYJcije9gaCLYZaqbInNXu40aeN1LrUnemepxbLC0ZPqd5qdlkqueh1cgLklLTosBvEf2ywm3wWwpuv6Ur3n6zww9uUOx7qTmZQ8ucyTMiu1GH/I7/5s7PzSs0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTIOrTs/WC2w2kjr+tcVTsrPhTt33BEw6URnDtRAqRg=;
 b=cfXhAPPX/ZkeKnx9oNGG17K7VGiWZntAgZq79WwgF6ZKsOCGrpyIkByiUh0iPJVuYlSFt/MqH64YZPV6WJS5SOv6UE4oQ7SNyOVFzHi9Ch1tUIadfjWLRQBdkAmaIr/XXPubhRLquZtvk6d447dCFiC2Wbn7qZQUXsVqZZBYCIvzSjpvD+vGt7R1TsNsIcBAaIZZK4qD99KOGslIsV2aCe+2GxUqkAGalQ+/x+LInAORE4NkRQ3taTV/QmZwysNtdRvEWEYCv7IE5zIwlDCMQIfbunmQdaLDdLycJw3vhLDP/WMvNXLHShI/1LAo/Gr1zC5LBYFBFS5f4DYaZIjimg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTIOrTs/WC2w2kjr+tcVTsrPhTt33BEw6URnDtRAqRg=;
 b=ZokRNEr8EfVLW2a887ZMJJiPsX1z4c+g/+qLblijCJe1gV56TSi9jGdMF0DkGctBvRdao1qKo3bVxvBASwV0dTgWq/5578+K4yEjIMUpGCzNeSsm/vqymufZqX3G07lPLSGSDsdTvcmozb7NEsKUCGN5HjSMVlkJ3DOu1KAwT/hGhvdxr7RIzBjARGQWjC4U5O9JODv6ut15ehtvr55glXaHMYZEHP54e/2seu3CrgDL59+wrUh/85/r3WlAidAgIpuCQ6kEIISjfzAzSNJ84sRe9UHtw/HPkIDKR/VNt9EFW1V3QWCzcmZ3eSxw/sRgj96vOmDjB1+qvP/AdgaQOQ==
Received: from CWLP123CA0123.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:87::15)
 by DU4PR10MB8448.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:55b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 15:44:06 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:401:87:cafe::da) by CWLP123CA0123.outlook.office365.com
 (2603:10a6:401:87::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 15:44:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 15:44:06 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:44:18 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:44:05 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 16:41:48 +0100
Message-ID: <20251114154259.4035206-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79C:EE_|DU4PR10MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: e9af0452-0e1b-4473-7e3c-08de2394a520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o55ZfCvWtXOwRlcX0BxLDdNf+gL2rNuOL05+lpkiFJOliSUcKoYvPW5j2t5w?=
 =?us-ascii?Q?U9NQUsObGVL+LJWxs40bZgT+/GjKRHh5Jb6mSqWeC0YIUszJJtZkivdVMZv6?=
 =?us-ascii?Q?Vox6EU06N8YHV+6yCgjyCV9riz9sVSWNBqWZAkmfIJxAmvy/Ve09aZphLabf?=
 =?us-ascii?Q?F7W+TDgBz6M0dj0tXOp5mgnonba9tlnZEt1SR7RRZaI0DvciliR6H4tvYAdN?=
 =?us-ascii?Q?BephlRbm58sKIdWKwK1rTEjOItfsSxLseyZhcR/OL4cOd5ppNTnbYbZRIoyd?=
 =?us-ascii?Q?GRSbkENNlpHr2NO9GtvTMh7kSrqM28AQvYytmfbl7lgh9gTUYtT84Hyi5uSE?=
 =?us-ascii?Q?4FDCchjdZOnUZcn56VHBuTdtqO+p8bxxLp7DiaagyO0p9gSa2qx4g3TsQaPC?=
 =?us-ascii?Q?ZmZ09ZcmebrzV0BpHDqEvlteNoPM1QwWuiuigi3TtTZIcY4sDpvB/rnODIbd?=
 =?us-ascii?Q?9AndFzTu4nyMvwHG4A6pDpmenyZ6HvxUrYLD0AVxIDCFNUjmyemabrpi1uJX?=
 =?us-ascii?Q?DkLvPkplT2pe8b0YT9LCUaQwHPNIwVaAwhO2nH8Jrv8kD3N1+0k6Vwya4iMt?=
 =?us-ascii?Q?JrRyapcv/MAsV3aibcWKrrrmyMHNYZAx/+7vtlMAX/Hq8y5SMJS5bbZBOoBR?=
 =?us-ascii?Q?Fk00ITNsTXDVOZixEWDT7YMyz8V3HFWTHJtyizaNn6dlJsNz2krquwGIqRy3?=
 =?us-ascii?Q?plHaK2M67Dz0TBuQkhBArkyRyDPhD+i2lTSKj942c9mmxbT3ex8/U16v9vFe?=
 =?us-ascii?Q?1hmOyXf2kT2nediVV+Uwy683M4CvuGd3QG7EkS6Ktxa9kwHkj8VRsdpsAFUn?=
 =?us-ascii?Q?PQMXkQhvfGVT9ZUY1mls05m0r8P47lC4BPN49PALtVi1JcbhUv467LXuLNzm?=
 =?us-ascii?Q?1AMIwTup6ZRInX8CRUcDPrJiHnXyXDrAzO4gk5U314fC07WTWUrTSbNmPU2J?=
 =?us-ascii?Q?JcCcvdRfmX7XcLDeytB0h+er5pplypQSAx6dv4cHEM8JVb0NGKymEYXS9qDq?=
 =?us-ascii?Q?aE7H/yG1kDq2sgL9aGsIEz2kQUCB8UyMxsE8FH3qx2r1F3cwdkJ2d1pkfrJs?=
 =?us-ascii?Q?HDcWt/i0GlaUd1hIafEdh3R3KvJPhwXehV/A7k1Kc1TPSxcq1C/8Vyr9FRJm?=
 =?us-ascii?Q?clzfX0DGs6hGSHp57+vilav/gD4dGcZXrEvdaJ2q0DuljLmreWULeYPrhJem?=
 =?us-ascii?Q?ALRmXe2ywwwYJ35EjDnG+uUw6koGxu5p9MykNBTutYNh1zGsbBTabxuu/MWa?=
 =?us-ascii?Q?Hg+nqK+PcUXkkK5LTWQ49FjpacNxfEm1oMXcN3WY124SbCx2Hz/3TdXp9aK2?=
 =?us-ascii?Q?DauwVhxBGAwRbfOr5TJKKt4BhXCos+PfkEVXIMyMZtL4F2qebNkWF3ZiFyJm?=
 =?us-ascii?Q?G5xOZ7NoTuHbsq6QBbp1zFknKx35Q2f5OPRTYF+fw8IdhGKcy4Z6iAcDIjhe?=
 =?us-ascii?Q?azUMhkv8DoEWacmL8UUrAAzyU6LU818WnWcBYJf4sKeBLyjtPXbMN4n4Pwlo?=
 =?us-ascii?Q?Ob4CUwR8kCXksupqcU7yvCPM69ir6ezheF/46UBgLxv8/h0UlwP97tkGQN9M?=
 =?us-ascii?Q?5JpKcd89WngjgZujXso=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:44:06.4786 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9af0452-0e1b-4473-7e3c-08de2394a520
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8448
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyNiBTYWx0ZWRfX3UaLW+iYhz9c
 l6hVxSPcZedDs2cJvQ1tHk+GalkOwugTwLPlyO4+G7BgviucpCwCwO3xM8PlUcAuotfPGLnKJNG
 +q9Sl6eXk2UwHjMNMwVJRgqlS7IdaVLf4Yb690iFNirfbYqYdUGAf7bp6/GXT/VUc5DKDp2xqE9
 iVv5MljuYYSk9LgE4DIeIYpe7Q3Y/BfImaq49nG4Gcawrf/FF2clzS5xxD/VcA8wJYzrgHiBM74
 WQqJ0902gYMJU+oSoIlCzkGeVvYSvauGCIttFuPR+96WgXjakWFrc39u9ASdQbpr2fTy3uVgSFQ
 BzscCKT7aQjpJRXzTQIA9P4+jHCLJg2LY6P/Z4e2UhEzHn9qwjy/M8lZrFZFt9wrFvvpKtbzGkd
 c/bv0LuAEVRwsLXMzP69h0B5e1pX1g==
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=69174e48 cx=c_pps
 a=O0RlPBSIVreiLynva4oi/g==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=voM4FWlXAAAA:8 a=tqA6ziSev45X3zdbmbsA:9 a=IC2XNlieTeVoXbcui8wp:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: VrZeDzz5nE7GN3a3DdecXTHATZgYyTFZ
X-Proofpoint-GUID: VrZeDzz5nE7GN3a3DdecXTHATZgYyTFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140126
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Valentin Caron <valentin.caron@foss.st.com>, Leo Yu-Chi
 Liang <ycliang@andestech.com>, Yao Zi <ziyao@disroot.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Kamlesh Gurudasani <kamlesh@ti.com>, Cheick Traore <cheick.traore@foss.st.com>,
 Alice Guo <alice.guo@nxp.com>, Lukasz Majewski <lukma@denx.de>, Sean
 Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Peng Fan <peng.fan@nxp.com>, Michal Simek <michal.simek@amd.com>
Subject: [Uboot-stm32] [PATCH 0/6] Restore boot for STM32MP13/STM32MP2 board
	family
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

Commit fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
is breaking boot for STM32MP13/STM32MP2 family board.

The issue is due to registering clock with default name "scmi-%zu".
If one of these clocks has children clocks, it will generate an error
when trying to registers their child's clocks as shown below:

...
clk_register: failed to get ck_axi device (parent of qspi_k)
clk_register: failed to get pll4_p device (parent of spi2_k)
clk_register: failed to get pll4_p device (parent of spi3_k)
clk_register: failed to get ck_hsi device (parent of usart3_k)
clk_register: failed to get ck_hsi device (parent of uart5_k)
clk_register: failed to get ck_hsi device (parent of uart7_k)
...

Re-introduce scmi_clk_get_attribute() call in scmi_clk_probe()
under a new flag CLK_SCMI_FORCE_ATTRIBUTE to register parent clocks
with their real names (ck_axi, pll4_p, ck_hsi ...)

This new flag CLK_SCMI_FORCE_ATTRIBUTE is enabled in stm32mp13_defconfig,
stm32mp23_defconfig and stm32mp25_defconfig to restore boot.

It will preserve the boot time optimization goal of the series [1]

[1] https://patchwork.ozlabs.org/project/uboot/list/?series=481425&state=*

Patrice Chotard (6):
  clk: scmi: Fix typo scmi_clk_get_attibute
  clk: scmi: Force call of scmi_clk_get_attribute() during probe
  configs: stm32mp13: Enable CLK_SCMI_FORCE_ATTRIBUTE
  configs: stm32mp13: Increase SYS_MALLOC_F_LEN
  configs: stm32mp23: Enable CLK_SCMI_FORCE_ATTRIBUTE
  configs: stm32mp25: Enable CLK_SCMI_FORCE_ATTRIBUTE

 configs/stm32mp13_defconfig |  3 ++-
 configs/stm32mp23_defconfig |  1 +
 configs/stm32mp25_defconfig |  1 +
 drivers/clk/Kconfig         |  8 ++++++++
 drivers/clk/clk_scmi.c      | 18 +++++++++++++-----
 5 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.43.0

base-commit: 6c2f2d9aa63d1642dffae7d7ac88f7ae879e13d1
branch: bz_221618
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
