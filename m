Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DEEC5E33D
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDAB4C62D36;
	Fri, 14 Nov 2025 16:24:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FBCAC62D56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:45 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEG9f5P2622965; Fri, 14 Nov 2025 17:24:35 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7k3vys-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:35 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOqUBuq7+mOun1pH4fey2hnOokIMWZts+PIkQta7Gu0ez85iFz6AumxshkpDJmebadoFOxkX6bcjE6vYoSQ7IpbeldgSuNPcrzDiK6C4ls1+xt4Mb7kyb388hRhO5l1B1CoftCmtEGRBfLbzNg8jY6eP80CFMxasOhLqgJVFphkQEYLbTcSSPEVGGXi3PLpBuena3SU+9WtwMan5jY3uf15T8lXkfDsvR6LpT0SE2mgKLcWgsPTYlRJaAiilpmyS0XviBuT4ashP68rV7aDRWsLOyizkUDA3iKv2cazTmZXHDAGLNtTRglfF62j6buer8J4wSUcyWRLNgoueMdNLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/3Mf5xtCYQhClyCEPXsn8P9NYFS3H8fKFVvcR+V6IE=;
 b=x40S8S+hOzFG+RVa3I/rfs0hc3//z49+qkj2dSi/ze2/IYT16g+OSggCvwJsoY9jZb4nj+qs7+38rPIN9tzZzSTpS0nTo+GxzcDwJWMNO/0MYh+c9K4HsDTdGOxjmkJWP+iXuCnoKgBV8Ea5EKjRtwlActyRyFp1m7pzLQ1UtrJOThkjTeBKuwegz7l3Fc6xNfjQg3XEUQvUkEizTJSZ2+yJ2cb4yqviR9o90tfGD/W5ad/57vgw4EwLMxLAJCUY9FbpiJqNkKr+e8QpiOgClZ+IA9/MWHV/H+gHC7HY8htjxdHfyFLJcPy7DL6RJbX9BAX/dTHE19hGu/HW2LHkQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/3Mf5xtCYQhClyCEPXsn8P9NYFS3H8fKFVvcR+V6IE=;
 b=VIChuRAyKS2HOacHXiV0XisiPng9iUt3XFA2tDdFLf399qIMLhj7QpsCMHIifCGNHTG+uxA/dm6apIzju0ohQLZ5vgeIcSrj87LX4LFsx7XpeTcl77nK1Jex2DjNdeGD7EhQ+OPMyQZ8BCK4w1QzD5AshfKWUZQIhwFjaU90oyhwQNufzlucIRvuGWgtnSUupzcPFgi4U7Iu7G4nnqS+iacEt0TiQWOkVbXK2Zt8zcOtoVx12ZTBQ7JmKf1hoSRodkRD7Ief54jF2qvu0tV7MdVqoiHAjj1XUlbZMEI1uqTpQv8Ca9MZLfogv70vH8BcTD8IwNcOOgULEc5AX3bZtA==
