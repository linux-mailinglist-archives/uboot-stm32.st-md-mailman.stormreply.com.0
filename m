Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E60ACC3F42
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Dec 2025 16:32:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DE8CC87EDB;
	Tue, 16 Dec 2025 15:32:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74E84C87EDB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 15:32:09 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BGFT3Me1173052; Tue, 16 Dec 2025 16:32:04 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013068.outbound.protection.outlook.com
 [52.101.83.68])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b11gajxqd-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 16 Dec 2025 16:32:04 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyYx/NXbTj6UR15B5ithzgJCHTjFE5SxVYpzz+ryNvOpMiCoLZIlIWwovQ47xWzR5uANIzOVkiCY5YTmOivIuF96T0Tk8Hvku9g97fyqmj9PUSYqeMk4BUnQjUyksq8F6uHe94NWTf4HJBn7+A/EQ5+wdYrD7Lagy7iiFitQr3dTquD6JmUGzCSF+L0NziYV7PhLPEu7r3Lfj0NtcfHA+jMJw9U/SlnE402k5Q5nMqHcBvdJGMTr8QNbYdW6/7Ipu9aSJEfDyrzFhtL4bZhFv6P5ubIlrdkcGLiGuNPyDaC9vFEh/lLJed+p9UIusS7T4E2MEeuZWBQ3mvBkjwHjtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2w7gPfGAqUqEhOlnGx7eFapJA9ToO+rPEJ11r8GBrQg=;
 b=J/dWW0kcIinNpD8OifqsJAwfQz2j+68v9FVAB9WEAxQ8W1qcoez2mYUpb/TuDwWwLfju6xS2Hut7qRB35JrpIJiBtlCaoaOmFnEUkn0OAZ4o2lJOJi4zFUciyBHOyBFvO1jta8uAOj+IC69hNoZDp4PLTm+CeKAvM1lPWmf+iZ5oQjY18MVrgUEj5i7rMd31rXez82JNZOp9PnLrn3zqcF29jieZFmMey50ZBDxOSDojqL5IzmUIM3F/NJY58LXp24E0epIQAGD5mUZxGlDMFfyG+hO0cH8bqY5B8y3rzf1JSIlmdTTe5f/lNWRNybsNEwANUeTzsknfT1T3cbppQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2w7gPfGAqUqEhOlnGx7eFapJA9ToO+rPEJ11r8GBrQg=;
 b=V7djCdB03OgSvcsNrDED8IcSJ3f5oyC72MFRAbgQ3xZ+f0i2xqnjGSZpTUrD8IGmkEDft2R/jWJskzBTU5+GPolHZkFiualq8d+FSg7MhIVkTJ4l3WfLg1519OBS12yISy9P4ELeW5XzQ4s3zrvtFdz1lU+XaXISjPD2ns6Q2pMCWM3sI8zBHt79311KqWq9lxs3EBFXypVGGOzmsNoJejopdQIi7jnoVYzuEKQfbCwMByrAth6H9tPajgsRP2ZEP2b27vF1mYeNoxaDSwfYcL7FM6nmxh7G6CHLpugxx2henRjFAP5cFqKQdGrymcdYvKMhTji4bC2cxAtkHApUig==
