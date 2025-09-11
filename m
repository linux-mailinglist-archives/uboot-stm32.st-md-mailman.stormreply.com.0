Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10448B52975
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Sep 2025 09:01:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAB2FC3FAD5;
	Thu, 11 Sep 2025 07:01:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E55DC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 07:01:00 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B6lLtY001119;
 Thu, 11 Sep 2025 08:59:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=rekIvo6XqfsGHIu5S24Zzv
 QQZRJUzBMHlfSPb95jTkU=; b=Szxj29mTQLiGEyaX4ba2e7m1/DOj7RN9FFGdKw
 lUvNkTlIA2ClSgL6gMGu9KTDYb/Bf8zBWgI5ZPu9FJAV4UJIUnD2lF7dhRnybYqf
 LUmWMsIkJgROyAkbzZvQ+gOp+Plr1+cvDZPkLzpWkjcSPSygipsOAn9ITajRAw6I
 PzC739KhjGIpXj6Y11dVJp9GhFwzivFAgwSqqsaP1VLsqw/CJQ0UQc8L/+h945o0
 bUpNQK4cigz09k/SEBMUcfwuTPYcg+Kze0v/RMeZZ5B6cU4fwBwOnmJb+Piggr0G
 kLteZbhPG89i+fX2fqh46XAFVJOI98CN8MeCoOrM1vz6oHAQ==
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013001.outbound.protection.outlook.com [52.101.72.1])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 492fr9hxvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Sep 2025 08:59:54 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMufsA0slaSHjY2cobosnsGpfaiIPbydnAfEl/kujVHNFc+SWJ9O6pFDhFdUwIiM+jdZHcJbXQK4WQe/KCZm9UT6HDDaAG+lvu0MK1xGCLiF1afXHMHJTEQwqXKqlYROGzV+laTqS74fkTsAyD9Lc0taGhOfLH1B/zTylIHboidveKopU8+DVsCRW4+lkDwSQe7DWajFX6QN5Vw2v4adHaZdEcGJR+6JN2dGZE0V7dQHAV2pL/7PVBiPxRQ/3dJ6NDvRMs2k0H6SYYShYn5EIcoIy6xhSh7Vvbefn5U0PTO0/C35iYX//02RWP8UQ6z6H8BuxtfCKZCsD6ZfO1rgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rekIvo6XqfsGHIu5S24ZzvQQZRJUzBMHlfSPb95jTkU=;
 b=DjDzY3GjuE6Dpt0ulIm+3STNnjp5QUaUaP3cld0s61VJdnWFncscBXRzwA6/r+K4DuTTtPcq7cqL2PG0nv6NiERaagai57tN+cryBM3KpMcae5Oml075Wj9xicHMjvYs83gHnlrixy1osXX4cDKjEaa+EtUNt5pDFvrTLw8NvUmWQSVYmHRw6sBaf4Sh+1vUDSF0h01g9rvsHk2RZDbufDdXGLVTqah/7y4+DduqCOhBAc28s+k+exWIfQJDBEE/8/vPcmi4DnjynJfKLDOB1nRGP91BsCe0esvia2SUBCnYOlbyCj/7h3AMoXlqz93hxjqHEJlI7ZEJae8d52O3nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rekIvo6XqfsGHIu5S24ZzvQQZRJUzBMHlfSPb95jTkU=;
 b=KOXyA3Qr4PtL98KM808bC5edwbpimxI9+qtBJiTmAX1cGBOYKyFrmh3SRQPrKXSbFAwpWaf1MKvQBuk6uu4P0HLPTL9QozYdOKRM4SEpso5pdJ6/R8cCAILzezAz/7P/REx8fFQBwce/ziniilAtDmpIhOYD2cPIE2zTyjrHnQA=
