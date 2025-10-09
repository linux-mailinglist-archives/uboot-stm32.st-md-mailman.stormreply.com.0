Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2157EBC9C51
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 17:26:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D77FEC555B3;
	Thu,  9 Oct 2025 15:26:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12B2AC555B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 15:26:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EFMg7012018;
 Thu, 9 Oct 2025 17:26:16 +0200
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013009.outbound.protection.outlook.com
 [40.107.162.9])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv6h4t7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 17:26:16 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bx3ROGcN8HXSyHtkHSYGnWI4Rm4YsEmgaXQar2LDS0J91dDHecI7qUiC32q0i78dptl9nT5h6wCnwO6clWteRjpMtdWx9gvRCka+CzMLxB0MPQ5b1eq56vPi13hBOI8gvK3GGphb566qB/9SZd2YGyViw5l+JdrLaIC0M1N7q5WrdxEYTNdWLn/ljDJkv8GK/JfFtt/EFyGUAnWNXInLir1X9TrmA45wnnD5ImKfI/1ecJGHK/1Q1T6BO1IrQi+Z7+wQThoPeukDH7IZK1uHZWxM3XPrmxomUQIiQvTJU8gwbqU15btZ6roiEqu4QuctTTkb9nJ0walh6xVuNnozWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLjxjFToixOFUXymyggSIYK+edpo4F9LcO+ebTiPtWI=;
 b=OGsFOaRQ6OdavYbV2O3I9HCNqVlDw8CodpNkr2a6dqypRnKSq8CRQj1NlQaFA5WfDMWcmqLoKJXsQDYnvCQitG2JQYF18NV67kzHL1NNXA/hBUvsnMTrRwLNQ9KgA56uilNj2pDflN5nRD1XxmdljHQqcK9Ii5AhNpZLbowdBUa638PW1HjTRZgG2Soi6PVpMIL3ZdwJcvGftDuDYyjZxcxSEneJYsNMNlZtqQrHr11rRGTgv5RnUNYqvvDnps8X1oSWHFannvUX0VLAJ2VbkpgAInmODPP0PtZrcAJ0MH4O9/Om1XV7Vby87XH1Xe6wyIOFW7/ANJFQO5vVLgzf6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLjxjFToixOFUXymyggSIYK+edpo4F9LcO+ebTiPtWI=;
 b=Q+cFCRAcE+JB14OKHQDfr6x5TdYZWDA1cdx17xCXqLK/y99/X0KGru/dNTy0dEAT8x3oYKFVMpCzcStO1+rHhuU3UUUK0Z+nkcPHpJ18N4cD0+LebeiJ+IV9h6bL3Uxvar4X7fGL1JHaVUG9jREArcwWdeYbBC9K6smX1eRuUNJXSuQ1N3Ps7ZvmzAEEmDBS6sD6YZ8dd9S/M3AmSkiev6kMQs/C7zCtqgh60BOAcxFLGsbSBP8Ozeu21VOKgWioH3sJYWRxjvczDMLK7ornp4pIpoSvSpEx9EFlUU6X3emWwcLA2K7PZ6FIR5eRy622GY6q4TKcob+tA6pe5yV2Jw==
