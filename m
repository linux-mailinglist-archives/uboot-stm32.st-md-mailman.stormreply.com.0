Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ACDC5E310
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA69CC628DC;
	Fri, 14 Nov 2025 16:24:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAD3EC628DB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:39 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGJMk62672126; Fri, 14 Nov 2025 17:24:34 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013036.outbound.protection.outlook.com
 [52.101.83.36])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7pbvqy-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:33 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vORuCLSS42XGqa0PSc4ka2tVro+UmbwdgBW752Mkx7n3Kj8bF7xnU1gYUwgYd+uAF8jy1sYbtL+LemZ/1S0DlbH3rwEQMtDzXZ2ChYtRv9KpQV5IDXYj/aC0ZMYlNMxsNRBc2A4sGiYEVqiweubAAo6uEIfoMCFC2ynVeZosyUuR7uEbUrbwEcUm6XVWci8lxoIrFa/n9RWLX2j6SUA18tmb8Fv9ovToAfCKclAfYPZZQD/rWus+PBqfhu4Qxx8/lTDlMQL1fcVr8t6kpzYwzVuWHLrR2a/wUhlL4rllROngNQYdFc2KXjdM4P25gc14SKZwXRPiwje/g+LQTv7Haw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oE6KT05A6Ftr0UfPjD1hnAQ7/WiRRG2+k5u2NHKzB7E=;
 b=YoojxCfO9JfvYaAf9632UeeYoYWBtyCtuwAqDIFPtMHLOsh6PyO8ZWNVwpo5sqGKilqV5YBkYTYW+U1lXDspQwb8S5vG4dNf1bTsza5r4VIrhY5F4kBFJ7ZNn+m0ZkTYEtnlYj+jSKVQWaHcnmVVnM0Z/Z0N+UmsRgZyk0u877TFNQt/VAk8ztmLA1woacGaWdqtMN69Nd+OCQKlob/tTC1OIVeqbcJ5DQGetczr3p/ldQmwYMMeAvZEQwhcn2o9VvKKcORaafnCyEJ/aTD47oLvUTE473rWhXCDO9786HHtHewqtEx6ESovto0WjxUmjsK5xxanfk8CyIgBvQw8Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oE6KT05A6Ftr0UfPjD1hnAQ7/WiRRG2+k5u2NHKzB7E=;
 b=aGWSTUQGoeMXow/blfExlSuszEBRjmsqFGSgAtBj9kHIRveWewb+huoWcfajuEgonbc0Lc//B3H3TpQydiH9LYBCvsEdE8sgCEC1ChoH4Igc+mE7D23iIlr7amBTwcCIF83JZjIqswUFCES0rI3zRo78gN42GKbO7CMx/wYghCRldHmCW1u5BqIrWacGga+FfgesE+OUZnv2AT/XftYHBVBr2nh194svWCOWdBIVrtzFk1qk0kphESjoUIAqR6r2Uapkp98cZbtzPeELuRpPiNHE+wTh2obJnkCVLyyMeNo8B08Oa8/fd8seXy/zK6KBSXb6sIiMb/tFyCf5fPY4ZQ==
