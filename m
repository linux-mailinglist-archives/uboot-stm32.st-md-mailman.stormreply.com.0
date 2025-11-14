Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B6DC5E19F
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:09:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79041C628DA;
	Fri, 14 Nov 2025 16:09:49 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2760DC628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:09:48 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEG1HpP2665022; Fri, 14 Nov 2025 17:09:27 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7j3q8b-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:09:27 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwlIiM7iafn6EaTDY78mlNSR8CVQE/+3YtDlG4gj7gv1XCr9N3SOiTEFpMMWVh6TjtqLgqZjDqpWTF+OOXTyEe3Ca1HMyJ1kfsVaIYT6L54Mi3dXr5Zo0x7xK1t3nQ/KPsdKmUnpXebo7CVfBkgwXpFZRE8/rL3yOM1SJv9l7w1xxAQHbh0PgXOaKChPRJ5Tf8jFOud+CKAhRXIFrU/kAIrVHCUXpW+cpHUWlrulkrsR+NR+yUzS5Z40+suNjPx/R0e/bhcs24ZT+Aw3vRa6/WrewiB/paa6YPleGZ7guNzB+e+pKAvEkcX0/iSo2D37jonZeiXWVwEolrOkExZr7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeedTYQA+prBn9+UN0WMuCrLXmkqxwf5u1qGNo/49ms=;
 b=c/pYIPwXA4cXG4WGx8VaS+7zj02TddFRNonbS+eA5DwBctZ3lWXAssa7M+FYBRDfIRAyDWbpy7qc/lVBA7/EW+oi6Eb5mj8q0eD0frasV/55hnCCEnIYvkTxFrVkpvQ5SyiMoYMlysX+6LKCPRdYU+htXadJHaMu6OS9RqA033ULjtS5RgzLtLtUzOwU5MxSGvFjfDMQzOYixIWjr3qdC2wDe5YYoVc6I4f+nPQf/Sjo6nYxAdwhaYrrU480NopNOMa7f2yCiYL5eZaAwTTaAaMhZrciyK+xBKXc4P4zG7vfeVQZBgYx6OMVgHcj2w/kxdjrT/ch93y+z+8Tjsuotg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeedTYQA+prBn9+UN0WMuCrLXmkqxwf5u1qGNo/49ms=;
 b=CaFDy376P+9M6+6LoQNKYPUCWZISJmYXtzDmbp7NBjQ+ROhWq+EzU50RevanbkLKt72ZKVgcq0KmX1BV5AiBiaMLz37FZXvX7UJ3zoutOd8rn4oLd+gTJCj4k+riPS+ZVQEHOwTLunqMLUwDc+G59IHWNc+gbgcZK7yTs0I60uev6X8mf5uyHeiRRPSwb8XiCFfWjlvuPlgJycLX0P9cPFo7Y4Nf9IqpKIflYQry+8P896oXawOXfOjttlz21N5SwrkYaLYiM/ZyqNLAqMfFxpEg8WAsNnCVNvRbgJf3LiQPIRJDxm3q94tI6TgqIfs2ZYWvo4eeDDkVZgmhIsKmhA==