Received: from CWLP265CA0322.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:57::22)
 by DU0PR10MB6930.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:415::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 15:26:15 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:401:57:cafe::3e) by CWLP265CA0322.outlook.office365.com
 (2603:10a6:401:57::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.19 via Frontend Transport; Thu,
 9 Oct 2025 15:26:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 15:26:13 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 17:19:05 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 17:26:13 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 17:25:57 +0200
Message-ID: <20251009152610.300154-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5E:EE_|DU0PR10MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: b0718ed3-1029-4572-f2d0-08de07482ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0B67vtH1P3VtX0iJCV8hvwXU3fcwCDk1+LDh6Xg9vd4S4VxN7cu8cFk8136z?=
 =?us-ascii?Q?ECZBykqXhbP3RiCq6wr/6az2ZX3xTFgLugM7usUSImakLLanUVlGEQMiHC24?=
 =?us-ascii?Q?qSkt9oB3+NQtyAVmIlpyayWPLORK5xHdGIjf9pCLywBQXbKbfHUO8vkzhrLs?=
 =?us-ascii?Q?lAPLsKbBoH+2mvZxlyiK3ehcdA2C4EPbHD9aFfJbcH+WLtVpXagZgXnWQc+F?=
 =?us-ascii?Q?lXUJkJyrvekLjsmz/Wls7xkosrDJnZ9P3jB9lfDKp6lkP026oVNTcRK7YGF9?=
 =?us-ascii?Q?cmgjNupfoNwHdV+RKevt+EuX3fXQmxbbJM8Y0hEbJUFiZTVAL5c70fPPHwj1?=
 =?us-ascii?Q?qZaH2P9xk1wjtoqJORs+WdbDOFOTRGvWJo122HDvInzz8X5uede1B8fWWAUt?=
 =?us-ascii?Q?kRiirDoFIbWY1c62F8sMLC4l+XD7st3vfVwT5yyEhbqb6erstptXF5v0tpmi?=
 =?us-ascii?Q?VJN7KIpwtmtSWskIHUPgBis7jjbjPNUgp6GBCXX1a/CNxLqdbxxVykc9D47y?=
 =?us-ascii?Q?BLhjne9zfZNYbB3tASEybZDfrIwQ7NJ89+//egOYpQMIoxMaK8cXx4+eqeL5?=
 =?us-ascii?Q?ExHLfOgdb5+McgpCuhWoIl9iRWHFfj6Th4ac08x6jwhiLqEIuQjqGPWUcp6U?=
 =?us-ascii?Q?C/7mZ0vnEM17BguM+yFxQNnMStRxQ7y2JYuJbVMAkuX2WNmK7rbwfNgx50Yv?=
 =?us-ascii?Q?SWMcG8gsQvuWMDqwtZTipsj68O+ULSxxsRIh2SDaVX/qKu2fj2vON5Pykn3d?=
 =?us-ascii?Q?cuJWX6N+JaUvIqayi2ICYIg5+JRopb0sYZVxZCdLL6OypiOMCBhi+mIz2J4m?=
 =?us-ascii?Q?Oe3hd8c0z3f44Qc6aBTZviTj6uH848bh8P0rCveLnPwzPUasxAXVc5mW6UYd?=
 =?us-ascii?Q?1pp3+8HTO278yqj8B3UUqp083QiyKIBn7XXcx1SaRqQD5ddM1qmKFejFj24i?=
 =?us-ascii?Q?0cJwZ5dSvCgiFXLX6zYquuqb4TWXngUVm4ZYPseUo8OD7nSKhlLiyvDBfKZG?=
 =?us-ascii?Q?+wbRDvGm7/zjaLyz9720v0BTGf4xslkDAd/2RyJ29B5Vs8FvgrZqlNEtJng2?=
 =?us-ascii?Q?kZGIxewgXr+zmcpgbGP6WEDPP/NjbZrjD8C8g6oLGlnCqr7AnD38NQEieSrX?=
 =?us-ascii?Q?By5VOkv00rIj7ENQo6/hOF42QMcxWrBR65VJMjZ2doXvlxRKVdo50kWFac9w?=
 =?us-ascii?Q?0cab00OEvK5C1Ol2Jwyrwx5QDFsVB3NlTxjIg/hdQJbbmR7mzZv5ipm9z2GD?=
 =?us-ascii?Q?VSslVmfEcA+0OlY6W/JjDAe/25tCyuBG6lBaJV5I6VDVzK+77iHP21g580ve?=
 =?us-ascii?Q?PB2Y/uwt+d8xJGl9bRN2pPLcwr2ZKNfVtAiiH98G29qtfOA+kq9AK2XJF0Or?=
 =?us-ascii?Q?9+KutYxtyJNFe7j9IjzKtEbjqp7oITsmp2WkLyyvRquaQZyhXybFrL2jYMzs?=
 =?us-ascii?Q?tFKap6m98FNhTd0ecalETRBIqMC7O8NelOOFc8BraCHuiVyGiYWR2Y4h9dj8?=
 =?us-ascii?Q?n4IF4l6gWkKYMQ6GNSRNUjYfzJcE08TlMArJkC/UXH5bJlHCEx89wM5X78/M?=
 =?us-ascii?Q?8FCPWkUmnZpHW2PQxu4=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 15:26:13.8719 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0718ed3-1029-4572-f2d0-08de07482ef1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6930
X-Authority-Analysis: v=2.4 cv=S+/UAYsP c=1 sm=1 tr=0 ts=68e7d418 cx=c_pps
 a=LGnPzPuKiaZPXrRM6phl+Q==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=OGTKLwYVIRPyTWqAaNEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXzZKPciFAN4eC
 PsqJQOx8WOtZKs8JpTQzi6NyDPx0++OP9B8fxQiZyExgUyK9CCBJWH7ZRBze4ssl8OD+8yjtcY1
 qz/6C5+BkT5XbQMxYjLKIrfVJPxaPT+9pc4tzDvs0FkNQxe9lWWHGHr+wfc/n8B+HevqAeYO5ED
 Ugn6rlPola1HWmYX8+g42qLHQxWki0z5pwpmeHYaOX/NykwLPm3h7tp90tW16eK3DIU0wd6VuN8
 f9CGs9ATFyeKNvRNEcm80nOdwP+q1iUnGgKN6+V/4T+Pll7/k99SxCwqU3DcvyFy7xNNajtW3gc
 s6jKmuTBcsGaK08DSUyBvVwE93rnwazpMRE7+djiqzXglAMG4TU0lu94cUMIlqPomzCV37znSuS
 HHjEFpR4Vmg8truzFSM0VFvJb8CNdg==
X-Proofpoint-ORIG-GUID: xoOEwRbZae0YP4mOxaoPQ7qZj6szn7Ht
X-Proofpoint-GUID: xoOEwRbZae0YP4mOxaoPQ7qZj6szn7Ht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 spamscore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 0/3] stm32mp13: Add ADC support and USB
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

Olivier Moysan (1):
  adc: stm32mp13: add support of adc to stm32mp13

Patrice Chotard (2):
  configs: stm32: Enable ADC support for stm32mp13_defconfig
  ARM: dts: Add st,adc_usb_pd property for stm32mp135-dk-u-boot

 arch/arm/dts/stm32mp135f-dk-u-boot.dtsi |  1 +
 configs/stm32mp13_defconfig             |  2 +
 drivers/adc/stm32-adc-core.c            |  1 +
 drivers/adc/stm32-adc.c                 | 79 +++++++++++++++++++++----
 4 files changed, 73 insertions(+), 10 deletions(-)

-- 
2.43.0

base-commit: 0eaa4b337336dbbe93395d1f2ccc18937eaafea2
branch: upstream_add_STM32MP13_ADC_support
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
