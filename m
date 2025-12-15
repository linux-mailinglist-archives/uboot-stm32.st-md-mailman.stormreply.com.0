Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2131ECBE6FB
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Dec 2025 15:57:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E05F2C35E3C;
	Mon, 15 Dec 2025 14:57:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23EDDC35E3C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 14:57:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFEsntS2745942; Mon, 15 Dec 2025 15:56:50 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013022.outbound.protection.outlook.com
 [52.101.83.22])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b11m2nxcd-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 15 Dec 2025 15:56:49 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5PFEnK0S9dMeDZmRu2XW2TiDw6zTfunEnJbJdmGR7JIClFfMjjgsngyTQB2zURT6gHon+sg75SNe26bULAaie0GwY4g5bc+GKNfRMFzea70ncmT02IRnvXWsHDVp48vJYFT00FjKCoMheXE2Vgb5r/p+dOc7Slnlgaep+dl15JtsL2OAC+Varwbc6wJ1zJJB+EXojxzfliz7F7UwwUiE+l5D7D+BY3PgpcOMwzsTJQHYNfZHrlqqupr9wNbqBmz6ktm9OmC+KyjkU3LSVfUq3ukbH60nukrgJwD8RjrqdV7FzMBLm3gMH66z08FB8uaoxk66lq2Kq7m5R+K2iAhuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/JYoGQb3y/IYJDGSjCL3UrueO+FaAGnxukATJfJ9Gc=;
 b=YpmAnBKesAAtEybk7zKFXS1MsOUSeLP4gykrItXBxMzkCveN9WLGduvUv9YaoGmYE39T9g8W5v5QY8AooQbXlh7OTcwJz13AXeyj8GZ9HqXgk5hQYA/gwJW4SfgCEoB3JPKmOYpb84eoT/rGWf0PF7Oq/JX8woxDAeJrLAZVWW25PFw7MUmGNNArccwG9pH0MdsVIezLn0dFAJTOq/9hPjtbABQSkEYkEdfjh9EnbIp2XZZLWfEj4nAxYocUY0fQb/K36oZURyXjIo7EuhLA25Yc3FLzvHINA71mzsa3bntx+Afljr1x3Ifikh+yVsMxuhQuNKnjk2/BEpEw7E11lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/JYoGQb3y/IYJDGSjCL3UrueO+FaAGnxukATJfJ9Gc=;
 b=mBgfJyMQvsm+RCk6CY/R7yuPFVrlvlJkFCRNmqt7Y9cwi96JYFmrt4xPuGYHyjxSP+wAZXAOWccrUsjH9/nUgdfmZhn7v11FVntivBItgJRWCQCqUsruKB1aXxshTbhbnZwgUcIkW+QGhvKXpRMUUF4ERIxDBe0wFlcCca+AwP7sM8mSsjImYspydYMZV5kLrkq4y0RtxbKLYmgoyw5QKHdSWROj6xts28rkt9jkncjSf05j6V8+IkJFwIIKfJxTm/COPD5IW3VrHX5ihYM2LWi6dY6iWcuXZHDMkUqDe5kKDlurtLTGATOS0OV+XcxXMJA/9cpy2dvEIlM2YKrr0Q==
