Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCE2BE88FC
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Oct 2025 14:19:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55371C5978D;
	Fri, 17 Oct 2025 12:19:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C002FC36B10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 12:19:09 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HCAvKQ015873;
 Fri, 17 Oct 2025 14:19:07 +0200
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49rynhyy47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 14:19:07 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNLc4dLb53a+Yemfv2MiyROss98x6hDbApWhZ12PtZh0xWi2vZm9sG54jmF4kIsE3aEmi8lt2slPNenDynIviYX6QLA4vPtwdR6aqugwuok2X1K77CV3mYEDQbvg8C1dCOooUf9VaWtfA8gWLtYfTeHphMYeOAlfj5GppzuXcSjtgyz7ZOIf1ISZrwKP0reVPKKD2f/5+OAkBr4MvMDS8SoiMzVR+fqGkHTNaMnfntCBl2U4//meZynkrPcFosK60Le8tOiqYGY6o93R6uHhHSK3azCiieE8TIZmns/T8qqqzpBHKY1GLV9vSEmkBhsDMt6je33GnafiI1UlUuvG7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBtE+oeYWpzXnnKqSzv2hColAP6WGIyLZES2Imi6r6o=;
 b=hW/IiLIqvn91GFEHj7RWizyTWGDYW2wEQakg937v+2kwK883Ra92couctQj32IR3fgGh54ENO5jnBmMDpn3UsO3ig0TIKBXzweavsGwprCsx8uVKkAJAkY4qkNnHtd55QmIzN1Qv+QBczw6hXjjOYzAocyh9PYlGUildZsA7nDvBoFmfKWlXsdakRCAJ3l7zymn0ULvI4wYY1rfN//IWSoUWZfSf56wggQm6L2MW1k3EZVeTyfZPVB8xG5H30rHLP/E1skkhWKG5eCNW68hgfvtenjNabPcVTn8/Qok1qGKh2IBIZPSGOhNmaotwHbZNq9VW8arreac/cZyhh/h5SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.41) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBtE+oeYWpzXnnKqSzv2hColAP6WGIyLZES2Imi6r6o=;
 b=jIvAiA4X8vQIyxY2zXsK6JxUSXKiEa35yAZeYAvSUyglyWP9Npj2JGTV/0mL4/CDGQD3vY1rChyFjrSecEMHYNGqaE5PJnBgCt6a3xOALNkETWfYVda+JsNoSwHLG6TjXDekKKKi5EHqa92BFgNO81JXd5uaaN2F6LXq+d8qtygibc++nO/FnL7ZV8Nb4cB8vOzBuvfjlednk1sdcNFwKrt7cVvCy5fWGOrGLag1uDRuoI/znRbudflcJr6QZdFCSHtTtn3ev8zrfuT9NbMYhZhGimFRrusnLZAkRbjhaf5Y4JnSeH4Pk6oDt8PN0F0HWiZ3OVqUwkFGzRhzNDxS9w==
Received: from DU2PR04CA0190.eurprd04.prod.outlook.com (2603:10a6:10:28d::15)
 by GV1PR10MB5916.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:5b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.16; Fri, 17 Oct
 2025 12:19:01 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::2c) by DU2PR04CA0190.outlook.office365.com
 (2603:10a6:10:28d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.12 via Frontend Transport; Fri,
 17 Oct 2025 12:19:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.41)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.41; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.41) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Fri, 17 Oct 2025 12:19:00 +0000
