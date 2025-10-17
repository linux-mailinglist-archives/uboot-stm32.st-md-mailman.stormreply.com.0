Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF88BE8A47
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Oct 2025 14:47:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0E19C5978E;
	Fri, 17 Oct 2025 12:47:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BA9EC5978D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 12:47:40 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HC7ruB016470;
 Fri, 17 Oct 2025 14:47:36 +0200
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010047.outbound.protection.outlook.com [52.101.84.47])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49u0ap68tg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 14:47:36 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUm0Mph1x7HD6pi/MiwtDDFajHSvgp2AQENOxuDzUt/EO0Rfmby5cRnIdhmtHyRuNz4nQGWpaWu2peioFIoz1ljPC0hdiAkTEDJpq+JcgHidD079JYcGkNHhZvkj4ekXAwy5YEBHqTf6TUO5kSJpdw5LCFeI0UiH8QZZXKlLUTb2TTnziJE+jp8GptiYRsEcWKSroBuDrbLqiV6c00j7aRdUL3XkfiQE8GuSkfSzFyLtslKgXGXaU4zUqjrQAeACuLzIvhfQSowYbfRfk5h6lpccEIJIDESCQboc0Om0/aJgVhEM6h5odzKxHIBTBYkwiRLM8OU2ASAa6NKeOWkmsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBSM4hQZkl6jjiuYE4EbWuJePb0v9sgXEMM/2Rgsli0=;
 b=JSXXiGqTIVpde/Z8wLeWtCzZTB2FPW4LTGo99tqhpXA/tgwqU9zLKbN35KtxsoUm5B4LkPTwLGaSIioj9MAOIgpznmu0ufYxagIMZPQ/rbUICMIl59ynhM1MIRxClGUfKru+kAgFTISiCoup9O13tS0EkS3EurZNd9Q/OJS7joysrWc2fI6IOjB3SRQYb+byYg/1ErS3e7dQmdhyqiytNkf8ONn2hflhN5Licaaq/o8NnWWG0zTfVfx7dg3ahgRRwbpgsc2G/95QSGnq5hz+V1g2/UOB/BHcDPpPamg6FBhYXOaAR38tSght9M0Jc2a94iJACt5MvbcHDos2HUTDmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.40) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBSM4hQZkl6jjiuYE4EbWuJePb0v9sgXEMM/2Rgsli0=;
 b=LXJkD3vbyzNPTES93/OPCKiKPQsF3CYG+bs0im88gdYGFw8x7AU63R6aJ1p+lFv9DBWcTvXvj7nff0kcfBMCKYt9U17/dMgCRk/lJWxkKbioesVZnnqRat+aA0pIS/gUpbpU7aqTIhAk5pHpc3hmuJ/djDX7a79oclmr0aRi8jvsxAMWM6t3wm1hoqHJbi4XUCCzA5xWbLk0TIhTBxioamws7EaObtIVdP+WN71zQWP9HSe+tV9rB3/drf++zOy983kT4EWBOI+Vj0MY8ltNsDJHAVuuFuOUMKj7v0AEWjlDMnte9QC/SaC1/suweEepl3VXSmBGU2UMuAMOdlhQdA==
Received: from AS4PR10CA0023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::15)
 by AS2PR10MB6926.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:57a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 12:47:34 +0000
