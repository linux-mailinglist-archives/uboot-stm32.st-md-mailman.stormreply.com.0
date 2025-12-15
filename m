Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BA8CBE701
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Dec 2025 15:57:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04380C35E2B;
	Mon, 15 Dec 2025 14:57:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F1F0C36B2A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 14:57:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFEZme42711774; Mon, 15 Dec 2025 15:56:47 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013006.outbound.protection.outlook.com [40.107.159.6])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b11m2nxc8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 15 Dec 2025 15:56:47 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSKtQipo07AGVZ5G1G/zELqdqbBifinFb5GooOFG1BvIO0rf9+exHcu3n2xistVuEvAJY1lBk+zCi5KwM0qgQ89Pjjju74rp+Q0GFWjR81+/VFwetkm8Az/vY6mq2UsPnT3dF9eDAeGw5DjHnmeZGKkdcDNiH3+IetFctru2CwZ+jQ7FQ4HZ7VN+NK60+rmHC5vNnPacIWNGyrG4oAlJC5ZlX96GPppCzfVwfJIHlSrlZnOB82Y7rqrJ+/6KRNq5FcXGroE7U/s6rEJXEc/+AVTTqwuArvMfiujjl4RNL1G8aNUHCjKV0LM48JVqZoL+VDDt4SCx/LkRmEa9EllKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TKyR+1Kguu6Ap9Y3bAosHEayT8GAECR7zUT31Ibnh0=;
 b=vww4YJjA/5mDskT5rbrioUYV8QbJRt6yIDVOt8KX7oT+GuEmGYEwxVTU1MhUZbQAFwkkgwTMlBbJHt8AX8NatFSeqmGQI/YJYZXncMvOfykIpsfOCOjrL+weUHNuv946+vS6xzxiJJ9l2yLq10ULcfKia4iDU13pY3P5NLGXziwcbdTZIrvfPwniGFVUyal/ptSNmzunfNZAmsDxbsYO+xlSmjH9KmjpXc0nzEyOB+pK7NLfY40+P6Fchu8nBKBiWjg0MnY4NWLmWUeZpFN8HxUWXmHJUaVstHK54aHBTTrp62tj0HIGfISDWNBaaK+YOmO+/C0Sol0gFRgv2nwWuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TKyR+1Kguu6Ap9Y3bAosHEayT8GAECR7zUT31Ibnh0=;
 b=hFo/R9AbcS/4xXa1XkfpHEIBWr71weDBrvPLkvkOXFtpxCidtS7Zbby/N6mJY/26FyO8dq11XQrpqt8uhK8p73p5aQMkNsgbne5zR3ovc4nyRQ+OMp7GZ28ux5YMCfrBsSnVjqsYVdxYbiwZrdVidYR45EEBppU5xRTdqgheNPk7EOtRejZjS+J7R5BZ/ZYrMpIWPZbSkRMrpMRtYwvOFjey22PZF0gPOZ+I3W3zzIRU9e+1RIbIRBhP0HW07pDE3pEFej5+DvMbh792Un3U/OUsEdHrvEjt3HSiVURlbiwrmICiFB9wpCp4ujA3ZGJFreZqHeABV4Ges+/mQPv1HA==