Received: from AS4PR10CA0013.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::20)
 by AS8PR10MB6150.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:548::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 06:59:52 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::3e) by AS4PR10CA0013.outlook.office365.com
 (2603:10a6:20b:5dc::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Thu,
 11 Sep 2025 06:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 06:59:52 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 11 Sep
 2025 08:57:30 +0200
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 11 Sep
 2025 08:59:51 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 11 Sep 2025 08:59:39 +0200
Message-ID: <20250911065944.15020-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A1:EE_|AS8PR10MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: 99cc346d-e270-45cc-6b79-08ddf100ce67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kIiS3p8L8uPsYlWcAEXKS0aG5Vy5dWjjbZIWzxLB7rfKdyRgcVepHuS/WVbd?=
 =?us-ascii?Q?PIKnXYNPxXfk6oHiPjfy5FtLZzbzhSXF7WnNUSWYefkXpyAW7rZ+a5+IvwL9?=
 =?us-ascii?Q?zLSnAC+fYITffQieeF0XP2vCnumq5DkpRFyhihSLrEhGZBqi+O8YA2m14V3X?=
 =?us-ascii?Q?SCtsqdTULDsVkfxgcYxxERern88oY3AXPRKzTUBNkEEMizU3zeRB7DZff7Dr?=
 =?us-ascii?Q?8OjQHbxQMHXgyVi0JH5jkAQ61FMnAzAMS5/2NtCtqhuBA3MQtQcBNXJl6pYZ?=
 =?us-ascii?Q?ywPzOa4Cw4DcU1P2j3fu0ZUAL/R8JBL666w6N+r3xgfy5HJ6DwF45taT/MDj?=
 =?us-ascii?Q?/Vq5fHaP8Yua4VwgpelZF9gnY28bbhCmAHEdO0gOiEXAcem1K4n6yefpSHUa?=
 =?us-ascii?Q?CpKi03C8oDyeRUlxRscoimP7KnHyZu1MPZaz6q027TZspFpyNzraJe6Rs7AQ?=
 =?us-ascii?Q?JiGCjUXwitgH20X644QlkG5t3aeaNydnbESZ+iQugWhCFt9+2RfenL3ZIfKz?=
 =?us-ascii?Q?NEQg4sLyMP1jd5f1hrWQWpxmW6c8R3OXeUbG6iHwXJXk7w9/kCYYp0hHHKvD?=
 =?us-ascii?Q?VHAWJlzQJ59aIFfMPzgOh8nTnDYxhahLUqx5Xcwhs8wxdq8VjlG+m+jUktBM?=
 =?us-ascii?Q?EPUR51NXnOhDIG8fLyBD3hIdX0G6GGRqu7QtVhmYSqbGCzIeeE3Nd0fCNR9X?=
 =?us-ascii?Q?Bes2k91DLkJIrBh/IS9uXw0gV1cNB6y3nrWkZALpVXbc2Zm9BNiHXPJ6aFib?=
 =?us-ascii?Q?nYUTXCjCYHxnHVACUVBdbScB735Ayy00LcVQPl5t86LQvNbnDIkIuXiOnH3y?=
 =?us-ascii?Q?HmXIpw3zc1vJN7HTVzWU00+emWHxnQMw6aZmkMWZFiTuhtr8jJEaguiVaZiE?=
 =?us-ascii?Q?MfKiFs8FlVZZf4z+ugrlWGrqXqucZrMvtXEiYxW6viNXLgV3UR78bfkd/Gh5?=
 =?us-ascii?Q?4yq1+QzOqPXP25lUoXSJ6KsWCF36TDxK/zzzI6wjNEJDFyJfGFPIzT/YwTlT?=
 =?us-ascii?Q?gXAYt0ZGYc9vM7GlrgO1orWOwwnaqp1xfbYGI/rTmfCi/srkRXz+hvMALQgB?=
 =?us-ascii?Q?bLegGCHnYG4VELph1bP0r5k1j3Rg2rCLwSwyM86FVD+yDeI57s6HZRaJDezh?=
 =?us-ascii?Q?2Xb3QWbwuyFX0QWkTEz4uLSxRXj/RFM/i/uRoUZSZ+Rte7oftG0smrKxxBCw?=
 =?us-ascii?Q?MT+Z8XvljkIIc7CUUREjzz7njz4ZIJ4xg4rCURoPoVcy37GFQXW34H4aRXYb?=
 =?us-ascii?Q?9eE1NlN/+MgZuoSS7C2YFRQQZMD3i80pZRQ6e4HHcl4bQ9qUCjOuftPKuvLq?=
 =?us-ascii?Q?0RTEqsLSYS8DjEO83NRTVgFFfblhfRHhUO/RILIUYYoz5W/c6M8Mc6BVcDPe?=
 =?us-ascii?Q?goXIXJp5pVJ1eUzST4aVTBRNwZZc2vy9ofVUgSA70XKqieV2XZWt1WYwLbYC?=
 =?us-ascii?Q?e2H1qhKJYXYbczCkOSGRk2ViXMwNkgR+iRuq+WoMcMWV1jRAYt0lFwEocrar?=
 =?us-ascii?Q?UZefUTNCcjCrHzykRW+WtY/83pckrdXGgGQq?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 06:59:52.0701 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99cc346d-e270-45cc-6b79-08ddf100ce67
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6150
X-Proofpoint-ORIG-GUID: JIUNiWlDSV-dgoB353gK6p0_ev-dHxzB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDA3MCBTYWx0ZWRfX318otfj92tus
 6NAUIYFib0OC1CVfIq96T1p31vVAOSfCW33lWzSrJce0kqU+6NbcvSCCMH9baYjHl3h4SyN9NwX
 scydLUiGM6bmWiNNeAqCulqyO3Gusy9jw/Tlu/vtjTmog/kyMMgI1Av9meugKd11yFeqeRR0txj
 ci0ZawDKZ/y8QEleL+Oc/IsJarIj7a0OSoQxhXxXDp0LHJ7kZhaufQW6lZpCfTQXIZKEdQphC+x
 YKzzooXCbVgRAJrn4p7p85iqP1hFQ4MSZgWSab7dpPuoFDLHWcbOY82mRrYR0q4gzwpBmwOfG2a
 7xDxB7c8j+X5iwd8baTeAh8wwoE6wyCSYzj815L7wlPdfox5wzpNGLkkUmf0QwpA8EC6aQm+As/
 5zeLJsdk
X-Authority-Analysis: v=2.4 cv=We8Ma1hX c=1 sm=1 tr=0 ts=68c2736a cx=c_pps
 a=U9/24nWfJo5LsBcH4C/8Zg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=yJojWOMRYYMA:10
 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=xYsl2oq6oxH_PECJ_NEA:9
X-Proofpoint-GUID: JIUNiWlDSV-dgoB353gK6p0_ev-dHxzB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 impostorscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509090070
Cc: Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, Stefan
 Roese <stefan.roese@mailbox.org>, John Watts <contact@jookia.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Tom
 Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Yao Zi <ziyao@disroot.org>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Sumit Garg <sumit.garg@kernel.org>,
 =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
 Utsav Agarwal <utsav.agarwal@analog.com>, Heiko Schocher <hs@nabladev.com>,
 Greg Malysa <malysagreg@gmail.com>, Alexander Dahl <ada@thorsis.com>,
 Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Cheick Traore <cheick.traore@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 0/5] stm32mp2: Add SPI flashes support
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

