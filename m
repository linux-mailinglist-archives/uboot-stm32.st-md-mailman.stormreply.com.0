Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E78C5E34A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E890C62D55;
	Fri, 14 Nov 2025 16:24:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33D18C62D20
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEFwF7L2955871; Fri, 14 Nov 2025 17:24:38 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010068.outbound.protection.outlook.com [52.101.69.68])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7kkrfw-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:38 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYgQaT+J8wmMPDNVFhmrOqeLF2z9wD5HqXJY9ZSvFYdAyDMRU65LNPppNIrOwuLisioGP0wg7DC3YHH187CNFayVpsVAU2GkFaeP6GYAcIqUIpPXw/Ut7ImB4tOYexWo0HG7gssW7Ef1k13IOW2bP05oVPh+vQ+kNDfHQxBiU2e3AAbJGMu+IzMQf83Pl1PsgIjiRha7L1vNIvL7el6O1Xmzadrn1vNrYFoMUw+QLYxzhNPSAiNXnmJAMr3lzdWjD0EuwgjRVt1FHHch+P55VmElvO0R7gd3JiLsguqVj1nuvT5JSI5naN9Njat2WwEBqiqp+TvKeK1pCKPnrpnslw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mp/3mkiXDw076L/Ll2Npww3sAAhvX335pAJwKvMGTW8=;
 b=oPurT07uDXeehu3/0PEZpel30IgkEJ7sOpiqfTwf0DDpZPeHGo/2WFaLYl+Cu5jC+uxzh4JSBBYvydcDCHYELSssNL1PTRfyQ1q4WoQbNa1lYS4TspzSnWguM9nvRUgqgW//b4ZMoH9VHrq/KIs64S1y8IE3tdVyooTWJLcE9AWZkq8HfiDamV/hCHJHZVclgZ6mp7vYXamoz2mjMdR6m1NucJmCQH7HQjXfq/r4Db97Y9eyTKbanudHfEAsupOfjoVr31Iq8GXA1m1d+yBsvsdbktmzjYTtwGoIYvFg48jgNkJkOHtNrabD29KOQn3B28thCozr1cGW9j2brbmgAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mp/3mkiXDw076L/Ll2Npww3sAAhvX335pAJwKvMGTW8=;
 b=DZhe5E9AA9DYjIjciSzFXnPgCATQXyqsOPqc4zREau8Ce6Oot+gmYdfdbl/RC+AjJcyGg3tabHOX2Vs8EpNTKzb+CFr0hwMA0QU0MwbuGBSLPIGwtOH6eXmEJBdf4tS9X7fnh8VT81afiGKki0DPAaJireZhkVUL4YVCWrKYRsq9MRUdpNv19enBNZbFN5xBmO1NqFyY/u8416u2U4g7xd0TZLGJai3SEkq205+D4pdD/RtmOlMNGA6uzfQFvjDWrw3OCC3p+/n/5SsBMbu8I4vgMecQ2BDyfw5b25LPpPIbl1/OrJM3XvrQEpW3laFOggqoyIn8r2Fz9o5Y1kThuQ==
