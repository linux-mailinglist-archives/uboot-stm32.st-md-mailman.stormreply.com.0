Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61187CB661A
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Dec 2025 16:52:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30B42C5F1FE;
	Thu, 11 Dec 2025 15:52:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2454AC7A832
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Dec 2025 15:52:48 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BBFpu7f939406; Thu, 11 Dec 2025 16:52:16 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4ayua5sj96-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 16:52:16 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJ+OyQQdmlgmPY1FJ71yNGKMU2DikmQsfLIRJcu14vyg0NGmqwk+xXjyLtGbZRo4UoJbakpnsAWagZQCywX7eWIU0GNTG1VmFO0joT7hT1DScYwJJpfz3RrP7P0bJiIorWWPGOYQr+jiLggXDR8lu0Drj4K7RzpYOK8xqGYgUTXBAUt4jMnSJwUqdArrQ/TN8xSyhLFWrIZnt3THx+5tJSd92Sx67h/430YULQSINx8QR6o2md0RgpjhLkm7+yRV/IB+isvWpRUm8yn+g8hQIdTjY3o7MGAO5BTVuLyembTp729lOj1uU0uUMIJGvEc8//TUmI5UoLKWyx9gRYf0dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TKyR+1Kguu6Ap9Y3bAosHEayT8GAECR7zUT31Ibnh0=;
 b=l3cYhH1u7oxbD0ywSsc1XRJzg9fhi5i/GuCLeeu4Dum0exTnEhrgiU22b32AfoDNm2KfbjnJA53+TDIAwk3qMUJMFO0NV5DV2jrcvkj2rXg2Ny0Gz9grYbKgtdTIJzwoSNURV9MQSJU39rXQAgsrKOOJucqbiur46QeetfBS3tJXDAIUm+oTc8V4nqnXC+NBr91/1RDzom+5kweBkdNibGrE10UA1TMdYtHoad8AAhisAUanoRFPTc7jU6ET08+GJi3HRmTo1tD6VoB3HMaEdPpeMR6trG6efP4Rr3OODtuzp3ZYloXt0RaCMoNujUC6PwJ8J7t+JblARHUk6/YUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TKyR+1Kguu6Ap9Y3bAosHEayT8GAECR7zUT31Ibnh0=;
 b=hKGTuDGwcwg2FdbkUY90MFQQJHy1UYtJ0DuOGGkX8MHWtcZ/BOx8J3zm+THp+MpH9EAcoIW3JNx2vHO602ePIMkNokbBCUgxGrs7NC+79ZrQrn3yM53GAaytjeDCJ5l5W0KmBlQMyJQqwJQVTGCoL354M12x9frs/BPGoTr4fvC+xsfal/hYX3jcGqMjfzPsZFORNCR2PnMJhGBg+Ny90pO3pTlT9y1WiOKYJKo+R0D8K/MSp5UXXh3uo0aieBpuX8TNSU9UVaAFoYVkpL40NAasGU3XCUWNSPM1x1hMBt3CFsr4kzNE9j1CGWThAxJRPNB6bHcMygG7emIFiv/ybw==
