Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCA6CB6614
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Dec 2025 16:52:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DE38C60460;
	Thu, 11 Dec 2025 15:52:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B66EC01E77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Dec 2025 15:52:46 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BBFnT1M1746237; Thu, 11 Dec 2025 16:52:18 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4aymkr3f0q-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 16:52:18 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVtnzq76FVz6kQ8WtWubNh4hyxpKqtKozjzpYgYh/D6n06D54pimWBuYodm7xVSyc76h90H/T6DIegGlJxR1ysmH6Z6r9enYKydQDn5+y+5YqydnrgHVPqTJXyLCP8FxFtLd78l6tAJE8SwrQVoJWMACeaLwJxxSnYnwJs3A1/NH8UCkYW3mT2x2cuuft5nPSg8SUfbJoN8HeyK9NSiFOZ+WgPfxgQG8jKt1xjBk6D9SxjW8E/DEO8hfzPTD/R9zA9jJ3nINaocFYcgiMaDY3V14idCfES2ZRbZj9IdSKQp44gGyYFKbjdY92afMklkTR4vi64zuPhdSbZx6PPr09A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPiVyuRu7EJR8GF0YByQfoPfMDyYsahu91D9iaQMr+8=;
 b=og4a7lKrHPfwOc9eQDBN9FtcMk5BEiLAPvLDgKNtCbKr7bWX9I9uoz3zSx+M1+9bXuNZBOD0qWWZINMJ3Zngf9BzBXX2ShiB7ZNE/xmVZvlZbQdB5lLnTGP9M0pyu0xrSxlrhoSHUIBhR9+ousHNTRz3IKRr4rbSXeJNYb8q3wLiY41eTmvpZ8jw6+V/fRruXQtyfLYTHORweaB092N8/1XgTC4g5tYxp8JBeos15oES2mThp9JyvzoGC9+tyd5k4rpRfIY595Fdtsx4WNBcFVp00MPJvJRrewgOERDPg8cPhgGmVQYcqR9rCVfQOB1M2aCeNxAwlsEArDv84oOOAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPiVyuRu7EJR8GF0YByQfoPfMDyYsahu91D9iaQMr+8=;
 b=WbEimKMNGJsqC5As+pwtEoL0De6I5Ih9Xr3cd3KmCsyGsENUx8m/3nJh9MtrGiaRiDUsug5undRCiQt1E9mMceow56ULQ88Df7i10HQIdiOt/qmsXABzTnEG5qYZkZaD2NNkZ7b1H5QGHkLF9adq+iFI5gHzoZQh8UnhVWfAwDrqp7p2XaqVcayoxbuC25yfMOqyFhIlvgvYpDWhNNgsGr5Mmy2ypy0K/qTRwXgXuV0VqOU6CM2+CC0t+Vyma5xzLihljDmrWmE9fS/RUbqM4VrLFicvhTvKleM0tFVcvtQ+RZ7rV7NZuIx5EHphQRDoAiEEktsnIrZnw00GGfn83w==
