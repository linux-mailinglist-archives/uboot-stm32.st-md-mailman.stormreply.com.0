Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B35E8C5DF4F
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 16:44:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FB19C62D2D;
	Fri, 14 Nov 2025 15:44:44 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 704D5C62D20
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 15:44:43 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEFUZLK2608453; Fri, 14 Nov 2025 16:44:11 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7j3mb9-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 16:44:11 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D40D/s4fezOAfOgz8ptjTJ+d+ZaUwSnt8jGbyU46OfzneOf/I6L4zmWy0YKxwH9rFQB6Lod2pUTMT4CxxLxf/t9A0jRJHERNxhp6UenNsSIBwE50jy17eu0Yw8WhtnhfdWSZjxzrBPrukCoHnrdusjsGguuzwnG0SHLnYlnm1xQ+tKdg8E+y/DANmjfXxuJx2PDttIPj3a8y26hXNuEJ6Rxv9mjGB1GbsWVFci7yjXWJNsdqXvQUlCQvcziIUvPgxS/ZiK7PUz2IB2RSEJOWXtHYo1lJQY9U5wxYPvAOtbWWNu1XvHGKgs8tv2VgWxNru2FzfqAwBzXYV39HLB2j+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmFjJFOZRVKAjzUhiQE8olDopPVWQo7suX9ijsXEK4U=;
 b=T9gCkUY0P9ZMrKmcxOETEFbdk6Qv9+CwZama4G4lHOMt35ckOGiiONG/RIK1uEb5yKbfSZfx2r+PK9sNScSx1Zi/nZUwB/D91POTfViAbaRwDor1dFOlJ1QU8UdZqscw1fr5L/hn+x/KyR7RXFi2wldLrntch5kAF6ioTWh38HeM8tj184t1ayaurLEq3lidaC+xSuApNoV4bSnyEbrMo0NL2A+zMmZf8/cAnQ03wcLYr1xPL5YtT2PaQJTqNS712nHlO3JXejViFPo1oBG5HeEqOTz9+50NVlBn/C7ZzDI6bN5uKphT2tW9uu7TMUwQTNwG4Jflf7FizST41CznUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmFjJFOZRVKAjzUhiQE8olDopPVWQo7suX9ijsXEK4U=;
 b=Hp2U/Ygz7H1i1CBk4xFSDc51cibRo0YLCc6fThu7uGSBwq9LzE0120h6M2RW3bodJEKTC+SztcY44Jr259UWQgJm98vCu2dE1eEo/KBEPunCw+ZdBaVdYXANiC3VQmhebxnaKpm0nKuf5p9cQVNeXq1XvNU4JRz9cH1tecRaJla0DL7mGzgfcmCGMCCHwf54TIbRmJ/cSQ+cbinXaK3j7LmPUPj0mD+ZkXghUnrhMnFcYqhSdbMcIeXS0LyeWLrGZrQRPNqKx2wb+enujKlo/+yhA02BTNFddtAxWCiMdjXB5TnmSlZY0oaGQsjyTJ0xCiss8L0kmRxjMJRKnepDvw==
