Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 369D8BC9C57
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 17:26:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE49DC555B3;
	Thu,  9 Oct 2025 15:26:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 839A2C555B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 15:26:30 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EFPST000399;
 Thu, 9 Oct 2025 17:26:20 +0200
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv69mshf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 17:26:20 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p27J612UjHud1ixQfSGaup6T2X6FbNvpBySiqsx1GOwffWqzBOYi7Py5GoZXMgGl3x5nf4EIVmfcMQiYI1avbIU/Axd9gWJGZnGdwbx+lwdPWjJXLswRAzNV8CucKOkEeFoBlr0TzUx8ZVBPFoy++0m2/Km/F196RHXvFOzrHBZZXMzMl+xb6gLTtRUbqrfH1VOOKQjP7LseU+o0MpMvKMHanIw7YgFV4NFLYDsZ0eqEXfqHBVjy77tR3XBBvMloGUsBdpN+NDLnfqS/A/6ft21wnM+vPDOLuJahvqPFZZHAaPnkgNQNeguBQun5D6Pug4xasejZ/k67VKUIQf7x9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2m82sEqK3fkyLlR6JBgmd3tLeupivE5oQjWfIFQSkeM=;
 b=bIIQq+qo7IrgvjcSoZm1Ds+jNr7Ocz4iqRhd9059Q0gSmI2jWn6WjgUyRlY8NJ3jtP2lrOax+6dhORqaQrV2lOvP5lNpxnysSelhibOXxHuBX2Pl7i0l+/xgeA3gzbTGXwXihfhES2d+eEjUymaYSpEEMF74z410LGhyWzgwvnyjqBBWsBBRP6GuZtMwd6v8Kqoj7zhVPap65ix+Bj13LywrRCTndFrB8dvi9DgrV+tXMGOt0gyq+Ru5ebwdXOYYUA9GddyWi7TZvEDNJdnCu9fnYId3Px1olIRTMY4zlmGGqgW2bGI/I74hc2sgKaBkGUssjdFRJ0uyrm4dygXOOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2m82sEqK3fkyLlR6JBgmd3tLeupivE5oQjWfIFQSkeM=;
 b=f0UQXO7o6DIpFIMMB9nj++SPWsQn8C2Do/Tin+6z4FehtWFovriSkFZLOMYO0tqxq+w3QHpVEX1FZtJxaDR2zTg+czCL/tUrR+9DSlet9GkY3pgBkRqQ0mRw3dtPShJUoo7opPrXcSCAL3NDFgLEeX/VklqTPIGvAql9LNQPKWO4lC+uTuYTVAZVjesWKOVXMQ+HaGUTw0QxsnshatVnrVfIPlqY6KClXVHEUzaeHwS/pD5Soml3rFemWxrnZHhm0YVV2xp2jjhZKhn1yEHKjd768t90jiElhrxH+f64UWQSU27G/m1L6kU/cbWFyEEzmdSJkB0861+qtFAa82lfBg==
Received: from AM9P250CA0008.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::13)
 by DB8PR10MB3816.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:166::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 15:26:16 +0000
