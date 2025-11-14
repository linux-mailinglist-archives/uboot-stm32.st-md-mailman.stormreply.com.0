Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0D6C5E30C
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3757C628DD;
	Fri, 14 Nov 2025 16:24:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8027C628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEG9Aws2976843; Fri, 14 Nov 2025 17:24:27 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7kkrf6-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:27 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/T71KpUl7gRYm826Na6x9cFkIr6oRMdxNZrmNIj6IVqXZzxEhl9L1/ykieWfXvI7gP5VnzmtlSATLiKPpbog9yx4JiEVg/RkrP0Xlm+OpC/cW1mHKyHiD3czG4fLDRuOorYH0N3cXRvggLmfEeq1l1pFjCxYwgS4pal2IITRbt13Ld2vmgRmFfA5KymJfA0LZkbvYVEekrjDlRiwke1iJgeBoSpFMtqsNd+9d5of/c77uy2vHBmD2XuJ9oxXdTZoiT18Alh1VeB4V3L9SEcXSB6LKtd/GFRr+0m1hYWajqmj/+KKcrzyXMQT6mSkru3hcBIne6Vc0ssnwvXGzP49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5l3Uyz9iD3EnRDLXAGlFuxO4WpbiA+ThNVtJCo1wIc=;
 b=QK1OqHyxLlqWTSXyVJZLdRB9AY/sVxc0zig2x5/+z+DL93wLZWazai2zEyFsRD7uI4noYJ9eWXppXk0SPCTLrNLgTpe++35rh18eFqziD5rHhC85AoNXewChf6y54/bp9Rdgkx7iCmigQ5lG+v3c5kvnwtRLT/5suhBpGKxifYKbM3csAcPQUBz8vVfHkPZigwuVryzqexIR3fbcYAAS2Ch30sQOa+K6LOr+0+iivFjTCzzRwQufFF9vRxzs8B3FByU7RGyPxRb+pXlZmmo/IQbY1v6vhT/LX+OwE9wKTKITLw9K3VtCZ6NQys2+VySffm8HwLDvfZ6Dyxy+zoOlXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5l3Uyz9iD3EnRDLXAGlFuxO4WpbiA+ThNVtJCo1wIc=;
 b=MqIDt0cPMFWfolVWPzGhG56EJZmPwghiyE7Ll6/NSt7Dcrn1L5cXrT0tM3nnE7JaCTr8BV6Yzyor251NDc0xmh+ahro4ijbDCe5xseeDK5O1KKm5ATdMfw2wte0NSG9NyurVD8zK9AlKcZM/Dgf/WcXzCM9ESoRpRUmCH8E3u/bJ3nom2+uN28HdyP1NFYSWmWJOySJMH0Vr/EKbd3FNt0rRrIgkUk5CMGOl21okeHzYP8NBKsNQUtMW81HQ3Gp8iTTkMExgQTMCd5e1BglJHyxZR5LhWoF+512IMdJf965C7ABmxu5gk7v2UBvojnvBx4IZzrJLMxD6dEuz1FlSQg==