Received: from DU2PR04CA0228.eurprd04.prod.outlook.com (2603:10a6:10:2b1::23)
 by DB9PR10MB5233.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:24:30 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::46) by DU2PR04CA0228.outlook.office365.com
 (2603:10a6:10:2b1::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:24:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:29 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:40 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:29 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:44 +0100
Message-ID: <20251114162417.4054006-11-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8E:EE_|DB9PR10MB5233:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f866346-27a6-4463-c5af-08de239a4991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tDE8zzQZVATUHJfF8onBrwZ4PbFW3aFguL2PAxokWa5hllLj+m5bThFCMOM4?=
 =?us-ascii?Q?qq2UIrEwkJxrvTsYFUnyJuvrdTCwiN2X+fPk19MFgUO7aPYipLSOI1RKVLup?=
 =?us-ascii?Q?BMpQeT+3Rd8RKBte+OXNYqzcu/prdP3WxIpYGZvHcn1bM/ZD9IxrtwUtcyai?=
 =?us-ascii?Q?DRC695DwwJKeFvpauy8ylE3cktyNO31qWb28GEXPl9fNRpqw8NC5ABdkZGg9?=
 =?us-ascii?Q?M6YtF4uzkcOhjqjibBg9uqL1wrW+j0HBdAfIzOZ5Owuj6VzkxR91Uuuky1ak?=
 =?us-ascii?Q?1SppstsxMxhTIRZCds79bO1N8cTJyS1xCV48p7PbmYZiE8tfJTcY6lyyCWTW?=
 =?us-ascii?Q?f38InLqYf688xJyugali9mMVzeMf+8FgR5q1EWcgN0zSOOupcN/TFMT8BwyH?=
 =?us-ascii?Q?c6zhntF1xLm3VtQL2AuDnioS5/S4LPoRR0Kig8GSiZAw+/MwVBa/o06HI6Ls?=
 =?us-ascii?Q?BFVqbcr/OYjs7pEUujM+71XEJfXYZd2kG1xS/ypSDFuHrXMr7bl0hnYiXhZ8?=
 =?us-ascii?Q?XNxvyb/N+1eYifccVPllMvSboCiwoxj67a1t579VX4BFP+bHUcnlbrBinS+k?=
 =?us-ascii?Q?fVaIOoN91Mhn9bUrwhfl4uvVOf3dUnJWQkC+d/jRi3sGEqcRvNPrJ/Ks6y7m?=
 =?us-ascii?Q?2cuhlh7RiRxNWh02c56PPCakwF4CEdO0uW5VHw5Zz/Zm8GtwPJ04tntK3y5I?=
 =?us-ascii?Q?fo59u2YHde81GhBA5bYYWuUBpCNo/udiMlB+ftBSMgSUKTBbD/O8MrDKcHpa?=
 =?us-ascii?Q?lU9iDbxLJmDIgNGJCVUBIu8/MRMadnxTLdsLeGE785DnWMwq06DVuUTou8im?=
 =?us-ascii?Q?SRJwXgP1bm0Id+z0GpWZowaxQQU5RdMVWHkSZULDIiI2Y9hA4qgPrJIuk3EZ?=
 =?us-ascii?Q?bhj3Ei64aQ+kukz1mCUImkAdKCfesTnlU+cSnbS8vOi2vKdcqDLX3WtY0hse?=
 =?us-ascii?Q?qoKUxQL4CleMp5xPU6ucjCllwMEIvsuZ+/q6vGTE5W/J8NOwaWb/wXSeJJuO?=
 =?us-ascii?Q?/LoBs3Me2DJ8oo3scL+ZRKV6x3OTHcHNCtZa+54ksOj3Gj1hr/TptiMZzpYr?=
 =?us-ascii?Q?T7gkFqI5pYd+MkC2PsDXeWA0w+NQeRnMnUzqdkBsq3MEZ5aatlFFVV8Uu0S8?=
 =?us-ascii?Q?xH1DOmiJbvegLtApB+3a4JUbfKJ9yDUh/KHbFPzrRCS/GUmcSF/j9sIjKieZ?=
 =?us-ascii?Q?v64tR27e4Co53v3OWYwENY3jYpS2lBNtHhVbcWzRkAOMJicB/0d9isVocwfA?=
 =?us-ascii?Q?91V8Kgyor/UcF3OYUmYPfptgb7jbKGXpcW1/IPN3C01SIvCgoiKGHm0Fg+dM?=
 =?us-ascii?Q?n5qgKxJcJ28CsLtgZod2GqsBoAbIhZLQPV8+Ui5NTcvAwodatlwesrKHLfY0?=
 =?us-ascii?Q?v1XBgOat8bSm0coeQJxjoqCSuJvn678z/jjvf+3HibyAaFj3EnOTav3tULSW?=
 =?us-ascii?Q?bG622MJAL1Xc6mnBOFLlRmRzsFhdz8ZR1apUonqapS4AuAs5wWHwuX1GK9E9?=
 =?us-ascii?Q?lUjc7jIjhQ/P37hP589AtCr89iE0azubV2pNFwXUBESVP3/Ik9G/E6Mvmv00?=
 =?us-ascii?Q?miwlW03g8j2FJ/P2IBg=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:29.8283 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f866346-27a6-4463-c5af-08de239a4991
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5233
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfXw281Lf2EP4fb
 GAhED3TEV4kZwdmzTLTFs1NuiWBYn3yLsG45oFmmPYjhqOQg2kSC35qYGMZEn0APm1fU74VSlu1
 8LRyqIkdFP1/EUkSO4TKzuGYarZ9XZlbi9u0hfgEm7rNlQZ/7Dg+QxVzWgWgeo/Cf+NxYMYlNcw
 TUa9pGe7bi6j5zrkx+DV9/Z9EQhGdvgkhMIXAak9I/KaYLyhrEva/FtN5bK2NMMpNbY6UR44ZD0
 CvsMYPVKj6XDY8CygpWRy8V0BquTaUU4kEgINQKBEm/SyU8NR794YUAJjP5Z1QJeLgXnsJ3MOWJ
 QOmwu9/ZWv1Pclr5jxTEBciKbtU2Xv1tkvKANU6AIZan2CFkBpQw5R8kSipTia7dxNbwEfRQ//M
 yNaPxhSSZU+oSIWEkBzAHEtqFiT+fw==
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=691757c1 cx=c_pps
 a=UcnnlCLR75da6ZMekPEuyA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=nrF3F4ijc2L9vkgH70EA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: htuHiLej-NEXsvPzOcibrw7_-NkYVGY7
X-Proofpoint-GUID: htuHiLej-NEXsvPzOcibrw7_-NkYVGY7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, Sam
 Protsenko <semen.protsenko@linaro.org>
Subject: [Uboot-stm32] [PATCH 10/23] configs: stm32: Enable LED config flags
	for stm32h747-disco
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

 configs/stm32h747-disco_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32h747-disco_defconfig b/configs/stm32h747-disco_defconfig
index bea1fa5a809..3db7eea238b 100644
--- a/configs/stm32h747-disco_defconfig
+++ b/configs/stm32h747-disco_defconfig
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