Received: from EQNDAG1NODE4.st.com (10.75.129.133) by smtpO365.st.com
 (10.250.44.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 14:22:13 +0200
Received: from localhost (10.252.15.38) by EQNDAG1NODE4.st.com (10.75.129.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 14:18:59 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 17 Oct 2025 14:18:37 +0200
Message-ID: <20251017121852.109561-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.252.15.38]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C1:EE_|GV1PR10MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: ec059ef2-719e-4197-1e5a-08de0d775a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?owxdu9S754XVVHHoPh2nx6WTJIo6jrTFYBtExMG93nera+PRe1+j0ls+hWgz?=
 =?us-ascii?Q?ssAfLrc26Nz2hMvxcKbR+yV/UJeWWTmUNbSIGq7tffIZGfMjvDYu8Cc/48KB?=
 =?us-ascii?Q?7rOenttDXMcKk+97e0vpANoTTkIpAQR1gvdKzOiHyg+TNlFn8q//yYanRr03?=
 =?us-ascii?Q?57ozjCjvK6tkFzPrItAn+4sqm8RYkj21qYr+a25Gqf7RFfy8eCirW82hDhLX?=
 =?us-ascii?Q?/UvaTnDKW72kklZ0n/K4ZJPYGZFCrJCpBccdxbgK1lQLUbsUsYgk3Y6UcU05?=
 =?us-ascii?Q?aBFnth+El3ZXH3TbmPAwPnoALJfttFutgRc3DTD/TkRKOSL2FvKh6/sbTAj9?=
 =?us-ascii?Q?Mv4Ll2RAGzYI2hPQXA+fCjtwG4fmN67+biV2Cc8p6gkp4iUfv6UoLVusPuhR?=
 =?us-ascii?Q?otQFx//atihil7D+4k3XDMJRL1E8U+O2Ca7Sy17+xJiGT6mCd4EHF5QqATSu?=
 =?us-ascii?Q?xQi3MthEn6e8dIMTb1oyRXmzoSvG+9UEDxSvBee+CiEK/3VeFHVpTNEEj+eA?=
 =?us-ascii?Q?GIDnV9hpM4DLxOFRbD69dyyEC2xLFT8xAzAf9ejoZGVYwRpl8l1MWsddF4sa?=
 =?us-ascii?Q?by5T+g66Q5YbtSGw9DnGay9La8SFWwHAeLdz6McPUOaJo6IJFxQBFPRLunK+?=
 =?us-ascii?Q?P3ctToBAC9+ddaggobg+lVLFDdn9pGnpavHFV23scHnPiA5aQU4ErUNPiC/z?=
 =?us-ascii?Q?rh05juBOUrn0pdgAqeI4aw+RWx1IApfkEQi9Jsi3UZEKtU0jtewb8/zom4TS?=
 =?us-ascii?Q?siSTOGz/SfIfKytpMWckxfu0skVdwri9vd2lRh4Zl43tk5V+mRr8hZHzHqkH?=
 =?us-ascii?Q?dq9X5FUtDuJxF95hJS3Dydhb2Pqz1C8GYBWdZ5cRJ8WwlQ2C50zq7MioObi1?=
 =?us-ascii?Q?eu+CqKgTNAEsab1lKVHtT066IsFb79zv6kxDrD0NgSAGB+d8Bo7aFSbNMca6?=
 =?us-ascii?Q?lp1gSMVTLyJ+OClE2vUYhLDSvcEez8/pEI84T3YVfQdtC++OT8TPPgGFQOHJ?=
 =?us-ascii?Q?wf+BxFfp50jKH9lhSEdAlPEzDzG7wQTwrrZkz84dCaJqJItAZtUtLBcj+0R7?=
 =?us-ascii?Q?Jqgq5chBYiS021MUv4D386BMiBZoJYKVjRVDaxcRouYw34n4DI7+oahgscm1?=
 =?us-ascii?Q?s8CsoFYOTV7axQehaPsVUmnXsnjPRPS0LKh1WX4ju9wwqmpGL2hWygQQR24x?=
 =?us-ascii?Q?wDrlIzLV08IhIYqizmBAKTL/YOb9P0k/GxFPmTw4PkwQaKUzb1FACC5IIuvA?=
 =?us-ascii?Q?v5x5qaSE9FWsFJVq38oniCUxlbzEh9DIcCQg79bFxM+bk+Z/FUWctP3PMP7I?=
 =?us-ascii?Q?mZZljb5CGzyvHrOLuiiMqhVjkSNd9JJ2phBnhoLWH0I/VOYfhpanDSnzARIr?=
 =?us-ascii?Q?oS5a8aCeFur4ZePxF4Z0DSMbNKdRiZlcFFr4uozQ7Q9kAC+LXFgm0PbZ/zVZ?=
 =?us-ascii?Q?m6G2q0EumbS9CNYczMzD3LUfFuNUJOZphxNJnNpi4BsfRAYv+iNESMd4j0ih?=
 =?us-ascii?Q?tcKMnrsuN1esuB4rIwfUShuh6Tsal0aFB8MEkZNjaPXyC0qGYLMVL0aiMBkj?=
 =?us-ascii?Q?/3vCMR2N51dW34xBK1k=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.41; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 12:19:00.1758 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec059ef2-719e-4197-1e5a-08de0d775a72
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.41];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5916
X-Proofpoint-GUID: lEAjdk8mdcWe83H-GxCo-mjwCTxFwoeT
X-Proofpoint-ORIG-GUID: lEAjdk8mdcWe83H-GxCo-mjwCTxFwoeT
X-Authority-Analysis: v=2.4 cv=TtPrRTXh c=1 sm=1 tr=0 ts=68f2343b cx=c_pps
 a=2LjHdM9d3nU5CJ51ne9XDg==:117 a=k+92ZC+kR50ztVuylSZIGA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=gt-GhcMM7esA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KWPT2vY4P9eYRpweoGkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA0OCBTYWx0ZWRfX9KrMH/8shDbW
 mUAp26GefqBBKMiLhdZbXov0/lCklG4R142DPo5k2zIPajXDysNrYBOV+ggsoTGLK9DpIDCMJya
 YIAbUPuBAfJGcaI/PMiYGfqA3nxmFEQxt4wsH4SGeRwb2QzNtPD/ev1SahCGqXXrYm4CoKUGSTF
 5WjAty2NDJMejeKDkKV8EQHOauaNYbgdCpBXBSlyun1ljDj9Z7V1eMubwjZ3im2T1Aia9fmacIs
 2MhAKJP8ppZ3cS0PGD4bEFXWVTLUW/LTbxgKASBeElGbMJD0iK7l0GrSCGDQIbTdY8cakrwbfGV
 aoKtQbAAQ4qL8RllbE3xCxFIEgUppoZYlhbd/EmMP94whF/TChal/MHdngjnIXkRnQl/53N30Kp
 97Jns8SWAH5ZF/s+4Azio2DShf5PTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510130048
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 0/5] stm32mp2: Fix stm32mp2xx-dk board boot
	issue
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