Received: from AS4P189CA0018.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::19)
 by VI0PR10MB9389.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2ce::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 15:31:57 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::dd) by AS4P189CA0018.outlook.office365.com
 (2603:10a6:20b:5db::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 15:31:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 15:31:56 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 16:32:43 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 16:31:55 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 16 Dec 2025 16:31:53 +0100
MIME-Version: 1.0
Message-ID: <20251216-next-v1-2-469e1d901920@foss.st.com>
References: <20251216-next-v1-0-469e1d901920@foss.st.com>
In-Reply-To: <20251216-next-v1-0-469e1d901920@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000003F:EE_|VI0PR10MB9389:EE_
X-MS-Office365-Filtering-Correlation-Id: e3ffc2a8-1e61-48db-d4aa-08de3cb83f5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXhqdEF3bFFrcWhuZURaMTJFekE4RHNSam0vLy92VmRUSWxJVElKTE1lNStj?=
 =?utf-8?B?TG9jSVI5V0dPaTVuVW5RbURlQm0zNW41NEN2OEdBdS9BTkhvQm1BQitEWjJi?=
 =?utf-8?B?dXhMMjJ6QjVhcnZZTjR1L2swUW1YV1BxY2M5UFJQUExNeTl1bFpra2d5QTBl?=
 =?utf-8?B?QTVidFZOUElNVWxRcFo4QisvcTVndlNCdUFIYVdocVhmM3dUeEVmMGZCRXdQ?=
 =?utf-8?B?M2ZCOVU1U0FTcW5KdlNUcE9kS01LOWpEbFJsUlFFV2Z4QXN2a29iSVBPZmhp?=
 =?utf-8?B?ZEk5M0w0T1diaVF1STZYeCtPRDlOUkNmQXBJeHp4V1RTWml4Y3g4bTJGdGVO?=
 =?utf-8?B?cFAzUFFXd05pQ3IxdnExMm91N0NnelZVQVdFOWpSWVNsbzVQQk5nd0pFZDV5?=
 =?utf-8?B?NHk5Vnc4NEFLK3ZpSTlyQTMyZTBiTERRMzQvdXFpWG1JWVVxeGdCdk1qYVhh?=
 =?utf-8?B?QnNCSEIzdU5zd1Rod0djT2hwT1F2RXZYdkwxa2RKZ24yNlkwQk5xYXhETkl2?=
 =?utf-8?B?NXVBdDltOXZOR2VTdVdKRC9Zc0ZVSFBYUU9QSjZMdzhORGh3SkxEaDlGWmNF?=
 =?utf-8?B?Z1FJem1aVGVyMnd4M1I4QUs5cGo4VzhPRGpjNGE0OE1OejBSVHptOERKVUZu?=
 =?utf-8?B?UjFKU1VkMHluZDNiUFFVcVFYS1k1eGoxMmlnNzJ3elM0Y253UjBtMVo5MXlv?=
 =?utf-8?B?SkpWczJRUlJZVDM5dEZROE9wUkh6cmpJSW1oTlZBMkQzWHQzMkRsTlVYYW13?=
 =?utf-8?B?QmVkMm1JdFIzcnkvdUF5YytMVFR3eE4xRTdVcDB4dGM0T0I4bU03WlRIc2ZS?=
 =?utf-8?B?T29LMWE5bUtrUG80MmRZcDNOaTVmOHgrT2tWL1FVVVRuUjJjLy9xSXk3Qm5K?=
 =?utf-8?B?Yis2ajdzYTZFTmMxVDIzYjdqOHl6VVdsblBoa0w0L0s1bU1ZcHBIUXFyTnln?=
 =?utf-8?B?b2k0NzRDWEhRcVFqU1VwRVlIU1RJNklwRncvY2JCR0hmK2JodHVjeVF0UEpM?=
 =?utf-8?B?dlFQQUg5QlNXd3RTM0ZRQW5jSXJybEw4Q1MwVHZ6QkZNSzJEUnhtd2xyOUl4?=
 =?utf-8?B?bSszVjlwU3U1QlE1eDdTNjVTODlieE9WQi9LOG15VVZYb3lMOUY1bm5vMlZv?=
 =?utf-8?B?b0N6MVovQldNaDg3L2xvL01Va29OYnZmSWpjV2ZrbmtIZmcvWnJiS1I0aG92?=
 =?utf-8?B?d0JsbFliTWNaYTJNd2NUejFIWUczWEZhREk0YzFQNkk5V3NQZkVCa0c0VG9t?=
 =?utf-8?B?cEp0d3ZxUGFERGQzTlVrZStDL3gyNzRmMjN6NEdlUGJrZTJoNGZjSmxjSFNL?=
 =?utf-8?B?a29jVTBGRWpINVNpa0x5cXZCeXdUTVRGcVl2QTM4WkRORStKUENIMmlVOTN4?=
 =?utf-8?B?RENJOU0xdTFVTXVWSm55cHY1d25DRVJlWUdlWWYrOWVUcm55Vm9OTXA4NGZj?=
 =?utf-8?B?cWpFZ29oZTNqbjZqMFBKRkQ0cWFRR2Z6SkVlTXFTenp0TUZXR0o3a2I0U3Az?=
 =?utf-8?B?amVNVng1cnZUR3plZnpsQWFVVlRDWWZzUDRyU0cyRURLYnh6TDV2Sldja21q?=
 =?utf-8?B?R0lzWTdHN1ZrUXB2Q3NjNmtxK2FqU2FCR3lreVpzTjA3S0lFSFhYbUM3T1Ar?=
 =?utf-8?B?cG0zL1BIRmhwQUpnVHhPRUlTdGNSVE5GckhMS2s5YW1MbmRNcFVvUmFuZ25C?=
 =?utf-8?B?YytIUjJqVi9pc09STGI3Nnl3TVh6ai85SWcwdDNoVUtlNFdpQWJzVTV3Tnlu?=
 =?utf-8?B?ZjZSRThvSzBUajJnTXRFVE5jOERKZ1l6TjE1YldFeDAzbjJGNXhqNjVlVU5I?=
 =?utf-8?B?Z0xwWTJ2YVVoa3hvMWhScGlzV0RZeTlTMXF5VXZ2MHpPeXZpdzBxZzBQbXhl?=
 =?utf-8?B?M3o4ZHNMVFUrV0pwMFpZeGNWeGVWbUxuKy9hMk9BUm9xUmtJdDJOSGFEem90?=
 =?utf-8?B?aUdXSVp4L0I1SFlOYUxUNkZuVkMxTDVNc3R4UzJZR2hvS2gza2IydVNOS0Vu?=
 =?utf-8?B?RHZlaFE1OGJOTy9XdU12Qi93d2NBMnFpaHJYdXVFRXZLdW5DQWtUZTh0Y2p3?=
 =?utf-8?B?UEp5azRXZDBHTmJFT0FiYUphekM2ZUMvWUVRR3NvV3htQ0luUTZHcENWR0ZK?=
 =?utf-8?Q?Jj7c=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 15:31:56.7222 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ffc2a8-1e61-48db-d4aa-08de3cb83f5f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9389
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEzMyBTYWx0ZWRfXx3niKNyxUHrC
 WHt9jHuibfozMWqbDuQE2K+e3v8A3I4anL6t+TrMgeInPf7X8jb42YYI6ExAdcPX8T8XFixN2Ec
 RWkOdojioeW3bGNWL4bjEKW6cp5YHWf34FNAVyfMZ4x8MTHSoiVAvu6ENRwFfYhLHAWqQ2FuBvT
 D4hNfJPdeLM0NQ2a6cDxrnxc6WB6MU654tce0wUj4KGbx1+G2WHYBxxBhMrbf9wvJeJfw5+1dDK
 ol1Kca4a0dPsuUcr3D3Yzpk6EDKSJJgW77S3GGxaXItYk6oj52UUDz/7TqEXkiDFUIo+OrvLtYn
 5b1qKQVD9Ft9NjCFyv41GF1/IS2g2gihb4oWc/NhNWVe+Nkr2tG3yl3+/0ZYUHQu0YaVbKJ0Cxj
 LSiwgvntyVs+n3GP+GUA9gixxmL4Fg==
X-Authority-Analysis: v=2.4 cv=AtvjHe9P c=1 sm=1 tr=0 ts=69417b74 cx=c_pps
 a=4OV8p1Ulk/08eHc07QrKIg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=4BwU99W2l1L0mJR24QMA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 6K-Xgv9gtut0lcX7mmL1TiEAU0lcj0fj
X-Proofpoint-GUID: 6K-Xgv9gtut0lcX7mmL1TiEAU0lcj0fj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160133
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 2/3] spi: stm32-qspi: Increase read throughput
 in indirect mode
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