Received: from AM4PEPF00027A61.eurprd04.prod.outlook.com
 (2603:10a6:20b:21c:cafe::37) by AM9P250CA0008.outlook.office365.com
 (2603:10a6:20b:21c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Thu,
 9 Oct 2025 15:26:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00027A61.mail.protection.outlook.com (10.167.16.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 15:26:15 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 17:19:07 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 17:26:14 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 17:25:59 +0200
Message-ID: <20251009152610.300154-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009152610.300154-1-patrice.chotard@foss.st.com>
References: <20251009152610.300154-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A61:EE_|DB8PR10MB3816:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd119c6-4f96-4d36-5fbe-08de0748300b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y5UkDV07FLg1JYq5AF69ck2pld5Qu42EvYRPlPlX2juDpL9rNMrinvRFjCmt?=
 =?us-ascii?Q?wg02DEYpEKXPrcKvIq4wW6WkK29ZKbWUwObYYrNBPTOBm/ypxmdt120hVDwH?=
 =?us-ascii?Q?dHFHft/N3/TLS8IkCYQPRBlcK68TlGY01N+pgMzI18XvVl4diujDmzC8urnM?=
 =?us-ascii?Q?CUnVHVG9V+mNFDyo/CKyxhMwZMG96SJ3EzCd7JJ4k4QHXejXi67SvV4rLK6O?=
 =?us-ascii?Q?9Ts2dmqaxODxdWar9TT1GKEUFEbGOdmsUjUyrdb5j3ChUnvbFFf1eDkKjVjN?=
 =?us-ascii?Q?8xPOs3VPs4FXCVrW3PnrH97ggxD7LM/pEU+oi04VpUFapTge24QRzcHsxauu?=
 =?us-ascii?Q?Ba3X+CvK26ftz1wtliRuGuUTsNbuSieFQjwF4pLyq9/QroTDLIVxS9lCjPRG?=
 =?us-ascii?Q?9bNsjlAvFRtnItXLPppDBjlPfDGnLTeCIdV9dOKCnl48um7L0y7wt9j7dm2x?=
 =?us-ascii?Q?+kq3UAV+sHH1m+w1Jrzpc4dfnr6ttoK7cpX2c+h9FyHWYuoUzC9p+99wJ6jF?=
 =?us-ascii?Q?B/cC9Ozj64D0rU0PyXif+Iv64WUGQXy+zlL5kW9Q6702POME6oTAvmxJC6DY?=
 =?us-ascii?Q?jGGZLhawfBhp/AH5D4+3WkkQKTJg8jVbpyz5Q8O2eb5Iax2FgON3NhZDptu0?=
 =?us-ascii?Q?AsUo53B8dXGOtdVLSmPZcFrRwbUMrSxd6WNII1evO3ywMRwl7dFDzidOS+rq?=
 =?us-ascii?Q?FEW96BrLzyvRMCuoR3AyhZKo+f50TPF1oosK4zQdD3iS2BxCcnWSRAzhDGRg?=
 =?us-ascii?Q?o8eSF5SClLVwk5F9aGUFNiChayyMzvyx2jskNXLe3Y4msWd2x1BzxVxxZ5V4?=
 =?us-ascii?Q?gyjH8WL4Djn1kFjArSAHhhFYQBbPoNdjHciiFwR2L50JvpflfF84IUTIgFFw?=
 =?us-ascii?Q?BRQfvsqawK3BFT25Y528FwABzwWSu6br918S2biZSjahWKZwc1UPhXpZP9sy?=
 =?us-ascii?Q?+BEfdv+Zy+ve3W/klgmPRG0Z/d1ZMvs6uIv3lVPrJLQAk4I1PGOUQynpPuXS?=
 =?us-ascii?Q?mQ/q6FYQhtMBIIgglO4Lkvpcpk/Thq4zK4tgRyAeW1n+THVAFA+2z5UDz/Bn?=
 =?us-ascii?Q?PXdkp6JnZcRriJ9d00U+vysXiEdQkElMRMg3dVx6PJ6fGohA6umXNBALSbEU?=
 =?us-ascii?Q?ixyDDd8LqEh9XZ52ePB0APT0kDGBvyXKiCwWYwqr0BMcJuR1BnHcx5L4cXU+?=
 =?us-ascii?Q?eFuc6+w55IffhH04fwdckn6Sm36ThtgxnaSA/ZSQiqY6sPhrohQUAokWkcI/?=
 =?us-ascii?Q?3d+dGREcHVE16QtnCJfaQ0i7qVltSU4GnDU1E9zLIxJBGJnhED8Spkf9CH8A?=
 =?us-ascii?Q?eat4uDeauhDeyB3TfkLTG+Sm6uewTTr5h40n7zvfniNQDjQFjNsj/ialP3SI?=
 =?us-ascii?Q?rJ3oJnJClpMzzvygvDKnWTnoDNWG7qy+NO8ksJ8jeHRV/HE+94uhFF2cXtkE?=
 =?us-ascii?Q?4wgqieksGIJiA+mHbvdUCRJdzF8F0s/5sDqTNEMrjzOUno4WURWOxz/3uleJ?=
 =?us-ascii?Q?kwiWhfX98zYRNzn+E80wsQ/UnR9y88vr+vco8Tg7+cIiJWPed0mRPjFxi8jY?=
 =?us-ascii?Q?9+BTWcgsi85UuTzcZoE=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 15:26:15.7152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd119c6-4f96-4d36-5fbe-08de0748300b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3816
X-Authority-Analysis: v=2.4 cv=F4xat6hN c=1 sm=1 tr=0 ts=68e7d41c cx=c_pps
 a=U69z0xrlobRtR65H8yDefA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8 a=ohR1Fj1OpG6KedVfzL0A:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: IpEpCUW9Wc4qqJyxZQotbfAkH_4-iPCf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX+P+EA1N5SFWF
 rj3rcfgheeMUgQrcqOUMo9n/6qdYsQWLbWIKg7eX+F4s9jdnut2KNULiugz1BeLYk5KtQ7MqnHq
 gi/XjpOaAoNFj/hX52s0sm1xCRhx++DDcZVgACg/nK6nEmq7p3jE1Vjk85lYdXzdoZY5EjaOC0X
 uortmSCtJ1o+yZIFXGA22xkhLeHDiQROu/0kLTy0664cdktzRB7Ag+MlY/P9q7cwXgeL07J4e+C
 nVirj9N/zrIszB3v7gN7yaBu4qFYLm2bgs3lo/Eua8TELbrQqyvozQJESQhxZSCksrjQso+nGQH
 Vmt8y12nLDIaMfoWm2+sesSL4NtzdGr5JFWAX0vaw3AeFqVGFJMWcujgQWBOYQ5WPGzWakWTeGP
 RLg7ZRREAg2hcjPpwUpf36OAej7iDg==
X-Proofpoint-GUID: IpEpCUW9Wc4qqJyxZQotbfAkH_4-iPCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 2/3] configs: stm32: Enable ADC support for
	stm32mp13_defconfig
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

Enable STM_ADC and CM_ADC for stm32mp13_defconfig

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32mp13_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 3283e910219..8ef465ac222 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -29,6 +29,7 @@ CONFIG_CMD_NVEDIT_EFI=y
 CONFIG_CMD_MEMINFO=y
 CONFIG_CMD_MEMTEST=y
 CONFIG_CMD_UNZIP=y
+CONFIG_CMD_ADC=y
 CONFIG_CMD_CLK=y
 CONFIG_CMD_FUSE=y
 CONFIG_CMD_GPIO=y
@@ -56,6 +57,7 @@ CONFIG_ENV_REDUNDANT=y
 CONFIG_ENV_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_MMC_DEVICE_INDEX=-1
 CONFIG_ENV_MMC_USE_DT=y
+CONFIG_STM32_ADC=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_BUTTON=y
 CONFIG_BUTTON_GPIO=y
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