Received: from DU7PR01CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::22) by DU4PR10MB8612.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:55c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 15:52:15 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::a1) by DU7PR01CA0026.outlook.office365.com
 (2603:10a6:10:50e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Thu,
 11 Dec 2025 15:52:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 15:52:14 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 16:52:57 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 16:52:12 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 11 Dec 2025 16:52:08 +0100
MIME-Version: 1.0
Message-ID: <20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-2-44e6e7de2beb@foss.st.com>
References: <20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-0-44e6e7de2beb@foss.st.com>
In-Reply-To: <20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-0-44e6e7de2beb@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>, "Peng
 Fan" <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|DU4PR10MB8612:EE_
X-MS-Office365-Filtering-Correlation-Id: 6647685e-1034-4649-951b-08de38cd415d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmpqRFVKbG5xUjI2eDBhdTJ6UmdYZ290cDBmQlQ4Zk81aGZndmlOMk1RUWtS?=
 =?utf-8?B?ZVpHcUZwZmsxNVZRVG54OXlRTWRsbkQwSEFHOTA5R2pIOFRKOE5IOEhnMmc3?=
 =?utf-8?B?ZktjNkVpLzR6TnhHbVFXbnljL21BNTdEN0I3WUhYbVdUaHFxL3ZQMk91dHNj?=
 =?utf-8?B?OVQ0bkRDbjBrV01QWk51anNVaDlZb0M5WUVkV0xKTTJsWExpRGpuR2hwU29i?=
 =?utf-8?B?UU1DQ0JWY2g5aEZibFVFQVMxSEpGQTRRVkhrVDJRaWR0ZExxWndrcEtOZG40?=
 =?utf-8?B?YjZjMTlyZWRqRERhTEhDTldKd2ovdTkrdFk4NlBjZzRSRDZHRGxTWXNyOHFB?=
 =?utf-8?B?d0FjQldOOFJEVnliL0ZueFE4SVZtdS9yR3RvNDZsZXhJZ2xpZWFoMUtSZzJP?=
 =?utf-8?B?TTNLckE2SGc2MUhGZlNOZ3NWTjBXbm00aUg0SVNoVUtrV0c0eHp2a3lKdldD?=
 =?utf-8?B?azVKbFdMQlhvY0VjcjhaWDBjcTZzRmVnUTRsR0laTDdjVDJWb05zaW1VZjk4?=
 =?utf-8?B?TkZVRHVVRGNGOFJFNzg3ZGh2OS9VUXZvTHJxYzVvczQyd2xzWDAwUkorOG81?=
 =?utf-8?B?NkpLWFBBckVqV1dSSk41SjN3bldueUUyOXJyTEFtSnFYQ2lNSmxqbUxUVjFx?=
 =?utf-8?B?VjlQNGIrUWhiWS9PWXhJbDc4NUVJUUlDRFU3RjdmTU0vQ0tma2xKbXp6eG45?=
 =?utf-8?B?UlhpYk1CSUxPOXZ5bUpzQWFlUUMxa0U0RnZWOGdwRjJNd1g3WVk1ZERkdERj?=
 =?utf-8?B?MFdkSTdLWXFydkdkNUZKV0FHcTVGZWI5UldzeFRMOWRvOXpCZEVyVnQxckwx?=
 =?utf-8?B?V2VKVVV0VzQ0S3ZqdTJBM3BiOGlHam1vMzVGQUxhejF6YzlNREtWbUUzcWFM?=
 =?utf-8?B?WFB0MHlXTWs4dC9hUEpKdmtrSUdYYk5hTkJ0dkNIVXNJcHpqbVJyY0MzTUxZ?=
 =?utf-8?B?S0h0ZGpiV2pkbWhBUkhxajlLeUl2ejkxSDEwMWxTRGNUbFBhU3doRno3V0Ew?=
 =?utf-8?B?Y1B5QisySkx3dzJYNmlNU01WN0VIZjJ4VjU2eGl2d2ZwaTJzMXpvWStwWnBh?=
 =?utf-8?B?Smh3N3dVMGNrQnljRXB0RnRpbWpBK1g0M1phamdQVU9mc25xckhCM0FzbGpQ?=
 =?utf-8?B?Q0tMRTJkS09mSGZNdHI2cG5xNnVoTGtSOEpIVFdBbER1Vm9CREVFTlZlangx?=
 =?utf-8?B?RXdRQlcwbXNhTndWNWhSbUZ3ellMZllXYXZ0eUcyUDlxVDRVcTV6TlR6THlZ?=
 =?utf-8?B?bk5OdkpUc2dtNWJIYUhneEt2WkdsVVpVN1Fhb3hRbmdFWU16SXF5NS9raVho?=
 =?utf-8?B?Mk83ZUllVHhPRnJXWjBJMnNVbysycStXOW0ra2pNd1Bia1BrNlZ0RHlIeFEz?=
 =?utf-8?B?aEI2WFBaZXphdlJCVEg0S09aeUgvL09vc0xRYmMxMTBVNVUzbGJsOFlmSnRK?=
 =?utf-8?B?Sk1pbWJPY1pMWHZSSExlS3NkWlJzZGZmUlJPZlBoZ21hZzNDY1pnQ251SzVt?=
 =?utf-8?B?a2JPRW1Ub1BqbkNTNXJHclZKR3ZGZ2lJalJGYWZqNjFnZHV4Uk0rSDg5aHR5?=
 =?utf-8?B?UzRVNCtvcmV5aDl4aEVRQkVPU1VlVnFzY2Naay9zV3RuN2Q4UlFSNU1UdG85?=
 =?utf-8?B?KzB0c0c5aGxZbG0vekpROG16Z1NNOUxpV1UwcGdEN25LNmpLSnBFTko3V0Vu?=
 =?utf-8?B?YVpnNUJqK1NHR3QzenE5ditUN0NaajE5ZnEwVDc1RThuOThTS2dNMDVXWGYy?=
 =?utf-8?B?WEVVWnNXU1d1TWpsWXhFbFpkbkRQQTJSdENwVGRpVXpET0RyYktKd0RPMGl0?=
 =?utf-8?B?elFPd3Vqa3k4dG1XOEF0Q2J4eUg0R3l3WlBkQnJzVjN2N0UzY1dDejBHWGkr?=
 =?utf-8?B?RVhZMlc3M3pRWnRjSUVhMHRwdW1JRHVRbk92bHJLdGp6MTV5RWE1Y29ITTJi?=
 =?utf-8?B?VDEvWVFqV3VRUHdYMm9LNVg3ZzRoQVp0NWE0WWhYaVdTeEVHcXhLQjlqSGN1?=
 =?utf-8?B?aFNLWHVhN2FBTmZ0REZRZTZ4RkZFcG9mc2NNajFoRWcrWHJ0MUl0bDF4aURM?=
 =?utf-8?B?NHpUNlJhZHZsS09WOFY2bys3c1VFOGRiOGI3T2hCYXpVdEFoS3hPUmNObEh0?=
 =?utf-8?Q?5eB4=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 15:52:14.8226 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6647685e-1034-4649-951b-08de38cd415d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8612
X-Proofpoint-ORIG-GUID: t5hcN8_wEEnXIc0pzaQaACP9asKvmB7a
X-Authority-Analysis: v=2.4 cv=QvhTHFyd c=1 sm=1 tr=0 ts=693ae8b2 cx=c_pps
 a=nIPM16a0Nuaph4AHzLZmgg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=MjPx2iHTXk3NDff5CqMA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEyNiBTYWx0ZWRfXy93zMbWJwWm7
 /Evuqd+1gKkrLn1E2FSuNacescgpGGvrgR2VyQD2KU9h3g2OlXiPER0ZazUj4xaoVEKFlYFBPvB
 tLrlssSapcRfNIyHo+hl5TY0spqR3zofltsyOEXjCl3EkgolD86esxigjwzXR9BcGwzVGtzyjSF
 buP0P5UanpS1IdLMHHqCOiatKHDWI/klBqaoWIa8TT7RpVw83C6/TAPTtj9Do2tuiy1PNxoEmPn
 q8CYmpsPcMcmbE4gYToD/t4YGrgc7kAqb833S0PbLO8L1bXaU17qzG0I2mwW5SurhBsZ/4+SLTP
 eQK4ITw9Uo5vlGWxwqaS1z6yi47pvp8hV0wWI9BDqzxltJRF78U/AN1NtRr96xD1pbCuf0S8Xt/
 6/lCVkHyKhsm3QOs9dl0C0EyFh2XyQ==
X-Proofpoint-GUID: t5hcN8_wEEnXIc0pzaQaACP9asKvmB7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110126
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 2/3] clk: stm322mp13: Resolve scmi clk
	before using it
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