Received: from DU7PR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::23) by GV1PR10MB8823.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1d6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 16:24:32 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::9e) by DU7PR01CA0010.outlook.office365.com
 (2603:10a6:10:50f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:24:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:31 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:42 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:30 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:46 +0100
Message-ID: <20251114162417.4054006-13-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B89:EE_|GV1PR10MB8823:EE_
X-MS-Office365-Filtering-Correlation-Id: 819f06b9-4fa6-4a47-7ff4-08de239a4aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hfBVDTgipRPRnnzdfeDR8kjs8pY/feX7baoM02L8DDDPPCobHQZR1DTeoq2i?=
 =?us-ascii?Q?Ujg1xdvJeZL0hzWhKVlRQ74NpfRLCGNND6Ed6demd/68zrUdqRKkjC+UiibU?=
 =?us-ascii?Q?0HJjRt4WRlWfiWQxht1hV2VF6V9dvq8MQHh/H3GlRglbZRb7PZIWG3Ue/R+C?=
 =?us-ascii?Q?EoUE2H/pIfcinuJtQIhkY/NrDmR1d4hiAtKlN0I8K6OcfBsk9fl4ztEu8zll?=
 =?us-ascii?Q?e359zT8NIFI8wSHJfstldqoizSVsSklIxGPJOU/2OjaIkQJQsFw9vMbvq9Gi?=
 =?us-ascii?Q?u6W6+H9pJUyw/pmTPb4c9/bbn448WLU4wbw0xu7JnitWPvzYXIrRuV4bCItu?=
 =?us-ascii?Q?0GapWim25GZ9Po2wDGYSXIGmlgJ0BBg/TwITdDGqPW2PzJ1sH3xK8iZp9xn6?=
 =?us-ascii?Q?7wGdAtPjkJzGjKO6KFas8o/PS3AsLM95RFm/cD6A3dD4bUN1rbxSDWJtb4e2?=
 =?us-ascii?Q?KCb7afFeGavwnHI5rUF3TrLp/uJExcUxvVXMDsyjLsENgggZG9e9msyNKuL5?=
 =?us-ascii?Q?dXau9Spo2kEsshejh/2rKC6jfvlaJxDz/JmyBBCtnJ8ZtdNeRB6bRDIOanoN?=
 =?us-ascii?Q?T0OI56ipHrvFrARiLgG2tz2yqhLXGFB596674B/7+uVpj/0aCEv9R74lj0ak?=
 =?us-ascii?Q?O9oLncYbp1zXyW7rsn7YZJdo33s9vt0MBmhQLOngS9THIEoHxkPG4Mk/Evm1?=
 =?us-ascii?Q?/apk1hQBkaoqPNU9RL02SxmaPippoDMu/NOfZenWphFp7KWRG9qGH5mANfBs?=
 =?us-ascii?Q?Bn3BbLTM9OBqSIUeRQpTh1ff5JztPhFwBW3q8aV8m7On2MQopyWuuWDREwqJ?=
 =?us-ascii?Q?MExgvv6uGbNsFXu4isu1NuSrvOHDQIQFeaNJw/9fpE3ziibKqBktEtucDdGw?=
 =?us-ascii?Q?CH6m+RLUyI12AkdT5PX50T1D+MIa0xZuc/yjaRqdAWO3rQQwaeCNbtQN+bSL?=
 =?us-ascii?Q?IPN49bK+oCenjKYUN3fNI88Ov1ZBRO2jcc2xsbSKovC8HIxLSLCL8L7F/obj?=
 =?us-ascii?Q?fPT7LZQLmd98ck//XWwfYWxdVU3t9oq8nk068NIPDvdXLlG5Gg1B4FRBdDou?=
 =?us-ascii?Q?BwKy1c2OwKBKeTQ/zyJd2DnyiHi+XaSfXYf2AEWiHeeL2GhfRUJW+YSiaSdM?=
 =?us-ascii?Q?HtgqTb+DRsCi/jVxG3YmMcoHksZXyCunPuqqBSsX7y+hTb2FWZgflE+1Bbtr?=
 =?us-ascii?Q?P4Lw1Z1xtRpZbPkSEzwIR7xOAme41Q/qj6CnUXG/GG2lYTZovgZIcog0wqYS?=
 =?us-ascii?Q?rrxKPd6mPOgGztBURLNS6rG9K7RUjIp5qRCjc5442o1uuz2XDRpdQsjiIkis?=
 =?us-ascii?Q?Id5ZWW+6v1aSMAnbmkq3UWspyeETr0oMC+oVEYpygKdAkaBwvVv1OtAU7kK5?=
 =?us-ascii?Q?7/VWX573mUefTxlbTPEOdr+uEWHigGVtSqb/Z9ni1wn1x/zg+B/sVgMyqkrm?=
 =?us-ascii?Q?CMIjFZgUY98SRB+xTM2gpIkKP+LSgnUE/C6uhmUX6Kcp+MtlN9CvJFkrkfzu?=
 =?us-ascii?Q?haP+dQgLN1xPmuZar7bkB/0VJvday/7JYdzqTp47Tr1gMSTFlNNo2t9a+KZ5?=
 =?us-ascii?Q?gnvxFH/GGpiglWwKRCg=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:31.6090 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 819f06b9-4fa6-4a47-7ff4-08de239a4aa1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8823
X-Authority-Analysis: v=2.4 cv=KoBAGGWN c=1 sm=1 tr=0 ts=691757c3 cx=c_pps
 a=9NijP97rqpDLg+ixQ0bNSA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=SxxZRTMbgU000sIlMgoA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfX6nKsN8gBhpR+
 4fmDXuAowxN9kW67TudQW59895YjtnBb3fqoMf86bSxrvqBD8NI2EcW6jjH+P/Df/CWntkZW003
 dgnGrkhlAmMGRUG3bMlJLqvh5qKJIrNp392JEn4CNADyNJU4IErbV+/LhE3mifWCjWdqPAJA7S/
 8ImkDwzyRfG00pRojGb7woXxb5H4Md9yy0uss8sR6aBZAhHD+RHsZoBtR8/nmeXsRxYS2Iz8wcW
 /q9FAB9aBm7hmT9hrb8YIY8QiH6skzHffxkSh1t7v3VX87ifxtJ8Fi9/9mkobN7neh1MJ01vDTP
 r3ArDD6m0ym7WuO/dq88EHWTGx3CKcGqXYH7BlBIeh31jkL/Qoq/4kdYB08+xnumYpSb5MWRZ+0
 8fZ07/Zp5CYsOpAJ+ICNK2gSFBGQgA==
X-Proofpoint-ORIG-GUID: TozGllrPd_Q9FfPV2NxgjZTAZcv_6xWW
X-Proofpoint-GUID: TozGllrPd_Q9FfPV2NxgjZTAZcv_6xWW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 12/23] configs: stm32mp15: Enable LED_BOOT for
	stm32mp15_defconfig
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

Enable LED_BOOT to use led_boot_on/off() API in board file.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32mp15_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index b3ec3898861..c13bc1d0360 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -94,6 +94,7 @@ CONFIG_HWSPINLOCK_STM32=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
+CONFIG_LED_BOOT=y
 CONFIG_LED_GPIO=y
 CONFIG_STM32_FMC2_EBI=y
 CONFIG_SUPPORT_EMMC_BOOT=y
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