Received: from DU7P195CA0010.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::13)
 by VI0PR10MB9635.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:325::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 14:56:45 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::81) by DU7P195CA0010.outlook.office365.com
 (2603:10a6:10:54d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 14:56:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 15 Dec 2025 14:56:45 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 15:57:31 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 15:56:44 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 15 Dec 2025 15:56:43 +0100
MIME-Version: 1.0
Message-ID: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-2-d055da246e55@foss.st.com>
References: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
In-Reply-To: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>, "Peng
 Fan" <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F2:EE_|VI0PR10MB9635:EE_
X-MS-Office365-Filtering-Correlation-Id: 906fd702-48db-40d8-36c6-08de3bea2a83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3psTE9tWm1ZRFdTY2UvMkp0bWJvdTBFY2IxTjE3K3c2S0dJalJLbVZrcERN?=
 =?utf-8?B?ZzNzMEdZb2VwSDNCZ0VoVnRDUDBOK1g2TGlEUWY1S2JqV0hqcUZVc1lRTnVU?=
 =?utf-8?B?NnF3YU1acnhyMFFrVHBwL2dLMDFEN3g4Tlo2N2M0UUhiMldQSUtPZndxOXNo?=
 =?utf-8?B?Q2loQjNGd2tqR2xwMTloeGtORkNpbGtHYlcxeGE3T2xQUnBjL0tYMHVaMzRw?=
 =?utf-8?B?MFJtZmhGNGdmQjFRMFpqM3F5Z29vcHJWUEt2ZHVWNW4zWEZtZG5ubUc1YkRx?=
 =?utf-8?B?K1VLRDljS2VkMmZreUhFSU9ZZGlzYW5uWW93SlAyeTVaeC90TVpzSlByZkg5?=
 =?utf-8?B?b0ZvYVFkRHM4VWdIamk5OUhiZDlOQlpGNmU1NzROWkJtTDJ2WWxUWjhxT3VQ?=
 =?utf-8?B?UkRMbllXdTVFbVg0YnBHOUxkb2RSVlJJVXJLK0htbHVhdHFWMFhSdWthMGhB?=
 =?utf-8?B?R3ZwU3ZsUmJoWjkySENyYVBQZXpLZkM4eHB5K2IxMmZBOVBKV21nbnUzVHBM?=
 =?utf-8?B?eTBRdllIZU5KdkxRMVo1Ylo2L2tFVGFNWllpWDZxOVdLeEMvQ1hnbG5xSTRU?=
 =?utf-8?B?VWZqdUlvL2MyS2NZZ1EvSEpaR2hPb2NHd1c4SXB4RGJ5dU43eFpJL0FScDFQ?=
 =?utf-8?B?aDQ1VUpNeVhpZXJGZmI1bS9aeCt0S205UDRDcjd2QjZ2aDBDbGZ0MVdMcWJV?=
 =?utf-8?B?U05Nc3BKRjUveUN3M1owMGtwWW9UckJVRXBXalg2cW81bDlzNWJsUkp6MTJI?=
 =?utf-8?B?TmNkazBJL25XenVFSU5IMFpybnhZYTBNWE83UGxsT1lRL2FEdFk3L0RNaGhD?=
 =?utf-8?B?OTF5M3FBSzFmd1B2Q2ZFbkpGVkVHVklqVUZnTDJHQ1UyblpSZjRDQ25HWW9M?=
 =?utf-8?B?bGQ4M3F1YVdxQ2lXemp5ckNnSEhCTWt3TDlrUmxha0l3bHRzMkoxVSt0bUlm?=
 =?utf-8?B?enVoZVFxM1VRSGVXamR2M1A4L2dYWUxZSjhZcGk1NEgxWCsxMWxkOEs2VWQw?=
 =?utf-8?B?emZBdmQrSHRUdFFyTzI5elE0TXl1Y0haMzMra01IZWVtS29MRzJoZ201aGVD?=
 =?utf-8?B?SE91ZlZRTWpGZFZDb0NiM1MxYldzR0srK1pKYTNsVlZCQndPTVNENHhrSWNx?=
 =?utf-8?B?Y0VwSi9WUDAreGtjaEJ5TVpCbUhNYVBySVNGMnlUd0orYzVpQ2IxTUVVZzNW?=
 =?utf-8?B?R1N0L1lhZWtudEZ3MVphNGEwc2RsenhwdWlReWZ0UVkwcU5xNk1taTV3Qm96?=
 =?utf-8?B?M1JQYnhQbzVva1JWT0Nwa2h2SkFoMjREU09qbEhURWlrZ3RObUZibEd4WXRs?=
 =?utf-8?B?QzdwRWF5eWJPY214djZhQ2RrRUxTVkVrOW5MdzNUTWFsR0VkMGplMVU5T1Uw?=
 =?utf-8?B?UG1qSng5UmowMWNqWFBYckYvVnQ5eXd1REZ1OFdtdXZzaXFKWEFkUTBFNXRt?=
 =?utf-8?B?NlJlajdCaFFDZVhnRTIwa3VNdVhINmtHVUQ5bnhsbHgzNXlmbTgrWjd4cGUr?=
 =?utf-8?B?Rkx6MkU3b3JpOTNiVUpYOGtIV1ZDT1hzc2ExNWxSeGN3aW5jeE00MzFYa2Q0?=
 =?utf-8?B?WWhCOVRpcXQ5RkdhY3J1YU1PT2Zwd3NjUHpJaUkzU3p0VHlCYWltYXhwanJv?=
 =?utf-8?B?VllXdENTOG11WXMrekxDMnlxajhQRW1ZZFloeHFEcHBoMmdvWnpzQ1Q2NC9I?=
 =?utf-8?B?YjFKd1lNZ1lBVGNLSktEbFpRbWZjWWVSYjdNK01RS0NsSlNMSkZXOXVhdmRH?=
 =?utf-8?B?QXYxd2QzYVhjQ0dTQ2lUVFkrTks2TEh2YlFMRWNxdEFwY2VJNE55a1pseHhz?=
 =?utf-8?B?UlRwV3FJMGJmWUlYWGxOcHVkYmxrSGhIWHpYZDg0QmtIS3R1K1Z3NWVJUHdD?=
 =?utf-8?B?RXBJeittY1B3VkRFdlJzY3ZGM3NjaEJ2dHpTbVIwa0dYRWFPUFZPeGdOS1pa?=
 =?utf-8?B?WktFVU5BSjlGaFV3WVYvQ3E5Z2NpL2lsa0greE0zak8rMDBYTC9BblNzR2Nh?=
 =?utf-8?B?V2JqSXZ0TmJqWUkrS2N5WWs5aDE3bU9MZ012dE4zazk5c3BZRUxXOEtIOHo0?=
 =?utf-8?B?Wlp2SFFjekdXSU1weWF5Y3ExRWhjWGdBaHh2eVI1ME1WTml2dGNSUFlhU2Nm?=
 =?utf-8?Q?iFgE=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 14:56:45.3197 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 906fd702-48db-40d8-36c6-08de3bea2a83
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9635
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEzMCBTYWx0ZWRfXyrJuOpaEP6mF
 o2vOEXhXvu2RDDdW3nrM5GkcrkGYNlK9WxO3FfixJ2gOPAQ+OFRfZu3USsudtwfvtd6ptue99I9
 mZ2FS6zx8HXTU+NtW3Vp46JrjV0RRBzC8Y7IM5p78uwmwXFJAlz4UAsQdA97U3Pt6K2bfd4dnW8
 QvQGIXG5ygJejaaYv0eUj+SyQWzejHd3W0kgVozr4PJGldKsZs6+dQFXcVoxQ8AoTZGDZA/0l6I
 K9//6d9/fzKINXelVQkSaZ4efzbp04n6gxmNOYtP07DyZW7zfvzoqG0JvBTEvqxv3yRd7CTF5tm
 G/aJ/JSF7FnNvu7nxkGElwAr8LO0gowVs8UgWjTB0ZOAgsOY16SwCt8s7Dv7dk3R+b1/RwCMOtN
 pw1Sj/Fz779vGK7QLyb+E+4r8lTD0w==
X-Authority-Analysis: v=2.4 cv=Jsf8bc4C c=1 sm=1 tr=0 ts=694021b2 cx=c_pps
 a=XUICzFq2jMvQ1xz5VZc7ew==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=4tIQQ0NAJ6ogMJ9f5NUA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 5Rd4VrFAyvP1RFBku1eyjHFmOSfBaQfd
X-Proofpoint-GUID: 5Rd4VrFAyvP1RFBku1eyjHFmOSfBaQfd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_03,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150130
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 2/3] ARM: dts: stm32: Add SCMI clocks in
 rcc node for stm32mp131.dtsi
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