Received: from DU2PR04CA0156.eurprd04.prod.outlook.com (2603:10a6:10:2b0::11)
 by AM7PR10MB3844.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:179::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 14:56:45 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::28) by DU2PR04CA0156.outlook.office365.com
 (2603:10a6:10:2b0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 14:56:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 15 Dec 2025 14:56:44 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 15:57:27 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 15:56:43 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 15 Dec 2025 15:56:42 +0100
MIME-Version: 1.0
Message-ID: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-1-d055da246e55@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00039231:EE_|AM7PR10MB3844:EE_
X-MS-Office365-Filtering-Correlation-Id: aed1ed85-ca22-43a6-e68a-08de3bea29fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzQvNjdJL1pMN09Qb2Izb1hyVjB3Wnp6Q3FmN0h6b1NMdkhKZllhYTkzeFFY?=
 =?utf-8?B?ZDIxYzZvaVZ0RGN0T3BYYWtjQlZjN1ZEcmlocU9INzgxVC9XaWZQRGtweThj?=
 =?utf-8?B?QlVySzV3WVJvRG05eGVsbElseFpOZ0xRZXhFd2VjODJ1aDY5cm5UUGN1ZnRF?=
 =?utf-8?B?UEFSK2dNOS9Tak5UUG1sVFpwRGdiZUF0YU5QTnpaeWlYa0VaR0F6ajFURGhT?=
 =?utf-8?B?T1p5UENOeWI0YVB4TlA4MG5meXdCejRtQjYvOXN5MURvdW5CNzFmT1J6Qnpw?=
 =?utf-8?B?WnBLa2wzRGFxbVFZS243QjY3RmtqbWszTVVHTWhaemNMelhGMDdGeGNlUWJk?=
 =?utf-8?B?M1U5TjU4Y0ZWSEEvTFNacDhmWCtmek5rQ2szd0djSlZ6My9PTDJJOHdDRThz?=
 =?utf-8?B?dGYyLzRVV2owMWdSK3E4bktUVlU1T0NESDEwMHExNUlnbkRRa2x4TklvUUZh?=
 =?utf-8?B?V0pxYSszTHZ5L2ZqcUc0Z0pDdDdGc2hVSUlrU3JhS1N5K3pyRk9qZVRBL1hE?=
 =?utf-8?B?M240eldBV1NqeGYzZVM1YjNrakZzZEJDMHJNeHMvUnM2WHlYQjhocG1MaEtK?=
 =?utf-8?B?eUUvNmxKYXhpalJlVjBhTW1QeTZaMlpSWnVzY082SnhrYWVzT1BrUWhXNGtQ?=
 =?utf-8?B?Uks3aS9rWjg3cWZhYkFXTmNGZVpPUS9rMG5HSmthU2pjSnF5TDcxeUxYNk43?=
 =?utf-8?B?dlo1UXI0S09EQzhhK0s0dUZQOVAwZ095ZGdSL2FucUxIWXFXdDQ4d2JIUWNS?=
 =?utf-8?B?dEl2ZmIxZ1FxVlFKeUREaWhsR0UwVDdEWTYvSzF1RGpPa3M5d2N4WDk2TURF?=
 =?utf-8?B?MHNMQWFEN0lqMnlpWkpxQUwxVUVZWHlJT2swVGcxU0RTY1c3czNEZlFZZEFq?=
 =?utf-8?B?K1RzODFvdUxBdGVaQzZFc284d25vNkxvNnlDdzN1SGFpaDA3UFJiRDhzVGg5?=
 =?utf-8?B?LzZLZWdpQkJ3SUZDNDd5VGYvZTVOUGJ6N1hBMkNWNSt5ei9hRGh2bUF6WUNa?=
 =?utf-8?B?aGRMUmJtd0hKSitTZXo4NVZRQUYwc1daZktQQXBMakdxSGxQZnRicEhncitp?=
 =?utf-8?B?MlFwWFhQM2d2a0ZsR3ZrNHhxVU1mTzIyYjZCY0NpTkptaUVQTnhpV1NsVk9X?=
 =?utf-8?B?SmhxcDhZN1JmRHdld0JQQXVDb1RpczNyRDE2b0NLQzRhbGpTU1BCcGsycHRx?=
 =?utf-8?B?WFlxcmdsald3Y0wxOGhHeU95NDZBWk1sbVNMbk9iMEJiSkxIRnExK0w1azhI?=
 =?utf-8?B?Rnc1UkVqcnlqZ1hwVmRTaWo0WjNKcFl0bE5WWkNtWmR2TG94MkNOdXN5cGZl?=
 =?utf-8?B?OFVTQzV6UzVoZWs5TXplbmRJWEtnaUVHVnh3RjRma2ZFdEZIeER6ODF1c2RS?=
 =?utf-8?B?U1ovVlNwOTdkT2MzeG9TVis2ckozVjM1OVl5S0NmeEpNd2s3Y2hFdXFYb3Bj?=
 =?utf-8?B?MUZEOGE2WGYzTktTdHpFUXQybFJDRVhNSHEvWTUxUGVOYllhekJVZHBZMS93?=
 =?utf-8?B?TUw4Qzloa0VXQXhuY2hRVFZnTzVMdWhqVWl4U2xtWGx0MkE2MS91ekROeTkx?=
 =?utf-8?B?ZXpGZmxraHN4cWEveU1tY2o1TStBbjRydUk5YytLcHNFZWV2SGVDNDlCZ2w4?=
 =?utf-8?B?NG9wNzRrRW1IaE9vbC9FWHRublUwTFZqNGxoZEt6YTYzNkZINFdmUzE4SXZ6?=
 =?utf-8?B?VVdTcENDNnhNd1N2ajl1YmIvMGUxcThtaXdVWFhiU3A5c3JoSktVWHNUY29U?=
 =?utf-8?B?TjhaSXEzaXBMTFJZSGc1NmRwQ3FKUk5IZVJLaDY5S2FxcFJaRnBFZW4yNXhP?=
 =?utf-8?B?NzREWW1HbTlvbGNsTDdvMGJSNy95UjdZK2JkTXlwNm8xYVJpZjUxZTVxZzBB?=
 =?utf-8?B?eUh3aHpILzVqdmVzMTB3alhNREIzRk5UVGpicWxkZ1NXVXd3eFA0akQ1N21L?=
 =?utf-8?B?RlZYUVQ1YXUrcjNBV3JJM0xJQ0owSUJqOGIxVURVNmcwTElOQ3kzSTdXMFJ4?=
 =?utf-8?Q?05GwYtCv0E2SxeHNdem126CevTwQ1Q=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 14:56:44.5035 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aed1ed85-ca22-43a6-e68a-08de3bea29fe
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3844
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEyOSBTYWx0ZWRfXw2R1VhawLYyg
 /HvEcEuOmN7I5Tt5X05/Lj71GymNZRSVAAhS/IbqtVzO9n0AnaaaJhwCHwMqNPLlqpaGtnWwaaY
 5h2zD3AwBjqf6Lw18o0en1n/n9r/IrduWZmc9L/iUUD0bxqjYJALVW5/qvFUvNiXNe0ntfrRKZG
 aDPfiHn/z7LK4hfnB5sHZJC3kw4tv1hE0zA72fOnsX4LpShXZNBxTZpLsjlzRQ+Qr7FIQesa766
 8wFXigTsFosuhNDanjCXejyGeGYZoDC7E0Tuu4owrA1QunRJZBmeY90/XB37jPq5cKTW4rmvOAI
 xcQaG5Jt6HAGmtN7sarVZZoEsLC21p8kZP8mfgg6UxtSKbxf3//qaq9OJvOe6S4HB2GsRex+JSo
 byoFUk0HP2HbK9OQ7k5GitKEnZj8hA==
X-Authority-Analysis: v=2.4 cv=Jsf8bc4C c=1 sm=1 tr=0 ts=694021af cx=c_pps
 a=V7bJpFG2U8+55D0nNporPg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XpE1AkgCAAAA:8 a=8b9GpE9nAAAA:8
 a=nbd5YjTvAZBodSl5FIYA:9 a=QEXdDO2ut3YA:10 a=_VNrz7lXTIYA:10
 a=dpZMgbseYPk84XhQl7oQ:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: V4ogEitO7_4tyN_FbNd2VDR32HqhQEdD
X-Proofpoint-GUID: V4ogEitO7_4tyN_FbNd2VDR32HqhQEdD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_03,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150129
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 1/3] clk: stm32mp13: Reorder include files
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