Received: from AM2PEPF0001C70D.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::d) by AS4PR10CA0023.outlook.office365.com
 (2603:10a6:20b:5d8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 12:47:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.40)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.40 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.40; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.40) by
 AM2PEPF0001C70D.mail.protection.outlook.com (10.167.16.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 12:47:33 +0000
Received: from EQNDAG1NODE4.st.com (10.75.129.133) by smtpO365.st.com
 (10.250.44.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 14:47:39 +0200
Received: from localhost (10.252.15.38) by EQNDAG1NODE4.st.com (10.75.129.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 14:47:29 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 17 Oct 2025 14:47:20 +0200
Message-ID: <20251017124727.165192-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.252.15.38]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70D:EE_|AS2PR10MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: b1667d6d-998f-4ccc-0f38-08de0d7b57b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/9PAgbAEkr9UG96HSA+Li1kEyaXx/A7F0csuaCZnd2+pS70ymrDvPe3342pz?=
 =?us-ascii?Q?cmw0xR1TIZPZtm4xjIPG2N2XxwHhDvJKN/VwgimUgwX1YY0Ko7qsSBZRdpge?=
 =?us-ascii?Q?VXJ7XYG+jqFWSbQFIE5hG2co/wyjrQCbu4Iyhd/U92c5B0pbmVffaxXWoM+6?=
 =?us-ascii?Q?nYH2/w3BTsHGQiWkx09glvqwhgt1z6JDNL7OW03069evdgsVugAWe8JX43S8?=
 =?us-ascii?Q?LFvfRbTqxoidjrwQgMoXXsGrt8hBn6iF9zEldC9rlApjYlFbWOOqRFyz1t5f?=
 =?us-ascii?Q?h0b4lCo2BEUZ7BtHLQscw2rf8HExAYmwTFkLXorVgKSVa5SMB46ybjR5FREa?=
 =?us-ascii?Q?zXjT5AiZY7QYlM3Xo2kqdCDFfArZ41XqfR5jDy6TFVyFNzxX0X+1qSMOmkij?=
 =?us-ascii?Q?BMFoewWPjl6XP4WdOtHv75QiPNPdPAnadejDJoURRmTcEB3UExi/HEvJmZZ8?=
 =?us-ascii?Q?MAkEE+Zc1NKaJFOJj7RFXZK2p5xay97Kwrwpu5PCIyOXe/75CuEmafCbBWFl?=
 =?us-ascii?Q?fojB1NRTI3pW68Yl8gALI8BGSnF5m/szis048qefZHXNWC5rq1Uz/pzgpZl/?=
 =?us-ascii?Q?zsWphbgZ+h8wN6hylX8tWRchbr2e5Eg+CaJPvwMxwusUiTqaizjo1BWZPDom?=
 =?us-ascii?Q?v2NvYoWmmvS0wI3OMvkEv6SkMPHR1DJbMfdCpVJqGLOkHE8W+SNG33bhJiQ/?=
 =?us-ascii?Q?T2kdn/cXHMhP0PRlRMVNQyV9H8SQx3fhMkOTuMP+LOE7FEy3TWJaU/4b+Nbm?=
 =?us-ascii?Q?SSFisb7+xphppQhOtmYC/LRJSOJcQYRCP3l9y7+FQb1yCAS6q6vsFCL0BLrU?=
 =?us-ascii?Q?F/IgJ1GUP8WK2DzQ4fbXLIbc+kUClHfj5mMUiOAtX00C2WzpkHVKlIsaSBhf?=
 =?us-ascii?Q?vfl/5vuU1bPC0FNzi9aoxhQNNTWkrPeqpMGZrwnCIVW4iF8cZMzXFcNgCzlA?=
 =?us-ascii?Q?DKnGISFDLXorju9sM04fOGmq309VqMoBzF9G336a+SAl1kJiK7ALsPn53+Js?=
 =?us-ascii?Q?XYYUhvlz1aIlipmiLLaFu1qWvk+apSTu+7/onpDwsvfCyiXvwOmT/VN+gp8P?=
 =?us-ascii?Q?ImMaTDXrabssyqTEonYhgwIW5iv2C55m/16nmYdSjZ/+mwe5+Tp9X9M2WpjZ?=
 =?us-ascii?Q?N67m/SW3q+uGhzsPUqaH0bXsSPb0jPqBNaaeYJOWdtKYddi9c0zkHE7hE1Aa?=
 =?us-ascii?Q?UEptT2wi8N9r5azasePreH2K+Tt0VYqqzMT24lnEWAJc2F9gr7UnG3XhWIrJ?=
 =?us-ascii?Q?NQD+14GkkWY9S9t5hz7t2p2b3NOeVQrCxVocR33EmFInLyKvmcdaVJtxT5Tg?=
 =?us-ascii?Q?9pYNFce+eB2Okngtb4hqUlGo5CChpyDogyLsrCb96oKmNwkEEjg4Aavx92HY?=
 =?us-ascii?Q?GqrN5w5c68GEPp/VAfa2MJ6U77N9bJyXDal8pKIsSeK9CEoHNywo7GZK9bGc?=
 =?us-ascii?Q?+XE9aUEVMGMCIuDN14YCt+sEgJNkblGggWf1g0lqpNI7D/9MddsW0Js1on2f?=
 =?us-ascii?Q?FjO+hUSGjyHtxIrzQdXuqUuK/ALZ1rhoageUWq0pKG7JZgOjWDUjF9aIHQ6A?=
 =?us-ascii?Q?m8IAoKkn0XKt+m+xLzA=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.40; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 12:47:33.5330 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1667d6d-998f-4ccc-0f38-08de0d7b57b0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.40];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6926
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA5MCBTYWx0ZWRfXxhmrAEPCnO+W
 UM7+ddkuVDE0qNTA1TW6MR21Z3a6CG5GOR6pthktVUCvzWq81CbrKTjqSh0Amv9hQLClLdt41TV
 hczpnWHbjNEy71aAhkjjqpPaRwKQ9FWTaQGFGFwXYIG4Fwut8vIQ2mYCAYftCCP3ixLxXRuIjhH
 jgR0eEay9gG9mjnk83i9CEOS19amPDjmQSqgNZWOejOJQlgwtJPqzOYBC3D9slRGJzDfaQXGBjz
 tP94nP2CQL6b3pu62E8eco4s28Pm4xV2F0ZCpble/Ae+zH3OD57wOMFusyHp18yA16X/zlsJsMf
 XciradKc0S1NNYKjYhgpTqEe5FxgtMVlUybE038MzuDZ+O7v3aInkG121Z5+398AIAaVFAunqkH
 FffdqXnbL4rLjk3YOkwyveAxmOmw8w==
X-Proofpoint-ORIG-GUID: bOdRW4qggKtK3gVVLc1arf3NPqsrplYy
X-Proofpoint-GUID: bOdRW4qggKtK3gVVLc1arf3NPqsrplYy
X-Authority-Analysis: v=2.4 cv=eoPSD4pX c=1 sm=1 tr=0 ts=68f23ae8 cx=c_pps
 a=RmHue97ipze0icY0clRZTA==:117 a=HHWmdgNZ66UcX3Fjl3KRHg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=gt-GhcMM7esA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=8b9GpE9nAAAA:8 a=f2hD7jiOUhbjUgPHKRkA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160090
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 1/2] ARM: dts: Remove u-boot,
	boot-led from stm32mp257f-ev1-u-boot
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

Since commit 69542d06920b ("led: update LED boot/activity to new
property implementation"), "u-boot,led-boot" property is no more
supported, remove it.

It will be replace by /options/u-boot to configure LED device as
described here [1]. /options/u-boot will be added directly in kernel
device tree.

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/options/u-boot.yaml

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
index 7bbb3e00351..b70cd8b52ce 100644
--- a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
@@ -7,7 +7,6 @@
 
 / {
 	config {
-		u-boot,boot-led = "led-blue";
 		u-boot,mmc-env-partition = "u-boot-env";
 	};
 };
-- 
2.43.0

base-commit: f6b80515465bf054eca80f90b383b2e13f979055
branch: upstream_remove_obsolete_LED_property_from_stm32mp2_boards
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