Received: from DU2PR04CA0079.eurprd04.prod.outlook.com (2603:10a6:10:232::24)
 by AS4PR10MB6109.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:581::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:24:35 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::47) by DU2PR04CA0079.outlook.office365.com
 (2603:10a6:10:232::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:24:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:35 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:45 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:34 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:50 +0100
Message-ID: <20251114162417.4054006-17-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8C:EE_|AS4PR10MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 746c8a52-8757-4b8c-bc83-08de239a4cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hzMaCotcwguhqJbIK2wQn8F51A7Woo/A+3BQbiRTwnQLeQ1biUMIroX1P1A8?=
 =?us-ascii?Q?znWBK3nr8GX+3KDD8lWmQXNwFK930uMRPoUKNWYCfCrAssMGiRp3jrZZZH+w?=
 =?us-ascii?Q?Lq/KW2sccfhTm7hooxqb62aAq0rcUjXGj0CKXEdfSE2byw2GOsBrBe1ZfzZf?=
 =?us-ascii?Q?nYhBnLB94W0tUc1xBrz89mbXFtQYZqSsmXiK+KrO+aWKdqOwqxMu8tWQnTou?=
 =?us-ascii?Q?P2ja8s+LEAKEXoRybsvBe3WyOkBwIv14bixDz48z9ZX3Y1uAMX9j1aNBgaUx?=
 =?us-ascii?Q?0/J1XbWqC1OxntnF4NxQ7RyRv47lj8rHKq8idGcjah9gP2kOUAtTaHI3pNmr?=
 =?us-ascii?Q?OOQvCRrmasBGDB6kd5v1Ac3D2Gq6llxWHiWS0VATaoESvILmPP9w0CGDjSKA?=
 =?us-ascii?Q?Cp4zjFXom84+qZSeKJKeS980n80EjkoaqamQmxQGl/PNhMMf+44GzhuVYaon?=
 =?us-ascii?Q?MKqRo1LYtgLsdZXruNKygg3i7TmJrxsuL2WYaLKDcICas/dr4ww8OlQjrtLP?=
 =?us-ascii?Q?WPFpXkLSwaK7L+48YO0qvFYctEc1u53ANmemVa/42tAulnwKYqe9C31XKpib?=
 =?us-ascii?Q?+1b/xRVTzZ5clg/AhYSqtZ6XHsrWb9WNAJfUhmmk1lZIhDrGL78QibktqvK2?=
 =?us-ascii?Q?/WIi63jjUzH1nljw/Poc60i6aBTdUNGK0FM7PlXJqZ1gtvVE9g4ikTMPlO87?=
 =?us-ascii?Q?pN6n0fxfiq41l6jkNqhGl4vilihy+YFTKs8n/yuAI227X1AcR14Baw29s39E?=
 =?us-ascii?Q?Jky/aKJz/ZPHrjBkSsUoNBJIrERTJlRIe7AzPF5e+PF2/GuZWsqw8p21YHNm?=
 =?us-ascii?Q?R3R1BxdN4BFqZNmgwTBavrmhcj1afeaAjehXt32jRCRtrw+g+cys7LSSbX68?=
 =?us-ascii?Q?Z/tNzGRf3tWHJ3WJGBXGf2Z/L3lczB+ZUG8OZP4gMr6YsSEttUvshMLjYavs?=
 =?us-ascii?Q?2scq6CYkmUfT9GPRz2GRl+pS/DQxrKK/v3noD0kW3+GkXEFgZAZALhIYKA9G?=
 =?us-ascii?Q?K2XGSRuXi6fqokb9j3heuWe7CWy+scF/zjELXbT4askUoI/vbxgkqN4+nb+m?=
 =?us-ascii?Q?VeWNmT2jH+Fcamu7iMqq6GqZ4HhzP3P1te5I1mlvYmjAQpmBGoQGUrtlC86K?=
 =?us-ascii?Q?6qYJB/0iGiqo9+DKBrcajeXFr4EHsNrZ6Yh6rzS0nQVj4KNPdeGbIZkbnK/t?=
 =?us-ascii?Q?O38pim2dD22qmoounzuOqdOq/A6RMRFp9NmhhM9yUQoOdX3wfm3uPjWu/tlM?=
 =?us-ascii?Q?AhjSlLfRfdP04v5tmkjShKrc9C9fRLHvN7oJ6pkYpBZ6Csw8h7DmRnJ5zgNK?=
 =?us-ascii?Q?TDsdhMQ2Mzj6jbIN6cpalxfeRcPB7YWR+t1OrmUtPVOyJGubAd0mjnB7jKf0?=
 =?us-ascii?Q?Mx9ip2fZX/+QvALk/7Ify8ZmygP5rqXAs/QKw7heDK4rVkTF0qqj0cP9dAkF?=
 =?us-ascii?Q?4c4+qK3fH7ekvBBiwV+M/zfTqDvkK9SOg2OPhD7BaJSAtj15lY8wkDtvK3KN?=
 =?us-ascii?Q?4/3VL54IfOSudodIpr7oRwPYMAUL9MIobFXED1kFZ5Il+4ldTRpPXk1wQusm?=
 =?us-ascii?Q?TJg0vxR44Ju5hJShCqg=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:35.2611 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 746c8a52-8757-4b8c-bc83-08de239a4cd0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6109
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfX6zVIljQzopoS
 S8ygG10V1e55HcG3j0eY1IXaC9EzAxdvZLQ/I9EGR2ivY7XEjVh5JPjGHexS7HdxNrAEV6EXAlz
 8MomlpzV80vdnlyscr8sFlltvi/KuZw6X/jRmWsmkAssOm8DLjETG1qK6xliu1FB9j98m9XZcmR
 bIjrO+aYjwzsxGntOdyKg9jsf/NiClOasCnOJkPSt+WjEhX/j7HFnoz1JHbt6n3yXgqa0z5tCdv
 lCdJm5vRlx3N1c04u4+8+4oyBsqCeaZND7rnm9S7BaMuiD4w/Kfwz7J/ckjqx/aJD6Ys6AYvE1/
 TFVWsAGYuuccGMLzH2xIsG/SviA6esWtu0evordzKc1ML6A+vVvuDjwcrvsmAyEL9d+4ayh7Kc5
 ySAMwTqC8J0sQucHsPuzqRN5gHviQg==
X-Authority-Analysis: v=2.4 cv=Xsf3+FF9 c=1 sm=1 tr=0 ts=691757c6 cx=c_pps
 a=kB0SkaDTNnQoKYYLKJpD0Q==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=SxxZRTMbgU000sIlMgoA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: kG6bcTmUaSHDkhU6bcQZKUxQCBlsdDlv
X-Proofpoint-GUID: kG6bcTmUaSHDkhU6bcQZKUxQCBlsdDlv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 16/23] configs: stm32mp2: Enable LED_BOOT for
	stm32mp23_defconfig
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

 configs/stm32mp23_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp23_defconfig b/configs/stm32mp23_defconfig
index 840855c23e5..49f47becba6 100644
--- a/configs/stm32mp23_defconfig
+++ b/configs/stm32mp23_defconfig
@@ -55,6 +55,7 @@ CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
+CONFIG_LED_BOOT=y
 CONFIG_LED_GPIO=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
