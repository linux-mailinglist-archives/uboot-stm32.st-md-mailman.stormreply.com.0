Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F74C5DF44
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 16:44:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58E3DC62D2D;
	Fri, 14 Nov 2025 15:44:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96462C628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 15:44:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEFZIVw2614474; Fri, 14 Nov 2025 16:44:14 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7m3ma1-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 16:44:14 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bN5gkyIuJ4TWBC3hLX0BsLx5klikKW3SxmuTCAejPoUKMzXqOLbeoZWq/mTolKi2A7z/SxYweDgW/1fY18YKmtpM37wRzzcHp1XzfFswzjNDJ1N7mGx5uPhTsDZUM8ItPdmGwx28eO63+M23HeX6c52nvIytbk1znnX6HJuHfxOX5HLUFUSQcF2DjKrZrinG972TxzN2GgilSeM1PpgrnOWVEJYx4XnAy0U2eUO9JOtCIQ+v4MPTs3VABshw9u5To11tN7qkYUuiaTODA22AFERmU0L8PDQWO9iu+xd+LOblgeAc2IdyQGvChOuoEtL2D+ky1CboRvw+YK5NPEr6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ij/TYtAFho0UrNzvGUp2+JfSCme+tqd46jUiixQRiI=;
 b=klNZsbhf4w9BHYJ0YSRdoACCPYYPoFGjmFTzTPsgcZE6xkNuAMqQROpLxdEjVmtUaFsJ9mUaxMdbjPO4h1lIrO4wmv7xWq+XbEyk80UQN3/jLgjqOADzfcZwEfzYkelWZdQycy3KO+Zsu3gLQsxz0ERKhHK38P0N4+NjZj/Z1pq3P7te0mOz6uZ8Vr+U3XZ3DHodye2ZOS/2q0TgXArMHhifJ+Smi/wgCccH4KQz4cVRiISJ19qmGgTNd2eXO0mPtEtZ0qHqUq5PTc51eC0F/rl/dHRV63JlIGW8McYDD13ockgkD14gTrQuzLPhreFXtzwsepqj7YkBDccZB5x18A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Ij/TYtAFho0UrNzvGUp2+JfSCme+tqd46jUiixQRiI=;
 b=Z7ia+FOX0hsxP4MSE7pTWZrdLEGTnBzzid5KIzgUd/Jj0NSBdkrz7+BjhAwZ3hHyeHinGz+xxRavl0hspYN+tqnEd8kz28vdxJ2poZkyFN/spqLbXt27BNKDDOdIYnOrUVoeyxEKQOJGjVjFNauBOt5EvlwVWSP6+MDUtHJwDGtDqLnbqvet4iNi+2aizTnMNC2zrvYNH6e18XDqcU6RZ2mkgJzk+aWs7HmCztyIjHBq1i0MOus0UhZzjC/lRnfEIGc/Mz7/Oko2K04LO+0Kd7F041lGzKashorIBibw7aRZ4/pjU8/Rwhnz5hK5dUTZ82Eo4XeUvkUzRPr+sJvFOg==