Received: from DB9PR05CA0025.eurprd05.prod.outlook.com (2603:10a6:10:1da::30)
 by FRWPR10MB9278.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:187::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:09:24 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::4) by DB9PR05CA0025.outlook.office365.com
 (2603:10a6:10:1da::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:09:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:09:24 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:09:36 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:09:23 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:08:51 +0100
Message-ID: <20251114160916.4051853-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|FRWPR10MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e43372-73a1-474f-7c52-08de23982da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UVa2Rq+fpasy+k2xTAKjD6lgh+TvUZYmprelXFaZY324x9iyQUtjCnbcb17X?=
 =?us-ascii?Q?15Ym+tHMrG0dgvA/zC43bPCewpBhrwltfn88WHJkOilAyNTovQSUPzj7g2pW?=
 =?us-ascii?Q?GCo7MKuF004XdnTo5aLnwlmGYhV8iShlOY1ENB81JUDtiwzE2h5eWGat4AzO?=
 =?us-ascii?Q?BqfteOkqwEtCE+j1+EIXsOBDYBvCymy6K0sD1ga+fBHUASmhERWBWrzoSL0F?=
 =?us-ascii?Q?o2+zz36eZpz4V2N2QiYMRSSCukpLb2ecQpjymuSZuzVG7x++SCWzOyfqY+ci?=
 =?us-ascii?Q?SuxI60SUT6mZwX0yIsGuUMigkf1hHkXZxi0Zz/7vvNKWfbgtvDF8b7xG5KhC?=
 =?us-ascii?Q?/2D4s1Zo9VxysFou3MfAa8pZbhYKho/oCPc+mca35c8WYQDiXw3HTsiRPzzH?=
 =?us-ascii?Q?js0qB2H36WMBejZ/Hm0RwUKL3J1qdwAx/r2dH8grdxnscyZZsP3mEYebBft8?=
 =?us-ascii?Q?XyufhciuhT7DujpO+IHwBbcfYwcw0kqB796UFRUCrmtIbCykTzHEQS3MqZBI?=
 =?us-ascii?Q?G5VNG9HfRxluWsBYQn19OPaIP0RhqbA1eyy04B4d5FScDjf+PogAYQzF4vAE?=
 =?us-ascii?Q?fqasubUlXFBsuEbYkfVU2tNXe3Tuwd2Wo1Dt9mHeMSLOZAXnPywSbzwZItIC?=
 =?us-ascii?Q?nWV6s7pjWrsK1/uUvnP42f/G/IVQMKBX24mWux3JFKvH/xkDzWtPl+n678Lf?=
 =?us-ascii?Q?XQTyg2ytcXOAfcIU5L0J7GpZ9FQjOWiWj0Tj9tCjs6er1dE2Wzm21GE3pee0?=
 =?us-ascii?Q?hH8Rw7ED2eOrOJkPwGu/GbeE3OraSo7OSjdQbcLYUoVLhm1VZQ+o4CLFo/Wk?=
 =?us-ascii?Q?XLzboDSWPXRBAxjKbCBkBS/2+q3OzREBR17yVrbiJxlwwPecCpd6Mj5QsHqE?=
 =?us-ascii?Q?PXG9MXZCERgPuWji3Th5L6U++C22k9QlNzKuJ+AN3DRIJXCOu2RFh3Bq9a+o?=
 =?us-ascii?Q?IFOIYbL7W2KOeZPgbwmXApmhPs/rxsDUO4YZM4ur1+I3prHWrKo/zq2c+J9U?=
 =?us-ascii?Q?WY7aO7C9ANHX8aIFgKLhz7G0TUs7A0WeF5MC7743cfJMVd2bI//Wub7nqSBT?=
 =?us-ascii?Q?xjYwJdMqnuH5zfH84oikI8FCXICBdCbJQbQoCHVbfeu+ZOA/TTnzYMWrRTZY?=
 =?us-ascii?Q?rm26Q9T9aNVaXlpylUn4Vae8WIrS0llCoYYbJvY8ClFIfmPvk9y8qB+jQ+cU?=
 =?us-ascii?Q?iw6ICJfFSzKalcGoCVyLLMgvK23kpuzaDiSqoK2Zo6DAz7m0CtlP940WD7Xv?=
 =?us-ascii?Q?WveVKGhT2rHfQDqQcp+A8p1wM3id8FaDuuVcu5u+sjxGkzExWIG9GStnBaH2?=
 =?us-ascii?Q?IG+RU7Y/OCvaWE1BhwOAu9nzBifl11gB0Fq6YrdIyGlREjUBoC+7rBaTj2vw?=
 =?us-ascii?Q?pUNHutQV7xS2dwRDhCJ8mnrDcvgKRcJ4AGsc7RhaVz97CSjTv9pyGh8kdoDt?=
 =?us-ascii?Q?m4sypovE5ORuMDVx2xGoqlvhs63ZIi4gZ+2GFy4Ys1WjHGBBQoJM0rSQcmWg?=
 =?us-ascii?Q?BG7bZ+jACozNNiLCYcorz/nn8BIL93QDxPclL28q94m/IfT7Jz0x36W+4j4C?=
 =?us-ascii?Q?XRqcrMe6N71wzcQvErU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:09:24.0131 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e43372-73a1-474f-7c52-08de23982da8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9278
X-Proofpoint-ORIG-GUID: 2HibWZW3a8vWAV6ebjnjuf9geGAzA4rq
X-Authority-Analysis: v=2.4 cv=DPqCIiNb c=1 sm=1 tr=0 ts=69175437 cx=c_pps
 a=7hLunrEu2bbtxuZ/3C1eJA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OGTKLwYVIRPyTWqAaNEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMCBTYWx0ZWRfX3tb1GyqDBXX3
 QzAA+7xlgKywOHsOu+/vYU/0plCVzNS3ToAslc6G2c0zMXEMLvEFXlT1XgtHL/rIISJTb9sJZwd
 kgwX6xBX2639GHnkHZ+O03VhLskRmSS30kqCe+ABK7w9yd9uw+5swBn0De5CtFaF6iihyAqpEWl
 o85JsoGo7c9NPE8H/HWwlwtLTlX0E4W9izIQTOG5VHh7KiR327f3SqLjp+YdGCyFtKLkqZPE4ma
 Boy6xilviQqovlR4WhbjCObnQp55qZXqt8fidDsZxWyoEgmrt5D0SqC0gDEJoIC3Ee249mJv86h
 lNoigiOCtoZ3YN4FV+1PSkNoCF0YnnX95NZLF7FkWyaoEU1n3Sn4ptlnkAHhUzKfmiEtiElAl9K
 Fo2HucnYHs66V9ALYh9C8aYaRScwPw==
X-Proofpoint-GUID: 2HibWZW3a8vWAV6ebjnjuf9geGAzA4rq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140130
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 0/3] stm32mp13: Add ADC support and USB
	power delivery check
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

Add power delivery check for stm32mp135f-dk board as already done
for stm32mp15x-dk boards :
  - Add STM32MP13 support in STM32 ADC drivers.
  - Enable ADC flag in stm3mp13_defconfig.
  - Add st,adc_usb_pd property in stm32mp135-dk-u-boot.

Changes in v2:
  - add Patrick's reviewed-by
  - Fix some struct declaration location

Olivier Moysan (1):
  adc: stm32mp13: add support of adc to stm32mp13

Patrice Chotard (2):
  configs: stm32: Enable ADC support for stm32mp13_defconfig
  ARM: dts: Add st,adc_usb_pd property for stm32mp135-dk-u-boot

 arch/arm/dts/stm32mp135f-dk-u-boot.dtsi |  1 +
 configs/stm32mp13_defconfig             |  2 +
 drivers/adc/stm32-adc-core.c            |  1 +
 drivers/adc/stm32-adc.c                 | 88 +++++++++++++++++++++----
 4 files changed, 78 insertions(+), 14 deletions(-)

-- 
2.43.0

base-commit: 0eaa4b337336dbbe93395d1f2ccc18937eaafea2
branch: upstream_add_STM32MP13_ADC_support_v2
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