Add SCMI clocks. These clocks are used as parent clocks and are
referenced by their rcc's node position in clk-stm32mp13.c

Fixes: fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/dts/stm32mp13-u-boot.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
index ad63d5027b2..623c796cc79 100644
--- a/arch/arm/dts/stm32mp13-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
@@ -186,6 +186,33 @@
 };
 
 &rcc {
+	clocks = <&scmi_clk CK_SCMI_HSE>,
+		 <&scmi_clk CK_SCMI_HSI>,
+		 <&scmi_clk CK_SCMI_CSI>,
+		 <&scmi_clk CK_SCMI_LSE>,
+		 <&scmi_clk CK_SCMI_LSI>,
+		 <&scmi_clk CK_SCMI_HSE_DIV2>,
+		 <&scmi_clk CK_SCMI_PLL2_Q>,
+		 <&scmi_clk CK_SCMI_PLL2_R>,
+		 <&scmi_clk CK_SCMI_PLL3_P>,
+		 <&scmi_clk CK_SCMI_PLL3_Q>,
+		 <&scmi_clk CK_SCMI_PLL3_R>,
+		 <&scmi_clk CK_SCMI_PLL4_P>,
+		 <&scmi_clk CK_SCMI_PLL4_Q>,
+		 <&scmi_clk CK_SCMI_PLL4_R>,
+		 <&scmi_clk CK_SCMI_MPU>,
+		 <&scmi_clk CK_SCMI_AXI>,
+		 <&scmi_clk CK_SCMI_MLAHB>,
+		 <&scmi_clk CK_SCMI_CKPER>,
+		 <&scmi_clk CK_SCMI_PCLK1>,
+		 <&scmi_clk CK_SCMI_PCLK2>,
+		 <&scmi_clk CK_SCMI_PCLK3>,
+		 <&scmi_clk CK_SCMI_PCLK4>,
+		 <&scmi_clk CK_SCMI_PCLK5>,
+		 <&scmi_clk CK_SCMI_PCLK6>,
+		 <&scmi_clk CK_SCMI_CKTIMG1>,
+		 <&scmi_clk CK_SCMI_CKTIMG2>,
+		 <&scmi_clk CK_SCMI_CKTIMG3>;
 	bootph-all;
 };
 

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