Received: from CWLP265CA0500.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::11)
 by DU4PR10MB9166.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:569::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 15:44:08 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:400:18b:cafe::4e) by CWLP265CA0500.outlook.office365.com
 (2603:10a6:400:18b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 15:43:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 15:44:08 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:44:20 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:44:07 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 16:41:50 +0100
Message-ID: <20251114154259.4035206-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114154259.4035206-1-patrice.chotard@foss.st.com>
References: <20251114154259.4035206-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A795:EE_|DU4PR10MB9166:EE_
X-MS-Office365-Filtering-Correlation-Id: 48555804-47e2-4588-d768-08de2394a622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|36860700013|376014|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fpJj6vJabrUK2SBZ8FeGfVbML6F+sKZ1LO+fTUsN24Q8ZLTjiOW+5ix9uJuX?=
 =?us-ascii?Q?o2I2nlbz/0YiRz2+iLllo8S1ZoNHmnsjXix6eRU7kw1pvaDAk29lzYDfQJnd?=
 =?us-ascii?Q?2/brbwibzAV7a+dDoOK7yv5aTnYchVcnaNNNMd66MFt6ul6MDsgr17hRYP5w?=
 =?us-ascii?Q?7ofjCWhRx3bn+LP4WqRmtVj/SXyRTGzFDhHsDG14fVuYMrLzeQABIYFyba8D?=
 =?us-ascii?Q?rlVJtb5e8e/m5NfRJ1Kyr/qIvSrl6gVz5xhRFKKbz2hIQJt+RxLN/BuhjbJw?=
 =?us-ascii?Q?kbECan8IOn3dsyOvjSmyJ3DgErQSqN1q2BZ9hVJL6JSDUn+rfadTE2Czvsh+?=
 =?us-ascii?Q?HuUzu/RrwrPI+W/2PY/yH4yGanMKKNusweftZ2PQRdk2EY766JHGa4GOZzJA?=
 =?us-ascii?Q?slidAcH2yPtYyWeEjgeowMGIZnRF/76j6LtzyUFoSKZmn3KwEjeDLH4Yoo5E?=
 =?us-ascii?Q?acCycK+piElZ1tAf+82s1Q0rBvHDti221b3ernKHe18dVkfsMUje9ya9O+i/?=
 =?us-ascii?Q?XM+kelD/QQ9NK28OPG974Rxgu+wh0gxxEZLb48lUIfm+UXwfSEjVMfAAkaip?=
 =?us-ascii?Q?M5CXG/n4LtxfTHavAvsf84tZeC8bqq/UNJkikAvAHyACifRxAhBwSB2CNc8K?=
 =?us-ascii?Q?2GnlZAXOg+ye3nUjPW1M0sOIj7E4s8YqkhjatWYbwIkrFehW6v09ADS52Okg?=
 =?us-ascii?Q?JxSLRcNyZBzM63bi1MGrP1qnRBhJ+QMOKndpba2h02gCZqGBtu5MwiByrvHZ?=
 =?us-ascii?Q?EKq6CvQRyimrKvmw51a+SUdm0qBeoiHOZs29QsXbCf0UpcyVYiN0v+4bZxhW?=
 =?us-ascii?Q?nYq6b204NoyP+bVRTJN0wRvLE1SSQBUZ8AFp2byyf5lWw17IKwBc7n2KJIh3?=
 =?us-ascii?Q?q1kLJ/wCLaUOGyDQAujuaf2L2TD9kCclxXqqFt9kZi0OlJ/5inW+ljm62Yhf?=
 =?us-ascii?Q?KckwvvuNhqAOhchRwiiD4MSO/NcDvrS1M8u9NrevwDPIC06+tcHa+GYfu+IQ?=
 =?us-ascii?Q?SBXmOiDFv+PSCB0Wd881ySfR/fpjwMD0Q0giEg5bbAge5/WaGuQEbeqxk41c?=
 =?us-ascii?Q?i4zkp1jYOfhVT8adfU5YgCfv/MZkLfyjiZ3vIOU4DWjz+VVtMfckBkzundUN?=
 =?us-ascii?Q?l0E30tS0f5A0ykKJi+2/p2oo5K48G8iWBxsPTA8rL8WJOtSaxlWV+diY5AvH?=
 =?us-ascii?Q?zWbcWloa14GNbRUldpBGPZFqEANO8pTCG6mzUacLac2SVvSCZZ/wOKhKZxNy?=
 =?us-ascii?Q?+pEHRISGgSHaJrkfv14BtkmErDY/tZ/ijH1lFzT8Imv3/15W5zWt6RGBISxv?=
 =?us-ascii?Q?3BQYNKp0kmGeOXHPCshU4HHEx5RP4NsMcb8Q/xjnsZgo91Cyq1H59JdFE9it?=
 =?us-ascii?Q?WOn3CRUeWsHJ3C95iHbHfG9RDQNDgZWbSRK1GbB1TGUtt15qPa77Vp76ylKD?=
 =?us-ascii?Q?JI+VoG9yVcjS7JZ+6JKiLnRA+yRmMLS3Nz5jnMRfnODsMZwq9dqJUDtv0LxM?=
 =?us-ascii?Q?0i2unkrlAC/Bc7gYj/fSC2I9SxLuhKmwICgMrJ/wKBvfnFWk8/RcnyBgHW5j?=
 =?us-ascii?Q?IGXsyRtxqEjNL+0D4xY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(36860700013)(376014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:44:08.1750 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48555804-47e2-4588-d768-08de2394a622
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9166
X-Proofpoint-ORIG-GUID: t5112dBF9IC3ki1aTWR4yX6WLxWk8f1f
X-Authority-Analysis: v=2.4 cv=DPqCIiNb c=1 sm=1 tr=0 ts=69174e4b cx=c_pps
 a=iR6vrzZ0vhlH88fZHXBuwA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8 a=b3CbU_ItAAAA:8 a=pGLkceISAAAA:8
 a=k-42gJp3AAAA:8 a=yC-0_ovQAAAA:8 a=ZAAeRtnTwqZgKhiwVCQA:9
 a=T3LWEMljR5ZiDmsYVIUa:22 a=ST-jHhOKWsTCqRlWije3:22 a=Rv2g8BkzVjQTVhhssdqe:22
 a=uCSXFHLys93vLW5PjgO_:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyNiBTYWx0ZWRfXzYchTgVKll5K
 RexZaw6tXIhBddqegYKW5tL6V+bklM+f7Amp4jL/T1bxH78JupdFVoJuTHAh8KYjLflwzLKjB4H
 ZyD7+9v/IhEriX38fE2pumMkHhdK5Y3JrQBE9IQzA6lG0M6rFwK2qTm1EscNrGGGAq1xHEwqirm
 P0Vt9JJS/Le3RGFvIXrEj26LfHTKX9s3d9K/JOXtbaiOC+gNjL9PSuNQnXRm4z8nAxpoaBr2ygs
 WijzCNWtptnTdDJvZRVjY20C2QEcgWK7swFPI5G7sn9HDgzaAJ+BuFcELutnQLkPjH6NdLIN55B
 zmqEUngh+kXWrhoyQfMRv7XKpMdc8zEXOLfmNHa29ytPbUyn7mBHmkwOuufy0FHuA8MjD1mZriI
 Qf+T1XB3lQCOs7JVWcgCFXkfbdAsRA==
X-Proofpoint-GUID: t5112dBF9IC3ki1aTWR4yX6WLxWk8f1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140126
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Valentin
 Caron <valentin.caron@foss.st.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Vinh Nguyen <vinh.nguyen.xz@renesas.com>, Alice Guo <alice.guo@nxp.com>,
 Kamlesh Gurudasani <kamlesh@ti.com>,
 Casey Connolly <casey.connolly@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>, Yao Zi <ziyao@disroot.org>
Subject: [Uboot-stm32] [PATCH 2/6] clk: scmi: Force call of
	scmi_clk_get_attribute() during probe
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

Since commit fdb1bffe2827 ("clk: scmi: Postpone clock name resolution"),
all clocks which are parent clocks are name "scmi-%zu" which
leads to error during their children clocks registration.

In order to not cancel boot time optimization done in
commit 3547e315c188 ("clk: scmi: Defer issue of SCMI_CLOCK_ATTRIBUTES"),
choice has been done to re-introduce scmi_clk_get_attribute() call
during scmi_clk_probe() under new CLK_SCMI_FORCE_ATTRIBUTE flag.

This restores boot on stm32mp13 and stm32mp2 family boards.

Fixes: fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")

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

 drivers/clk/Kconfig    |  8 ++++++++
 drivers/clk/clk_scmi.c | 10 +++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index b884a02bdeb..848f8635836 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -198,6 +198,14 @@ config CLK_SCMI
 	  by a SCMI agent based on SCMI clock protocol communication
 	  with a SCMI server.
 
+config CLK_SCMI_FORCE_ATTRIBUTE
+	bool "Force usage scmi_clk_get_attribute during probe"
+	depends on CLK_SCMI
+	help
+	  Force call of scmi_clk_get_attribute() during scmi_clk_probe()
+	  to allow clock registering using their name instead of default
+	  "scmi-%zu" name.
+
 config SPL_CLK_SCMI
 	bool "Enable SCMI clock driver in SPL"
 	depends on SCMI_FIRMWARE && SPL_FIRMWARE
diff --git a/drivers/clk/clk_scmi.c b/drivers/clk/clk_scmi.c
index f6132178205..7315c1e03aa 100644
--- a/drivers/clk/clk_scmi.c
+++ b/drivers/clk/clk_scmi.c
@@ -358,8 +358,16 @@ static int scmi_clk_probe(struct udevice *dev)
 	for (i = 0; i < num_clocks; i++) {
 		clk_scmi = clk_scmi_bulk + i;
 		char *clock_name = clk_scmi->name;
+		u32 attributes;
 
-		snprintf(clock_name, SCMI_CLOCK_NAME_LENGTH_MAX, "scmi-%zu", i);
+		if (CONFIG_IS_ENABLED(CLK_SCMI_FORCE_ATTRIBUTE)) {
+			ret = scmi_clk_get_attribute(dev, i, clock_name, &attributes);
+			if (ret)
+				return ret;
+
+		} else {
+			snprintf(clock_name, SCMI_CLOCK_NAME_LENGTH_MAX, "scmi-%zu", i);
+		}
 
 		ret = clk_register(&clk_scmi->clk, dev->driver->name,
 				   clock_name, dev->name);
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
