Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FD4C5E301
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CA12C628DA;
	Fri, 14 Nov 2025 16:24:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61034C628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEG4m6h2968293; Fri, 14 Nov 2025 17:24:28 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011042.outbound.protection.outlook.com
 [40.107.130.42])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7kkrf7-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:28 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZaezzv9iDBTm8jOoDBngdNJEuFhf28Qu72/WSokOAUxqlVKFfs90mP9Duo9RNzSPDEQDjXJL6xXtGAYa9/zglZwUbJNOLHU6MdKZDu7iSFWME9G5SOttiuM8GdU/zTEs+f/rNh9V1OnUHi1xoW3+fHtm3kGrdhGzHdjW0V1cjTDSXhLsxJPCxa6sm7CAw/2irrJZCKC4udk95Qcu56z2dqrDELFTR+iCXOKnzNYlODaK3YRAXiXyhaR6A9kRwJM1TJeawZNKrSaZOURIguUSp4gUaiCiqfvQFbxCFkOu3snYRkaC920WzEAo8CxtiQbyao0nNFZzHIvlZ2PAwf/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXtAQz+qvjZshfsw11rImB/u1MeKOxJagZrUWdbO+fA=;
 b=CZmLrdF5XEKyj9BNc5akCv9W1b4Z1J40QsUo7ZlcI7ameV4s24f6JcC6siqDSG6Pt+Jq7fbqApWyGxz7QP06FZeiiPnmab9F/fzXnbkS4TbBumeKe7MGz5dPG9f2eJV54f0WP3poejrYPHa27vt+K40oD3DZE7YaYbDHzzC3Z26h6TjqLoWtIhRZ4JzcxAmbdPMgQFJZY1v2u5s3hhINLaiQQN1nOvFartx5qdsuOy5SA/DfCaDK7NnaqPK1tSXe1hEj+8cxaxqZPdaVOVLpU62zt46hHb6iJ/mfFnAHDX+uHzPcm8x6Is2JSZKBbF7DK2Ky0RzsFGIfLhBQg1czuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXtAQz+qvjZshfsw11rImB/u1MeKOxJagZrUWdbO+fA=;
 b=S1ASakXM3BYDkEqDn/Oiivw2IvMVIqsUmE9XeFbkXuaKPKy1dJfFZcAJ22OkFPZY+C7lGMaf0lcTmROS/HyY8ZhrrnGI0NQV6+loA1YFM0Ng5Pb/ntWuA3dSzYRiJ3iPY9/PyM0ttx8OhARwfmR9C7rYWM7Sil5AiIg9S3y9Cje4D2NNlpeZtzfDeToWfLiy7KzwPZXqUqFE++JiiCgNJVkm3k7unhRI0ykPOXSZQKUoTZnxdOTSK1W1MGJYAVWgimwJ8xDyWQFRrnBVrG67xODbjcYY21lWCt20Kg4xcv1dU68gs2MHmMKQRPjrZlFOPk29LGnUtl+LQ3DbYypT1g==