Received: from DU7PR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::28) by AS8PR10MB5949.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:528::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 14 Nov
 2025 16:24:25 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::e) by DU7PR01CA0005.outlook.office365.com
 (2603:10a6:10:50f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:24:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:25 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:35 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:24 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:39 +0100
Message-ID: <20251114162417.4054006-6-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8A:EE_|AS8PR10MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cfbee03-f7e4-408a-dc91-08de239a46df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TVYfnFzU09wVLkS+u0bgqvdYvw6dG7BRbUcYFgrOLpoQETdgs6V8gt9IycGR?=
 =?us-ascii?Q?UnkalntJaYeztqyrUTShy1kjSxmUJa/9Tt9VtxvuOMPofkg/LJFGWWhcN/wG?=
 =?us-ascii?Q?YHQBICrd203RTiWeSClSUyGHvJCqRoHhx+PpOgugmoponbyF7VfuWk7yZMnQ?=
 =?us-ascii?Q?cwAcqsliaNrK15V/hWwg9VRQsm4SNQKjVUsTVXEYiJJ+jypTbsrsuXHfKFVv?=
 =?us-ascii?Q?8fg7y8vp+XH8+KjvepJzQI1QohWFWSkpKTx71xmXNoi899Tj4tqzbqsjTQ55?=
 =?us-ascii?Q?h1XRHZzmHEnrOz4Jr6JLe6z8GlH58WPM+VojVyN/m8wAkZI1HbajLBA4Rc0j?=
 =?us-ascii?Q?knhVAl4onnrpBUqx45e1kZd2HpPyfbm3iBWrVLfJCjGqoQzYUQq78PJ/XHHD?=
 =?us-ascii?Q?JPxZrEmCwxb3kmmKZzDlCosvJ+8MCxug/GqqRnurE5vw9f+wsrGe0a6oFb8C?=
 =?us-ascii?Q?ZSJI0Y99VqtYwUWNWCums7t0EiMg035r9BmWeJzCqzGslqeXsYPNTqTULW58?=
 =?us-ascii?Q?otLvnVn2XTv1uSy2JxTnoVfM4gnW+qEZ5QXZfYLtlncjKgSTjIMzA7eFEq0p?=
 =?us-ascii?Q?ivZXJ4EsDOT6C8ChvHuuweSV8q6Cq7TD5JM6llcIx6EZ/RWxo4U4oud5ohoz?=
 =?us-ascii?Q?eiOE+Z1PyonflPmNpz0GgiCsiFfuhijHJ2NGKzJpAGuqH4rZq+zIHYiUUJCF?=
 =?us-ascii?Q?s/0NwkXuhP1u4ChwLLfA16080JONSBMlmhkN611hp0QvLvy2GaevUfW2aaxl?=
 =?us-ascii?Q?jAowEO8DC5e6Zn+9uF54qyBMR/qRUoMWrqQADUWXHUdzcOVQtXc9/mZly7/y?=
 =?us-ascii?Q?tOFD4eNwR4C5LD7qdSVTIACNv9wzUp8MUtuUCNi9h1NtIhsjVSfrZkBmbu7L?=
 =?us-ascii?Q?NfmGL68WCsjWzQwqUKIqAzrT5IMY7EiDXBG/Hf3fWPEmu0PiTsNVSm8HwBeK?=
 =?us-ascii?Q?miIbV+azBASqszITFrsLPNwDFDugxMhasJHC98eBp6PRUJSMPj3gaooY7xA9?=
 =?us-ascii?Q?Y/73EvjZllLzawq+jBhlJb8TBRrrcXYq2MGLhrcokuz8gAtjw9zkNKz8rSFP?=
 =?us-ascii?Q?j1qCsR4JmCSzy6Q/1uVQFheuknt9ncMIPHX3/3xm++MjQETxwtXbbuMfai9u?=
 =?us-ascii?Q?EsNaCnB2N32jLKgNrj+euWXiBm6kdl2FWQQxjF5eGKQMRDsYsI4XiS5lNLcn?=
 =?us-ascii?Q?FSbBEAAYq+RhkvmjZnmpGM8MogalMY16jAcINHmVmta9TRQyv/5ieG6rVq3h?=
 =?us-ascii?Q?7BxRdzsLt7ThLFViMjbL1GYcC5KeBjRuH5wZ7kcSBmnLX7gfBYBaNf1nQZ33?=
 =?us-ascii?Q?/fsJRegCo+vI3VsNfbeoIU4B0MhW/R2ZKT3SQWdJrAmgNF2FMBhpAItYLgBf?=
 =?us-ascii?Q?wvMGEJjuOfg4zLEfyy/ZyaNM6Y26+o3wlvG9vhvrPcLWCAbLYu9zQEcGbbVg?=
 =?us-ascii?Q?5zD1YtphBDAvEHGmUI8BhWfujOWINiMamPtwO2xkEPapIFrR3AYHqDhcJBdx?=
 =?us-ascii?Q?KhEvjHyxTMVxn3/xEZXkDn/8QdU1DfbkKX3lgfHzFhlGl/qggDNhWu3KY1pr?=
 =?us-ascii?Q?wn3b2WaAEzhpcSCD8Jc=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:25.3133 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfbee03-f7e4-408a-dc91-08de239a46df
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5949
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfX+bVPeVg+0BpG
 hU2v5nLW5BCCvCpx3N5XEyAwDHkcE6o05+y3bBZuSd0kWD50oIMpVwpL6YA9JHNmkQ22JOxE1nU
 5YGHY1wUKlO7gRDMvsmUYIi6tPDSmcguLEGsOCbtUAfdFxLsKbB08CA+zvowNoSqr8TkSTv4vjD
 xspxoFo6EVf7cQi//k3zgAaXhcwIScr0ze6LPbS/CaLF7dq9YOwIaNmSroC+mDJH+23IQoeOm3s
 Eif/Dl4FkQkQQcqsNpIa4GjefDlVT1Ja4Zo5CP0vKaP8Itla73iy0VVKBVRlGP887WM84E5UTfb
 SV23IEcsSuIV7N62BuCyYhVzd6rPKwkhq+LwdavyYYz2EsBo4hEkcQRcmebSP1iG472lOHfplxT
 nAKQIEeU9wXyKcIyO1DcoMLYiFYqtQ==
X-Authority-Analysis: v=2.4 cv=Xsf3+FF9 c=1 sm=1 tr=0 ts=691757bb cx=c_pps
 a=vGiblOlS/LqLBBgUNMMFMw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=lqvk1sNpEJAYIVC-Hl8A:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: SpZy6_vCAzUu1psB0_-gIpL_Bv43kEwx
X-Proofpoint-GUID: SpZy6_vCAzUu1psB0_-gIpL_Bv43kEwx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Peng Fan <peng.fan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Subject: [Uboot-stm32] [PATCH 05/23] configs: stm32: Enable LED config flags
	for stm32f429-disco
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

 configs/stm32f469-discovery_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32f469-discovery_defconfig b/configs/stm32f469-discovery_defconfig
index f0aab073bae..37e48698123 100644
--- a/configs/stm32f469-discovery_defconfig
+++ b/configs/stm32f469-discovery_defconfig
@@ -29,6 +29,9 @@ CONFIG_CMD_TIMER=y
 CONFIG_OF_CONTROL=y
 CONFIG_ENV_RELOC_GD_ENV_ADDR=y
 CONFIG_NO_NET=y
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