When WATCHDOG_RESET() was replaced by schedule() in commit
29caf9305b6f ("cyclic: Use schedule() instead of WATCHDOG_RESET()")
we not only reset the watchdog but also call the cyclic infrastructure
which takes time and has impact on read accesses performances.

Move schedule() from _stm32_qspi_read_fifo() to _stm32_qspi_poll()
and call schedule() only every 1MB chunk of data.

Test performed by reading 64MB on sNOR on stm32mp157c-ev1 board:

          before      after    ratio
Read  :  201 KB/s    520KB/s   +258%

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/spi/stm32_qspi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/stm32_qspi.c b/drivers/spi/stm32_qspi.c
index 3216ec8010e..1778f8c1458 100644
--- a/drivers/spi/stm32_qspi.c
+++ b/drivers/spi/stm32_qspi.c
@@ -165,7 +165,6 @@ static int _stm32_qspi_wait_cmd(struct stm32_qspi_priv *priv,
 static void _stm32_qspi_read_fifo(u8 *val, void __iomem *addr)
 {
 	*val = readb(addr);
-	schedule();
 }
 
 static void _stm32_qspi_write_fifo(u8 *val, void __iomem *addr)
@@ -200,6 +199,9 @@ static int _stm32_qspi_poll(struct stm32_qspi_priv *priv,
 		}
 
 		fifo(buf++, &priv->regs->dr);
+
+		if (!(len % SZ_1M))
+			schedule();
 	}
 
 	return 0;

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