During clock's registration, clock's name are used to establish parent -
child relation. On STM32MP13, most of SCMI clocks are parent
clocks.

Since commit fdb1bffe2827 ("clk: scmi: Postpone clock name resolution"),
all scmi clocks are named by default "scmi-%zu" until they are enabled,
it breaks clocks registration and boot process for STM32MP13 platforms.

By resolving SCMI clocks before clocks registration, it solves the issue.

Fixes: fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp13.c | 47 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
index 18e9ab364b4..a2696177de2 100644
--- a/drivers/clk/stm32/clk-stm32mp13.c
+++ b/drivers/clk/stm32/clk-stm32mp13.c
@@ -18,6 +18,7 @@
 #include <asm/io.h>
 #include <asm/global_data.h>
 #include <asm/arch/sys_proto.h>
+#include <clk/scmi.h>
 #include <dm/device_compat.h>
 #include <dt-bindings/clock/stm32mp13-clks.h>
 #include <dt-bindings/clock/stm32mp13-clksrc.h>
@@ -31,6 +32,40 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
+#ifdef CONFIG_TFABOOT
+const int stm32mp13_scmi_clks[] = {
+	CK_SCMI_HSE,
+	CK_SCMI_HSI,
+	CK_SCMI_CSI,
+	CK_SCMI_LSE,
+	CK_SCMI_LSI,
+	CK_SCMI_HSE_DIV2,
+	CK_SCMI_PLL2_Q,
+	CK_SCMI_PLL2_R,
+	CK_SCMI_PLL3_P,
+	CK_SCMI_PLL3_Q,
+	CK_SCMI_PLL3_R,
+	CK_SCMI_PLL4_P,
+	CK_SCMI_PLL4_Q,
+	CK_SCMI_PLL4_R,
+	CK_SCMI_MPU,
+	CK_SCMI_AXI,
+	CK_SCMI_MLAHB,
+	CK_SCMI_CKPER,
+	CK_SCMI_PCLK1,
+	CK_SCMI_PCLK2,
+	CK_SCMI_PCLK3,
+	CK_SCMI_PCLK4,
+	CK_SCMI_PCLK5,
+	CK_SCMI_PCLK6,
+	CK_SCMI_CKTIMG1,
+	CK_SCMI_CKTIMG2,
+	CK_SCMI_CKTIMG3,
+	CK_SCMI_RTC,
+	CK_SCMI_RTCAPB,
+};
+#endif
+
 static const char * const adc12_src[] = {
 	"pll4_r", "ck_per", "pll3_q"
 };
@@ -1983,9 +2018,21 @@ static int stm32mp1_clk_probe(struct udevice *dev)
 
 #ifdef CONFIG_TFABOOT
 	struct udevice *scmi;
+	ulong id;
+	int i;
 
 	/* force SCMI probe to register all SCMI clocks */
 	uclass_get_device_by_driver(UCLASS_CLK, DM_DRIVER_GET(scmi_clock), &scmi);
+
+	/* resolve attribute for all SCMI clocks */
+	for (i = 0; i < ARRAY_SIZE(stm32mp13_scmi_clks); i++) {
+		id = CLK_ID(scmi, stm32mp13_scmi_clks[i]);
+		err = scmi_clk_resolve_attr(id, NULL);
+		if (err) {
+			dev_err(dev, "Failed to resolve SCMI clk %d\n",
+				stm32mp13_scmi_clks[i]);
+		}
+	}
 #else
 	err = stm32mp1_osc_init(dev);
 	if (err)

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