This series introduces 2 new drivers:
  _ STM32 Octo Memory Manager driver
  _ STM32 OSPI driver

It adds resource check helpers which are used by OMM driver.
It adds and enables OMM and OSPI driver support for stm32mp257f-ev1 board


Changes in v2:
  - Add stm32-omm.c in MAINTAINERS file
  - Add stm32_ospi.c in MAINTAINERS file
  - Collected reviewed-by from Patrick

Patrice Chotard (5):
  ioport: Add resource check helpers
  memory: Add STM32 Octo Memory Manager driver
  spi: Add STM32MP2 Octo-SPI driver support
  configs: stm32mp25: Enable configs flags related to SPI flashes.
  ARM: dts: Add flash0 partitions for stm32mp257f-ev1-u-boot

 MAINTAINERS                              |   2 +
 arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi |  41 ++
 configs/stm32mp25_defconfig              |  15 +-
 drivers/memory/Kconfig                   |  17 +
 drivers/memory/Makefile                  |   1 +
 drivers/memory/stm32_omm.c               | 421 +++++++++++++++
 drivers/spi/Kconfig                      |   8 +
 drivers/spi/Makefile                     |   1 +
 drivers/spi/stm32_ospi.c                 | 623 +++++++++++++++++++++++
 include/linux/ioport.h                   |  16 +
 10 files changed, 1144 insertions(+), 1 deletion(-)
 create mode 100644 drivers/memory/stm32_omm.c
 create mode 100644 drivers/spi/stm32_ospi.c

-- 
2.25.1

base-commit: 4a41a331efc4c6937cf4d2723282ca4d136cfb2b
branch: upstream_OSPI_v2
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