Received: from AS4PR09CA0007.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::8)
 by PAVPR10MB7035.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:300::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:24:24 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::14) by AS4PR09CA0007.outlook.office365.com
 (2603:10a6:20b:5e0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:24:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:24 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:36 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:23 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:38 +0100
Message-ID: <20251114162417.4054006-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|PAVPR10MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: 456e6762-1fbd-4b85-5413-08de239a4643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o1scfayTBfB1n+0bfxPCPJXRDHmM9Nn3eTO1ooE/6B5LN88N9MneLmNVF6N3?=
 =?us-ascii?Q?OAJqvG636F8/rdW4sISp0x9EOMbNnNZuSf6obMANS6ticndZvP6RlCSPsagV?=
 =?us-ascii?Q?ndd4ZIxJVCyEBa4RmkWY+E8L0jm0t8DcObbxIYkjxWE5VqGn2XwjhyoUCmjk?=
 =?us-ascii?Q?5xzyPeJ7WfyBKev48EUWsiOnC6630x2bAgG7ohu+SKVPLcwH9WilBWw7pUis?=
 =?us-ascii?Q?GAgHrcSAcOyJSV65iWaBd7er6eJBTMDRAKdXNce/uT75SrmkN/XaSWPJGhZu?=
 =?us-ascii?Q?PXa3M45I0X1R85FmYiFyI6Jk5XlkB7hLlmTIsPLhYQYcKrWFNxg80gBXuEwT?=
 =?us-ascii?Q?b5Z0GpVfoGgGodL6PTeOUOJdhVbeVfiFkY+lxdWlCvxWDSOMtyoHT0SQRlJg?=
 =?us-ascii?Q?owbmRdnnLV8qdBTVfOuKm39kpTRbNev/7KT1fS+wHhfwnb1mWWSDJ7tsHqey?=
 =?us-ascii?Q?2OIqdCnttBixr//5NvONzkfOk2wARB84UwKNZM2pgbFKzBY9VP2ybDtPhDpv?=
 =?us-ascii?Q?acT6rTnyZxWvi8+M660zQcxsaQYnEaBC6cgKvAuWrFRziZDysYyf3Pq1ltZ8?=
 =?us-ascii?Q?9SulamTEVryMTgMCEo6gGurtRv9xQtQQjB1QARuYSfsHEpnl3/xqoGkV2d7u?=
 =?us-ascii?Q?c2LeKNW2ldWdA5wq4/gOHcAKEeWyemf3dg8wmwaS6t7NwaMgy1FHEPAaBrxL?=
 =?us-ascii?Q?AEu4Vy1B4SD/n2yip4HoOICSUEr7vujufIz9miE9lhZ/peVF9+yQq2R78QZv?=
 =?us-ascii?Q?2uIqeQl/Qn3n7jy7pksN8mnu4/IToPCulZkgKYYIqF2eM/tTUsVGe8DIYsRc?=
 =?us-ascii?Q?nJJDgTYidBwQhKZ7rgvwUPONmuNAODwF924ZvwPqNoO3B+IVjSGqZ17vKYoU?=
 =?us-ascii?Q?DJcy6phbz96lSgMd+L9cJV2S7JhgBgSQ1gH+T0hwNBiPqkh+Wltt7s2fH++j?=
 =?us-ascii?Q?NojMB1yDIugZB2z/Vhwm6hekrsqBXqdDoGwNh51YGVS0SriokTsO6LMCTrvF?=
 =?us-ascii?Q?Nr27GhoGZBsB+nYeMlkYIHzlEZb7GeKVKRjActvcak8kPH3SZoCU9eFFleJa?=
 =?us-ascii?Q?dJcOG6w7pixhW6yeh7fAuyyCO+1n89xLAaGkOFC+QQdZi9CsJ00MveStuoRM?=
 =?us-ascii?Q?73cd7pyt575rzq9oKLRiTlUeU7iFyjBgqChHcAkpuC496EsZPO1An3fQrhNl?=
 =?us-ascii?Q?T3p9iw6nessZCb9IMDJNCaF3NhyCO/YbXjJhr0ZL55j78uiDUxK+VRgRxOvG?=
 =?us-ascii?Q?Z2/NL711z1kyTJIt+Ydhwsx9bINBCL69W5X/maOpdUfrcTXvanW97uMx7Cys?=
 =?us-ascii?Q?yagUyO1LWYwSZrMl4NXd9rUrS/S1Xg56XKp4/1v0n8X6cJhKAyhK1SCHs8xP?=
 =?us-ascii?Q?9WQHuoPYdJWgwGNQ1DVlrVrYspqv2sybLFpIPzq2UKQOozCjJRXCDB2Wp00M?=
 =?us-ascii?Q?CNZRKnKPtsOCc2BwAegbQY9XTPCUFYzN6mfpd7MpzmLzIw2rD89IYm3ciMq0?=
 =?us-ascii?Q?VuLpSrU1i8sbywvqsg8ioKFuhjYVCn0zhg3n5OYLuFvpWRF0GwtrqdWriSvj?=
 =?us-ascii?Q?65VzRvoTIaWmSYTECIQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:24.3154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 456e6762-1fbd-4b85-5413-08de239a4643
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7035
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfXzJTcQ+RtS1TZ
 SdKQlxkMl5sdBuJ97Ah8KOblOmQgyTxRIEvJT1L+ZJwn1Ve8tqBF0rSRLmafhzXEDdTV/GYe+kS
 19+x4cRjlLx4/4OPb/9H3n37Erj4MYcDbnICwiw0QrDwu12nKcKpo7GnSN/s5mYm1epngJvwt+g
 RpG/SsZmZoh0z4PiFpNe5utfQ5GkU3MvB5uzoQv5ZQ6kR26D+py6+nsjsd3fChf78EaYDxoL5wQ
 cBPA+vo0fGZkJrUHs1KwGd+K+tOl3mVTRPW/uHOSRCzhmlefk6IWpYqF9bV4UdXqhWdeKpie/rV
 K+Q4GPt0M+h/8wWQXnsO1Fn1U8KCpz8DUCoIzVuhBlfGE+pxu4d/NB9UhfwbeAYI63iulsIxZlr
 4c/42QYOhoAIn60//OJmBjXH7H4Xcg==
X-Authority-Analysis: v=2.4 cv=Xsf3+FF9 c=1 sm=1 tr=0 ts=691757bc cx=c_pps
 a=yDZzXipfDhsyT0oDmThbuw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=5bQaGxpRYt0dtkHQkKoA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: Y_t89r8wzLVNcEJVWdPF16S6gN-Yp9lF
X-Proofpoint-GUID: Y_t89r8wzLVNcEJVWdPF16S6gN-Yp9lF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Subject: [Uboot-stm32] [PATCH 04/23] configs: stm32: Enable LED config flags
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

 configs/stm32f429-discovery_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32f429-discovery_defconfig b/configs/stm32f429-discovery_defconfig
index 45dc8bb0cee..2195b8867dd 100644
--- a/configs/stm32f429-discovery_defconfig
+++ b/configs/stm32f429-discovery_defconfig
@@ -29,6 +29,9 @@ CONFIG_CMD_TIMER=y
 CONFIG_OF_CONTROL=y
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_NO_NET=y
+CONFIG_LED=y
+CONFIG_LED_BOOT=y
+CONFIG_LED_GPIO=y
 # CONFIG_MMC is not set
 CONFIG_MTD=y
 CONFIG_MTD_NOR_FLASH=y
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