Reorder include following rules available here :
https://docs.u-boot.org/en/latest/develop/codingstyle.html#include-files

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp13.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
index b4d0890f902..18e9ab364b4 100644
--- a/drivers/clk/stm32/clk-stm32mp13.c
+++ b/drivers/clk/stm32/clk-stm32mp13.c
@@ -5,28 +5,26 @@
  */
 #define LOG_CATEGORY UCLASS_CLK
 
-#include <clk-uclass.h>
-#include <dm.h>
-#include <log.h>
-#include <asm/io.h>
-#include <dt-bindings/clock/stm32mp13-clks.h>
-#include <linux/clk-provider.h>
-#include <dt-bindings/clock/stm32mp13-clksrc.h>
-#include <asm/arch/sys_proto.h>
-#include <asm/global_data.h>
 #include <clk-uclass.h>
 #include <div64.h>
-#include <dm/device_compat.h>
+#include <dm.h>
 #include <init.h>
-#include <linux/bitops.h>
-#include <linux/io.h>
-#include <linux/iopoll.h>
+#include <log.h>
 #include <regmap.h>
 #include <spl.h>
 #include <syscon.h>
 #include <time.h>
 #include <vsprintf.h>
+#include <asm/io.h>
+#include <asm/global_data.h>
 #include <asm/arch/sys_proto.h>
+#include <dm/device_compat.h>
+#include <dt-bindings/clock/stm32mp13-clks.h>
+#include <dt-bindings/clock/stm32mp13-clksrc.h>
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
 
 #include "clk-stm32-core.h"
 #include "stm32mp13_rcc.h"

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