This series is fixing boot issue for STM32MP235F-DK and STM32MP257F-DK
boards.
STM32MP235F-DK:
  - Update syscon compatible list in STM32 syscon driver
  - Temporarily fix watchdog arm,smc-id value
  - Add txbyteclk to avoid error during clock registration.

STM32MP257F-DK:
  - Add STM32MP257F-DK-U-Boot file
  - Temporarily fix watchdog arm,smc-id value

Patrice Chotard (5):
  ARM: dts: Add stm32mp257f-dk-u-boot.dtsi
  ARM: dts: Fix "arm,smc-id" value for stm32mp23-u-boot.dtsi
  ARM: dts: Fix "arm,smc-id" value for stm32mp25-u-boot.dtsi
  ARM: dts: Add txbyteclk clock in stm32mp235f-dk-u-boot.dtsi
  stm32mp: Add stm32mp23 support for syscon driver

 arch/arm/dts/stm32mp23-u-boot.dtsi      |  5 +++++
 arch/arm/dts/stm32mp235f-dk-u-boot.dtsi |  8 ++++++++
 arch/arm/dts/stm32mp25-u-boot.dtsi      |  5 +++++
 arch/arm/dts/stm32mp257f-dk-u-boot.dtsi | 26 +++++++++++++++++++++++++
 arch/arm/mach-stm32mp/syscon.c          |  1 +
 5 files changed, 45 insertions(+)
 create mode 100644 arch/arm/dts/stm32mp257f-dk-u-boot.dtsi

-- 
2.43.0

base-commit: 22859b2fb25cb5c6cccc48a7dda49a05e9276e12
branch: upstream_stm32mp2x-dk_board_fixes
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