Received: from AM6PR05CA0023.eurprd05.prod.outlook.com (2603:10a6:20b:2e::36)
 by DB4PR10MB6967.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3fc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 15:52:14 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e:cafe::2c) by AM6PR05CA0023.outlook.office365.com
 (2603:10a6:20b:2e::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.15 via Frontend Transport; Thu,
 11 Dec 2025 15:52:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 11 Dec 2025 15:52:13 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 16:52:53 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 16:52:11 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 11 Dec 2025 16:52:07 +0100
MIME-Version: 1.0
Message-ID: <20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-1-44e6e7de2beb@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|DB4PR10MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f5a10d-0023-4f83-344f-08de38cd408d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmxOdHNIZmhQWXU3VzUwRVpEN2dwS2syZytuaUZ4aitrWW1lM2NuVktzN215?=
 =?utf-8?B?RVdLSDJ1ZVVoa1BmT2MwVXdVcTU0cWViYU1kYzBRUFpHOUJMeVlJZFJyUzFS?=
 =?utf-8?B?dGZVS2dSdmF2RFF3K3BLUmxTeE4rUHozOXhRSkQ2WWdBSHdybkZ4WHdaRk8v?=
 =?utf-8?B?cE5ocWhYZW16YjVqbEkzZTBWaHFLcVhnWFBKSnZ6NjFZVXJLRFA0UE9xTWpZ?=
 =?utf-8?B?TWJCYjhuZjhCc3FjQW5mWFVwOUFGb3dGei93elQ1VXlkWW5mckxWekk4cUtI?=
 =?utf-8?B?ZFJLam9uRUNUTmZhN1UvV01McHRUcXNIeWtFU2RkMW1lNjgvWVRFbkJxQXB4?=
 =?utf-8?B?aWtYcVBDVThFWUQ0NGdhb1FhajJTVzRwY0Ivd3k0SXFVMTVlV3BmcXQrUE4y?=
 =?utf-8?B?N2NYckR0RDd4RnJjMEx1cU9CQ3JVWW5pYVd3WExqWGo0ejI5OG53NXdYVWk2?=
 =?utf-8?B?T2ZRMTFxNmRidENTaFdvYkFYYjVsN2JSejdMM0VzWXQzcGhRbWNPT3JRZDFj?=
 =?utf-8?B?QUd1aHQ4UUk1aFZJcWErNUJWYldvRjMxdForSTVEbjg3WmE2V2pFaWpLVjB3?=
 =?utf-8?B?MFZUa0lObXlrd243blRSTFBYSlJrdHphUUxEdWR5SFAvajlMcmQwZTNvL2tU?=
 =?utf-8?B?cnZ6OGVFVWEzS0x2U1ByVDlJc01YMnI2MFM3UUFpRGx5MFlUZDlEWmc1dXA5?=
 =?utf-8?B?UnpraW5EMzdhL05KRWovb2JFYVBpczRjckRiUDFOdkpYMXM1eUNsb0xySlRm?=
 =?utf-8?B?UU1hUmVmTUNXd3NKNngyNVdoaDVtaVNLQ0thaFkyYlNnbDg0OTFCd3B0ZzI5?=
 =?utf-8?B?ZStrdkFrcVdqcnBySmdUOEhRTWZHc1JSYlpWOGk4OXRKVUhhRE83UVBqZjNW?=
 =?utf-8?B?QUtTdGJRWFF5MVExdUdPQ2dXRTJpVlB5c2dRMzQ5RmxaM3VMcmtxbUhWbG9r?=
 =?utf-8?B?UUdCQzZEbWpmUTBHUERpUEs5UjRwWDJDUzlJeUlYWk8zRW94YmpvY2R5ZXRI?=
 =?utf-8?B?bFozWHYvMlFoU3pSWTB0ZkdPdDFESmNvbCtTMTArZ29CV09TSlhCdHhDbDJY?=
 =?utf-8?B?UnRZTmJYbUp5WmR2bCs3QkFDY1NJSDQvb0RJbUN0cGp4TVlOUzF4Znppa2Fn?=
 =?utf-8?B?d2E4STJubVZHNU9rdjl1MnB5RGR3K2RsVVF6bW1Obi9YU1pZelR2YUM1eGk5?=
 =?utf-8?B?ZkJROEVDTVZRQjJlNFNGUVlBYk82clVqTW9VamhsRUMzVzIwVjhCeldwWnNR?=
 =?utf-8?B?REg2WTVtUWp3SUIyN0ZTQkJTcWJ6VGN0UDRVQWxQMjFPWUcwVkVLd2RxZThZ?=
 =?utf-8?B?aHNnVm9reTc1cS95amVRUXcwSjU3TkVSVE8zdXluUUIwbXVuckNSNGNNYzRm?=
 =?utf-8?B?SEVuVFFWSmwxOXFpb3EwWkNDOHhWTk1kbUk1clo0Mi9hMlN6NlAvUWhEaFlJ?=
 =?utf-8?B?NmM1bW1hN1dnWHBrdm5SZjZnMWhEa3pEcjdra25QMHQ5bDIzL1oxR2hvRGJG?=
 =?utf-8?B?eFNCN3dVdEZ5VHRBTEFOb2w1TnpoQ3RJNW0wTXlkQVRtVUoyQWx0ek9NLzBV?=
 =?utf-8?B?MUZmajgvQVUveTRnNXNSV2w5cGMwMjg2TmJKSEZWV0VmREpZTnFod1UvcEVL?=
 =?utf-8?B?cVpuT3IxZU5MUGc3aENJTHVGUHBicWszNUlDcFpGb1BoQkhRZy9OTzB5dGdJ?=
 =?utf-8?B?Tjk4cVZZM0lLZ0RWdTY3bFBFcCtXZzVla0FlbEswQlRudDkxNmhmZ09HR1VJ?=
 =?utf-8?B?VDd6ZUV1cHpaK3Z6Rm9GRlNiclQ0V3c0a2l4SkYwY1pBRFc1ZW8wSFliYm5w?=
 =?utf-8?B?MTBTZ0xvRjBDNUQxaitSNHFwaHFVSlB4bDF5M1V5TDh6Mjh4bGwrL1J0cEdE?=
 =?utf-8?B?eHZEZ09tS0VKVXVsSEFWZGtUeTg0bVI3WWIrSmdQSnpvQkxBS2xyWDVzTU9r?=
 =?utf-8?B?cjgrZGlmcTRTRXJDL2FYeDJ1dEpTZjB5UWphdjlIdmJRdlhiSWpjUkhNN05J?=
 =?utf-8?Q?ptGtiOmWi5204QOVDkpdmgcpTR4A2M=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 15:52:13.4841 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f5a10d-0023-4f83-344f-08de38cd408d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6967
X-Proofpoint-ORIG-GUID: jQrmm694hh9kjjrS568CiWzlssMlHhJV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEyNiBTYWx0ZWRfX+bbhkcY0pRVl
 mlQQ+x0O8ZISaCD+G8RBjBzj2HJkyoaMqzIh2BCDP20kqKkYZInjezqZB9PbYtF4pUq3H58FAcW
 biH9NrxiQWgM+5C6ObuUd8Hmsht/Rk4h8sYtczNADAwMNC8Bzkad+vYvS0ooI6RmTcchXDy9AbQ
 5fDEM1SiZRL4LZciegkC6p4tPNmMqFVjso++LH0LF8d5NDvu9+AnIKlRXDc/0k6D9d5DcXt85mo
 QwEUws1KSns/sqh+P6iwcEPh473jSjOomv6mmIk9jiU+ojEl060LHJXv9DhbtTC4VeUpTCdsnfi
 mJKAL3idsLbnB7aRJ3ExD27XUSQ3KyV5zI8H7eudNbHxyDTBHASsMQ9FjNQJXY+XLqA/a4gMOzE
 a/MpfaytXFzpLxuLO6+Y8+kGHQHoIA==
X-Proofpoint-GUID: jQrmm694hh9kjjrS568CiWzlssMlHhJV
X-Authority-Analysis: v=2.4 cv=DuFbOW/+ c=1 sm=1 tr=0 ts=693ae8b0 cx=c_pps
 a=6Pw2HDITFjG6eurhcoe7lA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XpE1AkgCAAAA:8 a=8b9GpE9nAAAA:8
 a=nbd5YjTvAZBodSl5FIYA:9 a=QEXdDO2ut3YA:10 a=_VNrz7lXTIYA:10
 a=dpZMgbseYPk84XhQl7oQ:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110126
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 1/3] clk: stm32mp13: Reorder include files
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