Received: from CWLP123CA0218.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::22)
 by AS8PR10MB6922.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:57d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 15:44:10 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:400:19d:cafe::d3) by CWLP123CA0218.outlook.office365.com
 (2603:10a6:400:19d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 15:43:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 15:44:09 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:44:22 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:44:09 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 16:41:52 +0100
Message-ID: <20251114154259.4035206-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114154259.4035206-1-patrice.chotard@foss.st.com>
References: <20251114154259.4035206-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A796:EE_|AS8PR10MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f08f321-a71b-4481-cc1b-08de2394a72c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+mcw6Knq+iVUfQStHSWUKLnZp71K+N8P/kCcddW4i+w5ksfLOiEiWGTfsPK9?=
 =?us-ascii?Q?LACCwGVRoWxnLlVIqW1iQhHPpAzLqvZOaOE9Ih4iPr2QUVDAglHOA2g+fZko?=
 =?us-ascii?Q?W4othXEDwidv9HAocYxmwaem5dt2VukCMw9GKaY4IrQ5T1QmFaOnjhxvop/g?=
 =?us-ascii?Q?DvNG5yXfZL/x/U//p3mcP5HKX4kOJLEsJ1tdNBNNZTNOy9l5Fu0ZJkL0owv3?=
 =?us-ascii?Q?s/p9WwX7emozzcI4/yLeEyp49x+A2HfRiqXUBe3DaQyr63rzyBFtyPa6L8ZD?=
 =?us-ascii?Q?r1z5h3uGYTQv4wds3565M/hjztWmxYAr66q7DhEbmEIDWsyLBYO/hrY1A8WL?=
 =?us-ascii?Q?cV8of7jIErwkHDkrp9+8qnJ9J69sCZdbNLPKD1NPCw4opsBNyK/Vit+JyJlM?=
 =?us-ascii?Q?VpNI4NtAlOP+xcEefnmt2mwY3HGY83uyS0Pw9m1c0vu5kIy2ajPxQu5bhdXk?=
 =?us-ascii?Q?xLT0r9+8TtN7qOYzyKM7KrQss9XEEZ2kgwsw+9Qh6kPv0CcvtNzQlqOqDH+n?=
 =?us-ascii?Q?rCCAZILspKc4p6vQUSPgHdt22BWWpfmGqot6rIxHJcOD+2JVeMIIb+Zgpics?=
 =?us-ascii?Q?fXkBpR6xkmY/plo/Jd97fv3oLipiidak7VKquKQcZhxxeSsbiAswQ33nl76F?=
 =?us-ascii?Q?15fgNBkKnjXb0ZRxv3UqlXO904aBxzE/T9PHG2taaeohGghIaTw7FW2HLqn3?=
 =?us-ascii?Q?bxNM1+lozlWHmvAchxvhFIg2lAF21KwUBp6UDSEXxbjBLIS+HVr3CB0EZTdJ?=
 =?us-ascii?Q?WF4itsL1U2LosxOHNQirTQpoX+3sBV2yj19Z3DwAuSiwc+DRrFSMbA8Sa4OA?=
 =?us-ascii?Q?bgZF0ZLE/fQ33DVsaXPPcCLZfGNPyJmTooSwu0TXqdb6SytHU865kH11Gjwy?=
 =?us-ascii?Q?UarWHQQfJSsV6NxWvOvXyKuoz9rnVS6GeaoAowIaZRP7wiqdxOkFTFbFlLg3?=
 =?us-ascii?Q?kbnyYdT562Ws/8+ZwZpLXWrEoZUk7umCPBgKoKMdOaQuaNwbtRULtm1n4MXf?=
 =?us-ascii?Q?FlGslPK7X7pYiAaa5/qGJeHrq84fQYcuhYVz0lg5VqX9fEDM/xTiMVvXof9Z?=
 =?us-ascii?Q?WLZQgE4jLK7zUrfF9y6f52BiWjdGsXJEIwTah0lluQXwIVgNX3fRJsksSos8?=
 =?us-ascii?Q?sjwLs6AfNkcz5TEbcrRypugiILt4Xy0XSyink+OJcuibk4NriLyZqPsNY/f/?=
 =?us-ascii?Q?59rCQM7IwK/GNX5ZWI+l3BKycMHUZOmr34lOL9QlJ+4Du70Z3mODS03KPPGF?=
 =?us-ascii?Q?Isp9bjDlJBK7zZDkZe84J39wnrkgZujZPEaWp8u9/O6RQnYORyVwO9RJSUbw?=
 =?us-ascii?Q?gHxj2IAhxOkw9JRlQkQF/q9v0FK250qenIhea/7zgCzSpJ6pvZlMJEuWBzEo?=
 =?us-ascii?Q?sfTmURDQTXd50X6ugigc36vSoHxbjPlPqaQfftcg2StI62WqwepV4oCnqbk3?=
 =?us-ascii?Q?/PuOB5Qgd1bNuelYRqPPPhGNrERea8paYqVLYsHsGQFbHQUz4e/HzfF4d9FM?=
 =?us-ascii?Q?l8enwBZWrb8cTe3Q3ajVtSN9K54duZUVpDvig5iPvli+YYax/s3JpFJzpKO8?=
 =?us-ascii?Q?OgJ0I9Sjz3yCOrgGxlI=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:44:09.9208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f08f321-a71b-4481-cc1b-08de2394a72c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6922
X-Authority-Analysis: v=2.4 cv=AZK83nXG c=1 sm=1 tr=0 ts=69174e4e cx=c_pps
 a=5ek8fjnuUT40V7IhO9r0iQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8 a=b3CbU_ItAAAA:8 a=pGLkceISAAAA:8
 a=k-42gJp3AAAA:8 a=yC-0_ovQAAAA:8 a=aHPJhuQ_V4RRMszlWkgA:9
 a=T3LWEMljR5ZiDmsYVIUa:22 a=ST-jHhOKWsTCqRlWije3:22 a=Rv2g8BkzVjQTVhhssdqe:22
 a=uCSXFHLys93vLW5PjgO_:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: YnGc1j5nrUDAyW5x5UeCOa_1W3dbuXpN
X-Proofpoint-GUID: YnGc1j5nrUDAyW5x5UeCOa_1W3dbuXpN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyNiBTYWx0ZWRfXyAsZwpb/dM/Z
 zT7jdYHxqcVpfsNxlRRghunvDBZDu4ZRD89/H+vHkFDa3FcVX/DscZp20Oqh60JuBsrdFytZnWz
 mkS3ezClrlxOoB1YA79gB4uPlpHypS1zCS+WcNTda9kzXxmcQHo7ik2rvHrchwIlV6Fk7uCl0uT
 UKtanT/hOox+tGTrv5Tg1NhSMmJlqARu8uoiubLRr6XM3SoZckQ41axlCo17UqA2GkBHFt2EPAf
 AOGbD35yEA6yIFgLhzAeZVawpC1bdYD97WJBtQfNCxQyeOm5xkhWjsSoa3QeUHUz1ErE3noC6Gn
 U6997wtaRFdQ7FrrX6yLoBehRsGWbKKbsBDr0hKp3fqfQ4YZFbLGjB1isA6l+smgfxY6U1dIxi2
 widLwQmSwtLWGT6yGpahVkq5kEvqFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140126
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Valentin
 Caron <valentin.caron@foss.st.com>, Vinh Nguyen <vinh.nguyen.xz@renesas.com>,
 Alice Guo <alice.guo@nxp.com>, Cheick Traore <cheick.traore@foss.st.com>,
 Peng Fan <peng.fan@nxp.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 4/6] configs: stm32mp13: Increase
	SYS_MALLOC_F_LEN
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

Increase SYS_MALLOC_F_LEN to fix following error:
alloc space exhausted ptr 210040 limit 210000

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Cc: Alice Guo <alice.guo@nxp.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Sean Anderson <seanga2@gmail.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: Valentin Caron <valentin.caron@foss.st.com>
Cc: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Cc: u-boot@lists.denx.de
---

 configs/stm32mp13_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 6979e3405e2..3bb06a17915 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -1,7 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_STM32MP=y
 CONFIG_TFABOOT=y
-CONFIG_SYS_MALLOC_F_LEN=0x210000
+CONFIG_SYS_MALLOC_F_LEN=0x280000
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0xc0400000
 CONFIG_ENV_OFFSET=0x900000
 CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp135f-dk"
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
